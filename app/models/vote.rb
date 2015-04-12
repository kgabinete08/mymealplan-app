class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates :user, uniqueness: { scope: [:user_id, :recipe_id] }
end