class QuestionsController < ApplicationController
    def create
        #  NOT SECURE!
        # Question.create(params[:question])

        Question.create(question_params)
        redirect_to root_path
    end

    def show
        # params is automatically accessible here
        @question = Question.find(params[:id])
    end

    private

    def question_params
        params.require(:question).permit(:email, :body)
    end
end
