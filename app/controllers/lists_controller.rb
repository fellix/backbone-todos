class ListsController < ApplicationController
  respond_to :json
  
  expose(:list)
  expose(:lists){ List.all }
  
  def index
    respond_with(lists)
  end
  
  def create
    if list.save
      render :json => list
    else
      render :json => {:status => :unprocessable_entity, :errors => list.errors.full_messages}
    end
  end
  
  def update
    if list.update_attributes(params[:list])
      render :json => list
    else
      render :json => {:status => :unprocessable_entity, :errors => list.errors.full_messages}
    end
  end
  
  def destroy
    if list.todos.empty?
      list.delete 
      render :json => list
    else
      raise "Can't delete that"
    end
  end
end
