class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.all
  end

  def create
    Task.create(task_params)
    redirect_to :back
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    task = Task.find params[:id]
    if task.update_attributes task_params
      redirect_to tasks_path, notice: 'Task updated.'
    else
      redirect_to :back, notice: 'There was an error.'
    end
  end

  def destroy
    task = Task.find params[:id]
    task.destroy
    redirect_to :back, notice: 'Task deleted.'
  end

  private

    def task_params
      params.require(:task).permit(:task)
    end
end
