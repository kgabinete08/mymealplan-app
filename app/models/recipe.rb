class Recipe < ActiveRecord::Base
  include Sluggable

  belongs_to :user

  has_many :comments
  has_many :meal_plan_recipes
  has_many :meal_plans, through: :meal_plan_recipes
  has_many :votes

  validates :title, presence: :true, uniqueness: :true, length: {minimum: 5}
  validates :description, presence: :true
  validates :ingredients, presence: :true
  validates :directions, presence: :true

  sluggable_column :title

  def upvotes
    self.votes.where(vote: true).size
  end

  def downvotes
    self.votes.where(vote: false).size
  end
end