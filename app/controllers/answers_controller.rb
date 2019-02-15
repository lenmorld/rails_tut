class AnswersController < ApplicationController

    def create
        question = Question.find(params[:answer][:question_id])
        
        answer = Answer.create(answer_params)
        # question.answers.create(answer_params)

        # prepare email then send it
        # MainMailer.notify_question_author(answer).deliver_now

        # ActiveJob so user won't wait
        MainMailer.notify_question_author(answer).deliver_later

        # save email in session
        session[:current_user_email] = answer_params[:email]

        # rails figures out which URL to use given the question
        redirect_to question
    end

    private

    def answer_params
        params.require(:answer).permit(:question_id, :email, :body)
    end

end
