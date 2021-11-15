#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base

end

class Barber < ActiveRecord::Base

end

class Contact < ActiveRecord::Base

end

before do
	@barbers = Barber.order "created_at DESC"
end

def save_form_data_to_database
	Client.create   :name  		=>  "#{@user_name}",				   
					:phone 		=>  "#{@phone}",				   
					:datestamp 	=>  "#{@date_time}",				   
					:barber 	=>  "#{@hairdresser}",				   
					:color		=>  "#{@color}"
end

get '/' do
	erb :index
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do

		@user_name   = params[:user_name]
		@phone       = params[:phone]
		@date_time   = params[:date_time]
		@hairdresser = params[:hairdresser]
		@color		 = params[:color]

		save_form_data_to_database

	erb :visit
end

post '/contacts' do

	@contacts_name = params[:contacts_name].capitalize
	@contacts_mail = params[:contacts_mail]
	@contacts_text = params[:contacts_text]

	erb :contacts
end