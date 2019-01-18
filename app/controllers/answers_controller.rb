class AnswersController < ApplicationController

    def create
        Answer.create(answer_params)
        redirect_to root_path
    end

    private

    def answer_params
        params.require(:answer).permit(:question_id, :email, :body)
    end

end
