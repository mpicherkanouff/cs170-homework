# == Schema Information
#
# Table name: reviews
#
#  id           :integer         not null, primary key
#  potatoes     :integer
#  comments     :string
#  movie_id     :integer
#  movieuser_id :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :movieuser
end
