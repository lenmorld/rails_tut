require 'test_helper'

class MainMailerTest < ActionMailer::TestCase
  test "notify_question_author" do

    # fixtures
    question = Question.create email: 'author@question.com', body: 'a test question'
    answer = Answer.create email: 'author@answer.com', body: 'a test answer'

    question.answers << answer

    mail = MainMailer.notify_question_author(answer)
    assert_equal "New comment on your post", mail.subject

    assert_equal [question.email], mail.to  # receiver
    assert_equal [answer.email], mail.from  # sender

    # byebug
    assert_match answer.body, mail.body.encoded
  end

end
