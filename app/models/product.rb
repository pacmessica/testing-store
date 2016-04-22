class Product < ActiveRecord::Base
  validates :name, presence: true, :format => {:with => /\A[a-z A-Z]+$\z/,  :message => 'Only letters and spaces allowed.'}

  def bargain?
    price < 50
  end
end
