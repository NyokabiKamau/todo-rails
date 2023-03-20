class TasksController < ApplicationController
    
    def get_tasks
       render json: Task.all
    end

    def create
        # title = task_params[:title]
        # description = task_params[:description]
        # priority = task_params[:priority]

        # # add task to DB
        # task = Task.create(title: title, description: description, priority: priority)

        task = Task.create(task_params)
        render json: task

    end

    def update
        id = params[:id]
        task = Task.find(id.to_i)
        task.update(task_params)
        render json: { message: "updated Task successfully"}
    end

    # TODO: Add delete method

    def delete
        id = params[:id]
        task = Task.find(id.to_i)
        task.destroy
        render json: { message: "deleted Task successfully"}
    end

    private
    def task_params
        params.permit(:title, :description, :priority, :status)
    end
end
