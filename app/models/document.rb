class Document < ActiveRecord::Base
  has_many :sections
  has_paper_trail
end
