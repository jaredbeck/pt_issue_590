class Section < ActiveRecord::Base
  belongs_to :document
  has_many :paragraphs
  has_paper_trail
end
