class Product < ActiveRecord::Base
  default_scope where(:deleted => false)
  scope :available, where(:status => 'Available')
  
  def initialize(*)
    super
    self.status = 'Coming Soon' unless self.status
  end
end