class Todo < ActiveRecord::Base
  belongs_to :list
  validates :name, presence: true
  validates :list_id, presence: true
  
  def as_json(options={})
    super({only: %w[id name done]}.merge(options))
  end
end
