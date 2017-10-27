# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    tasks = Task.available
    render locals: { tasks: grouped_hash(tasks) }
  end

  def create
    task = Task.create(task_create_params)
    render partial: task, locals: { task: task }, status: 201
  end

  def update
    task = Task.find(params[:id])
    task.update_attributes(task_update_params)
    render json: { task: task.to_json, errors: task.errors }
  end

  def destroy
    task = Task.find(params[:id]).destroy
    render locals: { task: task }, layout: false
  end

  private

  def task_create_params
    params.require(:task).permit(:title, :body)
  end

  def task_update_params
    params.require(:task).permit(:title, :body, :status)
  end

  def grouped_hash(tasks)
    { initial: [], in_progress: [], done: [] }
      .merge(tasks.group_by(&:status).symbolize_keys)
  end
end
