class TodosController < ApplicationController
  before_action :authorized
  before_action :fetch_todo, only: [:destroy, :edit, :update, :index]
  before_action :all_todos, only: [:index, :edit]

  def index
    @todo = Todo.new
  end

  def new
  end

  def edit
    render 'index'
  end

  def create
    @todo = current_user.todos.create(permit_todo)

    if @todo.save
      redirect_to '/todos'
    else
      puts @todo.errors.messages
    end
  end

  def update
    if @todo.update(permit_todo)
      redirect_to '/todos'
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
    if params.has_key?(:id)
      @todo = Todo.find(params[:id])
    end
  end
  def all_todos
    @todos = current_user.todos
  end
end
