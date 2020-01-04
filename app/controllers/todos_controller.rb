class TodosController < ApplicationController
  before_action :authorized
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

  private

  def permit_todo
    params.require(:todo).permit(:todo)
  end
end
