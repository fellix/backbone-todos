class Todo < ActiveRecord::Base
  belongs_to :list
  validates :name, presence: true
  validates :list_id, presence: true
end
