require 'rails_helper'

describe Artist do
  let(:record_label) { RecordLabel.new }

  subject { Artist.new(record_label: record_label) }

  it "generates a valid artist" do
    expect(subject).to be_valid
  end

  it "prevents artists without record labels" do
    subject.record_label = nil #tests that artist stops being valid once record label is removed
    expect(subject).not_to be_valid
    expect(subject.errors.full_messages).to include "Record label must exist"
  end
end
