class Document < ActiveRecord::Base
  has_many :sections
  has_paper_trail

  def self.create_sample_document
    d = Document.create!(title: "d v1")
    s1 = Section.create!(document: d, title: "s1 v1")
    s2 = Section.create!(document: d, title: "s2 v1")
    puts 'Updating a section name'
    s1.update_attributes(title: 's1 v2')
    puts 'Updating document itself'
    d.update_attributes(title: 'd v2')
    d
  end
end
