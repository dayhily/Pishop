#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#Устанавливаем соединение с БД barbershop.db
set :database, "sqlite3:base.db"

#Cоздание модели БД в классе Client
class Programm_lang < ActiveRecord::Base

get '/' do
	erb :index
end

get '/about' do
	erb :about
end