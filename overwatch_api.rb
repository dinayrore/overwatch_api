require 'sinatra'
require 'active_record'
require_relative 'environment'
require_relative 'character'

# GET /api/characters - return individual/all characters as JSON
get '/api/characters' do
  name = params['name']
  role = params['role']

  if !name.nil? && !role.nil?
    characters = Character.where(name: name, role: role)
  elsif !name.nil?
    characters = Character.where(name: name)
  elsif !role.nil?
    characters = Character.where(role: role)
  else
    characters = Character.all.order(role: :ASC)
  end

  characters.to_json
end

# POST /api/characters - create a character, read request body as JSON
post '/api/characters' do
  Character.create(name: params['name'], role: params['role']).to_json
end

# PUT /api/characters - update a character, read request body as JSON
put '/api/characters' do
  name = params['name']
  role = params['role']
  new_name = params['new_name']
  new_role = params['new_role']

  characters = Character.find_by(name: name, role: role)
  characters.update(name: new_name, role: new_role)
  characters.to_json
end

# DELETE /api/characters - delete task, return success/failure status code
delete '/api/characters' do
  characters = Character.find_by(name: params['name'], role: params['role'])
  characters.destroy
end
