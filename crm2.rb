require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/home' do
  redirect to('/')
end

get '/about' do
  erb :about
end

post '/contacts' do
  puts params
  Contact.create(first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    note: params[:note])
  redirect to('/contacts')
end



get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end


get '/contacts/new' do
  erb :add_contact
end




get '/contacts/:id' do
  # params[:id] contains the id from the URL

  @contact = Contact.find(params[:id].to_i)
    if @contact
      erb :show_contact
    else
      raise Sinatra::NotFound
    end
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.update(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
    )

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end





after do
  ActiveRecord::Base.connection.close
end
