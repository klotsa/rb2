require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

#validates alphabetic input only



#home page
get('/') do
  @instructions = Instruction.all()
  erb(:index)
end

#view all recipes
get('/recipes') do
  @instructions = Instruction.all()
  erb(:recipes)
end


#sort by rating
get('/recipes/rating') do
  @recipes_by_rating = Instruction.order(rating: :desc)
  erb(:rating)
end

#add a new recipe
get('/recipes/new') do
  erb(:recipes_form)
end

#post new recipe
post('/recipes') do
  new_name = params.fetch('name')
  @new_recipe = Instruction.create({:name => new_name})
  if @new_recipe.save()
    redirect to("/recipes")
  else
    erb(:error)
  end
end

#individual recipe
get('/recipes/:id') do
  @instruction = Instruction.find(params.fetch('id').to_i())
  @ingredients = @instruction.ingredients
  erb(:recipe)
end

#show all recipes by the tag
get('/tags/:id') do
  @tag = Tag.find(params.fetch('id').to_i())
  @recipes = @tag.instructions
  erb(:tags)
end

#list all ingredients
get('/ingredients') do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post('/recipes/:id/add_tag') do
  @instruction = Instruction.find(params.fetch('id').to_i())
  description = params.fetch("description")
  @instruction.tags.create({:description => description})
  redirect("/recipes/".concat(params.fetch("id").to_s()))
end

patch('/recipes/:id/update_rating') do
  @instruction = Instruction.find(params.fetch('id').to_i())
  rating = params.fetch("rating")
  id = params.fetch("id")
  @instruction.update({:rating => rating})
  redirect("/recipes/".concat(params.fetch("id").to_s()))
end

delete('/recipes/:id') do
  @instruction = Instruction.find(params.fetch('id').to_i())
  @instruction.delete()
end

post('/recipes/:id/add_ingredient') do
  @instruction = Instruction.find(params.fetch('id').to_i())
  name = params.fetch("ingredient")
  @instruction.ingredients.create({:name => name})
  redirect("/recipes/".concat(params.fetch("id").to_s()))
end

get('/recipes_by_rating') do
  @instructions = Instruction.order(rating: :desc)
  erb(:recipes_by_rating)
end

delete('/recipes/:id/remove_from_instruction/:ingredient_id') do
  @ingredient = Ingredient.find(params.fetch('ingredient_id').to_i())
  @instruction = Instruction.find(params.fetch('id').to_i())
  @instruction.ingredients.delete(@ingredient)
end
