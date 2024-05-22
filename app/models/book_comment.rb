class BookComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :b
end
