class Question < ApplicationRecord
    has_many :answers

    def gravatar
        # note that email and other Question members are directly accessible here
        "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}?s=64&d=identicon"
    end
end
