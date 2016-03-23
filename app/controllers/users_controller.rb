class UsersController < ActionController::Base
  before_action :authenticate_user!
  

  def index
 
    @users = User.all
    
    
  end

  def show
    @questions = Question.all
    @user = User.find(params[:id])
    @questions = Question.select("id, description").where(:user_id => params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied." 
     
  end
  end
private

  def user_params
    params.require(name_class).permit(:email, :password,:password_confirmation, { questions_ids: [] })
  end
  

end
