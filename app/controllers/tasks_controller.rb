class TasksController < ApplicationController
    
    def get_tasks
        email = session[:email]
        if email
            render json: Task.all
        else
            render json: { message: "Not authorized"}, status: 401
        end
    end

    def create

        user = cookies[:email]
        if user
            task = Task.create(task_params)
            if task.valid?
                render json:task, serializer: TaskSerializer
            else
                render json: task.errors
            end
        else
            render json: { message: "you are not logged in"}, status: 401
        end

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
