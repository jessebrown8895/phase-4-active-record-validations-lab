class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :clickbait
    
    def clickbait
        titles = [/Won't Believe/i,/Secret/i,/Top \d/i,/Guess/i] 
        if titles.none? {|phrase| phrase.match title } 
            errors.add(:title, "Not a valid title")
        end
    end 
end
