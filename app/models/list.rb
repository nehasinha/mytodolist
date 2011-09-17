class List < ActiveRecord::Base
  validates :name, :presence => {:message => 'Name of the list cannot be blank'}
  has_many :tasks
end
