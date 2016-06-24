class Song < ActiveRecord::Base
  belongs_to :user
  validates :title, :artist, length: { minimum: 2 }, presence:true
  has_many :counts
end
