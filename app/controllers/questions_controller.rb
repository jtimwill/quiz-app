class QuestionsController < ApplicationController
  before_action :require_admin

  def index
    @question = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "Your question was created"
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
   
  end 

  def update
    @question = Question.find(params[:id])
    if @question.update(post_params)
      flash[:notice] = "The question was updated"
      redirect_to question_path(@question)
    else
      render :edit
    end
  end 

  private

  def question_params
    params.require(:question).permit(:question, :answer)
  end

end