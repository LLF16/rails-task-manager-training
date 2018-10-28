class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    set_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.find(tasks_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    set_task
  end

  def update
    set_task
    @task.update(tasks_params)
    redirect_to tasks_path
  end

  def destroy
    set_task
    @tasks.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
