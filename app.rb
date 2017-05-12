require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

#validates alphabetic input only


#home page
get('/') do
  @stores = Store.all()
  erb(:index)
end

#view all stores
get('/stores') do
  @stores = Store.all()
  erb(:stores)
end

#add a new store
get('/stores/new') do
  erb(:stores_form)
end

#post new store
post('/stores') do
  new_name = params.fetch('name')
  @new_store = Store.create({:name => new_name})
  if @new_store.save()
    redirect to("/stores")
  else
    erb(:error)
  end
end

#individual store
get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @brands = @store.brands
  erb(:store)
end

#list all brands
get('/brands') do
  @brands = Brand.all()
  erb(:brands)
end


#post a brand
post('/brands/:id/add_brand') do
  new_name = params.fetch("brand")
  @new_brand = Brand.new({:name => new_name})
    if @new_ingredient.save()
      redirect("/brands/:id")
    else
      erb(:error)
    end
end



delete('/stores/:id') do
  @stores = Store.find(params.fetch('id').to_i())
  @store.delete()
end


delete('/stores/:id/remove_from_store/:brand_id') do
  @brand = Brand.find(params.fetch('brand_id').to_i())
  @store = Store.find(params.fetch('id').to_i())
  @store.brands.delete(@brand)
end
