class ListsController < ApplicationController
  respond_to :json
  
  expose(:list)
  expose(:lists){ List.all }
  
  def index
    respond_with(lists)
  end
  
  def create
    if list.save
      render :json => list.as_json(:only => [:id, :name])
    else
      render :json => {:status => :unprocessable_entity, :errors => list.errors.full_messages}
    end
  end
end
