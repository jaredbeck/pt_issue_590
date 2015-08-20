require "rails_helper"
require "pp"

RSpec.describe Document do
  it "works" do
    puts "We have Paper trail? #{PaperTrail.enabled?}"
    Document.paper_trail_on!
    Section.paper_trail_on!
    d = Document.create_sample_document
    puts 'Current version of document'
    expect(d.title).to eq("d v2")
    expect(d.sections.length).to eq(2)

    puts 'Previous version of document'
    d_v2 = d.versions.last.reify(:has_many => true)
    expect(d_v2.title).to eq("d v1")
    # The below fails. Associations are missing
    expect(d_v2.sections.length).to eq(2)  #however, code returns 0
  end
end
