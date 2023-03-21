class TasksController < ApplicationController
    
    def get_tasks
       render json: Task.all
    end

    def create

        todo = Task.create(todo_params)
        if todo.valid?
            render json:todo, serializer: TaskSerializer
        else
            render json: todo.errors
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
