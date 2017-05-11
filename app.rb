require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @instructions = Instruction.all()
  erb(:index)
end

get('/recipes') do
  @recipes_by_rating = Instruction.order(rating: :desc)
  erb(:recipes)
end

get('/recipes/:id') do
  @instruction = Instruction.find(params.fetch('id').to_i())
  erb(:recipe)
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
