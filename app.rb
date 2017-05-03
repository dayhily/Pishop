#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#Устанавливаем соединение с БД
set :bind, '0.0.0.0'
set :database, "sqlite3:pishop.db"

#Cоздание модели БД в классе Client
class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

class Shipment < ActiveRecord::Base
  validates :scope, presence: true
  validates :name, presence: true
  validates :phone, presence: true
  validates :address, presence: true
end

#Создание миграции БД в терминале "$ rake db:create_migration NAME=имя модели во множественном числе"

#$ rake db:create_migration NAME=create_products
#Создание структуры таблицы (поля) в /db/migrate

#$ rake db:create_migration NAME=add_products
#Создание структуры таблицы (поля) в /db/migrate

#Миграция схем в БД "$ rake db:migrate"


get '/' do
	@products=Product.all
	erb :index
end

post '/' do
	redirect to ('/')
end

get '/about' do
	erb "about"
end

post '/cart' do
  @orders_input = params[:orders]
  @items = parse_orders_input @orders_input

 # выводим сообщение о том, что корзина пуста
  if @items.length == 0
    return erb :cart_is_empty
  end

  @items.each do |item|
    # id, cnt
    item[0] = Product.find(item[0])
  end

  erb :cart
end

post '/place_order' do
  @shipment = Shipment.new params[:order]

  if @shipment.save
    erb :order_placed
  else
    @error = @shipment.errors.full_messages.first
    erb "Error"
  end
end

#разбиваем строчку заказа orders_input на id продукта и количесво
def parse_orders_input orders_input 
  s1 = orders_input.split(/,/)

  arr = []

  s1.each do |x|
    s2 = x.split(/\=/)

    s3 = s2[0].split(/_/)

    id = s3[1]
    cnt = s2[1]

    arr2 = [id, cnt]

    arr.push arr2
  end

  return arr
end