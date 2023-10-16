class ExpensesController < ApplicationController
    before_action :set_group, only: [:index, :new, :create]
    before_action :set_expense, only: [:show, :edit, :update, :destroy]


    def index
        @expenses = @group.expenses.all.order("created_at DESC")
    end
    
    def new
        @expense = @group.expenses.new
    end
    
    def create
        @expense = @group.expenses.new(expense_params)
        @expense.user_id = current_user.id
    
        respond_to do |format|
          if @expense.save
            format.html { redirect_to group_expenses_path(@group), notice: 'Your transaction has been successfully created.' }
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        end
    end
    
    private

    def set_group
        @group = Group.find(params[:group_id])
    end
    
    def set_expense
        @expense = Expense.find(params[:id])
    end
    
    def expense_params
        params.require(:expense).permit(:name, :amount)
    end
end
