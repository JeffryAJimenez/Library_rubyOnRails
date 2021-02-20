class Book < ApplicationRecord
  has_many :comments
  validates :title, presence: true
  validates :author, presence: true
  validates :ISBN, presence: true, uniqueness: true, length: {minimum: 10}
  validates :copies, presence: true, numericality: { only_integer: true }, length: {minimum: 0}

  def remove_copy
     self.copies =  self.copies - 1;
     self.save()
  end
end
