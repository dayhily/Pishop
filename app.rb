#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#Устанавливаем соединение с БД
set :database, "sqlite3:pishop.db"

#Cоздание модели БД в классе Client
class Product < ActiveRecord::Base
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
	erb :cart
end