class List < ActiveRecord::Base
  has_many :todos
  validates :name, presence: true
  
  def as_json(options={})
    super({only: %w[id name]}.merge(options))
  end
end
