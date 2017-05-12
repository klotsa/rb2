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
  #@prices = @store.prices
  erb(:store)
end

#edit a store
get('/stores/:id/edit') do
  @store = Store.find(params.fetch('id').to_i())
  erb(:store_edit_form)
end

#update individual store
patch('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  update_name = params.fetch('name')
  @store.update({:name => update_name})
  @stores = Store.all()
  erb(:stores)
end

#delete individual store
delete('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @store.delete()
  @stores = Store.all()
  erb(:stores)
end

#post a brand
post('/stores/:id/add_brand') do
  @store = Store.find(params.fetch('id').to_i())
  name = params.fetch("brand")
  price = params.fetch("price").to_f()
  @store.brands.create({:name => name, :price => price})
  redirect("/stores/".concat(params.fetch("id").to_s()))
end


#list all brands
get('/brands') do
  @brands = Brand.all()
  erb(:brands)
end

#individual brand
get('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i())
  @price = @brand.price
  erb(:brand)
end

#delete brand
delete "/brands/:id" do
  @brand = Brand.find(params.fetch('id').to_i())
  @brand.delete()
  @brands = Brand.all()
  erb(:brands)
end




delete('/stores/:id/remove_from_store/:brand_id') do
  @brand = Brand.find(params.fetch('brand_id').to_i())
  @store = Store.find(params.fetch('id').to_i())
  @store.brands.delete(@brand)
end
