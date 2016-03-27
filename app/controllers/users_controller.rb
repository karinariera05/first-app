class UsersController < ApplicationController
  before_action :authenticate_user!
  

  def index
 
    @users = User.all
    
    
  end

  def show
   if user_signed_in?
    @questions = Question.all
    @user = User.find(params[:id])
    @questions = Question.select("id, description").where(:user_id => params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
   else
     
     #@questions = Question.all
     @user = User.find(params[:id])
     @questions = Question.select("id, description").distinct(:user_id => params[:id])
    
   end    
     
  end
  end
private

  def user_params
    params.require(name_class).permit(:email, :password,:password_confirmation, { questions_ids: [] })
  end
  

end
