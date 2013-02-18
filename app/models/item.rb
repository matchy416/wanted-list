# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  type        :integer
#  title       :string(255)
#  description :text
#  image       :string(255)
#  link        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ActiveRecord::Base
  attr_accessible :description, :title
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true
end
