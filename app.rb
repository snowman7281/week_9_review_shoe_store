require("bundler/setup")
Bundler.require(:default)
require 'pry'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get "/" do
  @stores = Store.all
  @shoes = Shoe.all
  erb(:index)
end

post "/store" do
  name = params["name"]
  if !name.empty?
    @store = Store.new({name: name})
    @store.save
  end
  @stores = Store.all
  @shoes = Shoe.all
  erb(:index)
end

post "/shoe" do
  brand = params["brand"]
  price = params["price"]
  if !brand.empty?
    @shoe = Shoe.new({brand: brand, price: price})
    @shoe.save
  end
  @shoes = Shoe.all
  @stores = Store.all
  redirect "/"
end


get "/stores/:id" do
  @store = Store.find(params[:id])
  @shoe_list = Shoe.all
  @shoes = @store.shoes
  erb(:stores)
end

post '/shoe/add/:id' do
  @store = Store.find(params[:id])
  @shoe = Shoe.find(params["shoe_id"])
  @store.shoes
  @shoe.stores.push(@store)
  @shoes = @store.shoes
  redirect back
end

patch "/stores/:id/edit" do
  @store = Store.find(params[:id])
  @store.update({name: params["name"]})
  redirect back
end

delete "/stores/:id/delete" do
  @store = Store.find(params[:id])
  @store.delete
  redirect "/"
end

get "/shoes/:id" do
  @shoe = Shoe.find(params[:id])
  erb(:shoes)
end

patch "/shoes/:id/edit" do
  @shoe = Shoe.find(params[:id])
  @shoe.update({price: params["price"]})
  redirect back
end

delete "/shoes/:id/delete" do
  @shoe = Shoe.find(params[:id])
  @shoe.delete
  redirect "/"
end
