class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(task_params)
    @tasks.save

    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to tasks_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
#  before_action :find_tasks, only: %i[show edit update destroy]

#   def indexend
#     @restaurants = Task.all
#   end

#   def show; end

#   def new
#     @tasks = Task.new
#   end

#   def create
#     @tasks = Task.new(restaurant_params)

#     @tasks.save

#     redirect_to restaurants_path
#   end

#   def edit; end

#   def update
#     @tasks.update(tasks_params)

#     redirect_to restaurant_path(@tasks)
#   end

#   def destroy
#     @tasks.destroy
#     redirect_to tasks_path
#   end

#   private

#   def tasks_params
#     params.require(:tasks).permit(:title, :details, :completed)
#   end

#
