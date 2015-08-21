class Section < ActiveRecord::Base
  belongs_to :document
  has_paper_trail
end
