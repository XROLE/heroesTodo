class TodosController < ApplicationController
  before_action :authorized
  before_action :fetch_todo, only: [:destroy]
  def index
    @todos = Todo.all
  end
  def new
  end

  def create
    @todo = current_user.todos.build(permit_todo)

    if @todo.save
      redirect_to '/todos'
    else
      puts @todo.errors.messages
    end
  end

  def destroy
    @todo.destroy
    redirect_to '/todos'
  end

  private

  def permit_todo
    params.require(:todo).permit(:todo)
  end
  def fetch_todo
    @todo = Todo.find(params[:id])
  end
end
