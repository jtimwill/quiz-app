class UserQuizzesController < ApplicationController

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @user_quiz = @quiz.user_quizzes.build(user_quiz_params)
    @user_quiz.user_id = current_user.id
    id = @user_quiz.id

    score = 0.00

    @quiz.questions.each_index do |index|
      if @quiz.questions[index].answer == @user_quiz.user_answers[index].answer
        score = score + 1
      end
    end

    percent_right = (score/@quiz.questions.size)*100
    @user_quiz.score = percent_right

    if @user_quiz.save
      flash[:notice] = "User quiz was created"
      redirect_to user_path(current_user)
    else
      render 'quizzes/show'
    end
  end 

  def show
    @user_quiz = UserQuiz.find(params[:id])
  end

  


  private 

  def user_quiz_params
    params.require(:user_quiz).permit(:score, user_answers_attributes: [:question_id, :answer])
  end

end