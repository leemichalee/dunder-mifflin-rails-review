class EmployeesController < ApplicationController
    def index
        @employees = Employee.all 
        render :index
    end

    def show
        @employee = Employee.find(params[:id])
        render :show
    end

    def new
        @employee = Employee.new
        render :new
    end

    def create
        @employee = Employee.create(employee_params)
        if @employee.valid? 
            redirect_to employee_path(@employee)
        else
            flash[:new_key] = @employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    def edit
        @employee = Employee.find(params[:id])
        render :edit
    end

    def update
        @employee = Employee.update(employee_params)
        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else
            flash[:new_key] = @employee.errors.full_messages
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end

end
