class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update]
  before_action :require_user, except: [:index]
  before_action :require_admin, except: [:show, :index]

  def index
    @quiz = Quiz.all
  end

  def show
    @user_quiz = UserQuiz.new
    @user_quiz.user_answers.build
    # @user_answer = UserAnswer.new
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      flash[:notice] = "Your quiz was created"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @quiz = Quiz.all
  end

  def update
    if @quiz.update(post_params)
      flash[:notice] = "The quiz was update"
      redirect_to quiz_path(@quiz)
    else
      render :edit
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:category, :length, question_ids: [])
  end

  def set_quiz
    @quiz = Quiz.find_by slug: params[:id]
  end

end 

