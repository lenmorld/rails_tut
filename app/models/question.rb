class Question < ApplicationRecord
    def gravatar
        # note that email and other Question members are directly accessible here

        "#{Digest::MD5.hexdigest(email)}"
    end
end
