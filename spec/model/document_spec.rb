require "rails_helper"
require "pp"

RSpec.describe Document do
  it "works" do
    # document = FactoryGirl.create(:document_with_sections_and_paragraphs)
    d = Document.create_sample_document

    puts 'Current version of document, has two sections'
    expect(d.title).to eq("d v2")
    expect(d.sections.length).to eq(2)

    puts 'Update the document'
    d.update_attributes(title: 'd v3')

    puts 'Previous version of document'
    d_v2 = d.versions.last.reify(:has_many => true)
    expect(d_v2.title).to eq("d v2")
    # The below fails. Associations are missing
    expect(d_v2.sections.length).to eq(2)  #however, code returns 0
  end
end
