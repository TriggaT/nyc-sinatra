class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  post '/landmarks' do 
    @landmark = Landmark.create(params[:landmark])
    if !params["figure"]["name"].empty?
      Figure.create(name: params["figure"]["name"]).landmarks << @landmark
    end
  
    @Figure.save

    

    redirect "/landmarks/#{@landmark.id}"

  end 

  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])

    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])

    
    erb :'/landmarks/edit'
  end 

  patch "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])

    @landmark.update(params[:landmark])
    if !params["figure"]["name"].empty?
      Figure.create(name: params["figure"]["name"]).landmarks << @landmark
    end

    binding.pry
    
  
    @landmark.save




    

    redirect "/landmarks/#{@landmark.id}"
  end 

end
