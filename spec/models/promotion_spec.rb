require 'rails_helper'

RSpec.describe Promotion, :type => :model do

  it { should belong_to(:user) }

  before(:all) do
    @promotion1 = create(:promotion)
  end

  it "is valid with valid attributes" do
    expect(@promotion1).to be_valid
  end

  describe "starting a new promotion" do
    it "should generate a new promotion with starting cash and performers" do
      # start with $10,000 cash and 25 performers
      # %%TODO consider different parameters for AI promotions, if we even have AI promotions
      expect(@promotion1.cash).to eq(10000)
      expect(@promotion1.performers.count).to eq(25)
    end
  end

end