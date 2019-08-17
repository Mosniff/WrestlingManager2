require 'rails_helper'

RSpec.describe Championship, :type => :model do
  before(:all) do
    @championship1 = create(:championship)
    @performer1 = create(:performer)
    @performer2 = create(:performer)
    @today = Time.now.to_date
    @title_reign1 = create(:title_reign, championship: @championship1, performer: @performer1, start_date: @today - 7.days, is_current: true)
  end

  describe "a perfomer winning a championship" do
    before do
      @championship1.assign_title(@performer2)
    end

    it "should create a new title reign for the performer and championship" do
      title_reign2 = @championship1.title_reigns.last
      expect(title_reign2).to_not eq(nil)
      expect(title_reign2.performer).to eq(@performer2)
      expect(title_reign2.start_date).to eq(@today)
      expect(title_reign2.end_date).to eq(nil)
    end

    it "should end the previous title reign" do
      @title_reign1.reload
      expect(@title_reign1.end_date).to eq(@today)
    end

    it "should assign the performer as the title holder" do
      expect(@championship1.title_holder).to eq(@performer2)
    end

    # %%TODO these:
    # it "should alter both performers' prestige/kayfabe power/something" do
    # end
    # it "should alter the championship's prestige/kayfabe power/something" do
    # end
    # championship prestige vary on a number of factors... length of last reign,
    # need to hardcode a base number of days for a 'medium' reign and calculate based off that?
    # Or should the prestige of the title creep up every day and then just take a hit when it is lost?
    # The hit to prestige and rate of prestige gain should be relative to the holder's KFP

    # %%TODO store the start and end matches of each reign
  end


  # %%TODO vacant titles
end