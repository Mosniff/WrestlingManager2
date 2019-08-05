require 'rails_helper'

RSpec.describe Match, :type => :model do

  it { should belong_to(:promotion) }

  before(:all) do
    @match1 = create(:match)

    @match2 = create(:match)
    @match_performer1 = create(:match_performer, match: @match2)
    @match_performer2 = create(:match_performer, match: @match2)
  end
  
  it "is valid with valid attributes" do
    expect(@match1).to be_valid
  end

  describe 'booking a match' do
  end

  describe 'perform match' do
    it 'should only run a match if two or more wrestlers have been assigned' do
      expect{@match1.perform_match}.to raise_error(RuntimeError)
    end

    it 'should give the match a match rating' do
      # match rating currently random
      # %%TODO, create match making logic based on:
      # performer skill
      # performer chemistry
      # performer complimentary styles and body types
      # story/build, includes championships, repetion, match result etc
      # match types
      # match outcomes and spots
      # place on show
      # augment/complexify logic for team-based matches
      # augment/complexify logic for multi-man matches
      @match2.perform_match
      expect(@match2.match_rating).to_not eq(nil)
    end


  end
  
end