class TodosController < ApplicationController
  respond_to :json
  
  expose(:list)
  expose(:todos){ list.todos }
  expose(:todo)
  
  def index
    respond_with(todos)
  end
  
  def create
    todo.list_id = list.id
    if todo.save
      render :json => todo
    else
      render :json => {:status => :unprocessable_entity, :errors => todo.errors.full_messages}
    end
  end
  
  def update
    if todo.update_attributes(params[:todo])
      render :json => todo
    else
      render :json => {:status => :unprocessable_entity, :errors => todo.errors.full_messages}
    end
  end
  
  def destroy
    todo.destroy
    render :json => todo
  end
  
end
