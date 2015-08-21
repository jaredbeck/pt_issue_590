require "rails_helper"
require "pp"

RSpec.describe Document do
  it "works" do
    # document = FactoryGirl.create(:document_with_sections_and_paragraphs)
    d = Document.create!(title: "d v1")
    s1 = Section.create!(document: d, title: "s1 v1")
    s2 = Section.create!(document: d, title: "s2 v1")
    puts 'Updating a section name'
    s1.update_attributes(title: 's1 v2')
    puts 'Updating document itself'
    d.update_attributes(title: 'd v2')

    # Check that this version has two sections:
    expect(d.title).to eq('d v2')
    expect(d.sections.length).to eq(2)

    # Update the title again
    d.update_attributes(title: 'd v3')

    puts 'Previous version of document'
    d_v2 = d.versions.last.reify(:has_many => true)
    expect(d_v2.title).to eq('d v2')
    expect(d_v2.sections.length).to eq(2)
  end
end
