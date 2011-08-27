class TodosController < ApplicationController
  respond_to :json
  
  expose(:list)
  expose(:todos){ list.todos.select("id, name, done") }
  expose(:todo)
  
  def index
    respond_with(todos)
  end
  
  def create
    todo.list_id = list.id
    if todo.save
      render :json => todo.as_json(:only => [:id, :name, :done])
    else
      render :json => {:status => :unprocessable_entity, :errors => todo.errors.full_messages}
    end
  end
  
end
