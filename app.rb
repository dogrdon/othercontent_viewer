require 'sinatra'
require 'mongo'
require 'json/ext'
require_relative 'db/config'


not_found do
	"404 - nothing here"
end

helpers do

	def document_by_id id
		id = id.to_i
		if id.nil?
			{}.to_json
		else
			document = settings.mongo_db.find(:docid => id).to_a.first
			(document || {}).to_json
		end
	end

end

get '/' do
	settings.mongo_db.find.to_a.to_json
end

get '/thing/:id/?' do
	document_by_id(params[:id])
end	



    

