require 'spec_helper'

describe Admin do
  it "has a valid factory" do
    expect(create(:admin)).to be_valid
  end
end
