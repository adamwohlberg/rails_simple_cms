class AdminUsersController < ApplicationController
  
  layout 'admin'

  before_action :confirm_logged_in

  def index
  	@admin_users = AdminUser.sorted
  end

  def new
  	@admin_user = AdminUser.find(params[:id])
  end

  def create 
  	@admin_user = AdminUser.new(:name => "Adminy Takminabad") 
   	@admin_user_count = AdminUser.count
  end

  def edit
  	@admin_user = AdminUser.find(params[:id])
  	@admin_user_count = AdminUser.count
  end

  def update
  	@admin_user = AdminUser.find(params[:id])
  end

  def delete
   	@admin_user = AdminUser.find(params[:id])
  end

  def destroy
   	@admin_user = AdminUser.find(params[:id])

  end

  private

    def admin_user_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      # params.require(:subject).permit(:name, :position, :visible, :created_at)
    end
end
