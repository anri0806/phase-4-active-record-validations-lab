class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    validate :must_contain_words

    CLICKBAIT = [/Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i]

    def must_contain_words
        if CLICKBAIT.none? {|pat| pat.match title}
            errors.add(:title, "Must contain these words: won't believe, secret, top, guess")
        end
    end


end
