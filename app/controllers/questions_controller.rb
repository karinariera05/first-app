class QuestionsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @question = Question.new
  end
  def index
    @question = Question.all
  
  end
  def create
    @description = params[:question][:description]
    @user = User.find(params[:user_id])
    @question = Question.new({
      :description => @description,
      :user => @user
   });
   if @question.save()
      redirect_to @user, :notice => "La Pregunta ha sido insertada"
   else
      render "new"
   end
  end

  def show 
    @question = Question.all
  end
  
  def edit
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
    @description = @question.description
  end

  def update
    @description = params[:question][:description]
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
    @question.description = @description
    if @question.save()
       redirect_to @user, :notice => "La pregunta ha sido modificada"
    else
       render "edit"
   end
  end

  def destroy
    @user = User.find(params[:id])
    @question = Question.find(params[:id])
    if @question.destroy()
       redirect_to @user, :notice => "La pregunta ha sido eliminada"
    else
       redirect_to @user, :notice => "La pregunta no se ha podido eliminar"
    end
    end
  
end
