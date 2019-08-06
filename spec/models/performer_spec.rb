require 'rails_helper'

RSpec.describe Performer, :type => :model do

  # %%TODO allow performers to not have a promotion, ie to be independent
  # it { should belong_to(:promotion) }

  before(:all) do
    @performer1 = create(:performer)
  end

  describe 'generating a new performer' do
    it 'should have a body type' do
      expect(@performer1.body_type).to_not eq(nil)
      # Giant, Heavyweight, Middleweight, Cruiserweight, High-flyer
    end

    it 'should have performer details' do
      # name, gender, age
      expect(@performer1.name).to_not eq(nil)
      expect(@performer1.gender).to eq('male').or eq('female')
      expect(@performer1.age).to be_between(18, 30) 
    end

    it 'should have base attributes, within boundaries of their body types' do
      # size, agility, strength
      starting_stat_ranges = Performer.determine_starting_stat_ranges(@performer1.body_type)
      expect(@performer1.size).to be_between(starting_stat_ranges["size"][0], starting_stat_ranges["size"][1])
      expect(@performer1.agility).to be_between(starting_stat_ranges["agility"][0], starting_stat_ranges["agility"][1])
      expect(@performer1.strength).to be_between(starting_stat_ranges["strength"][0], starting_stat_ranges["strength"][1])
    end

    it 'should have wrestling attributes' do
      # wrestling ability, work rate, selling
      starting_stat_ranges = Performer.determine_starting_stat_ranges(@performer1.body_type)
      expect(@performer1.wrestling_ability).to be_between(starting_stat_ranges["wrestling ability"][0], starting_stat_ranges["wrestling ability"][1])
      expect(@performer1.work_rate).to be_between(starting_stat_ranges["work rate"][0], starting_stat_ranges["work rate"][1])
      expect(@performer1.selling).to be_between(starting_stat_ranges["selling"][0], starting_stat_ranges["selling"][1])
      # %%TODO consider modifying these stats based on age and gender
    end
  end
end


# %%TODO add the following attributes
# look, in ring charisma, on mic charisma
# inherent faceness, inherent heelness
# current faceness, current heelness
# kayfabe power
# injuries (has_many)
# contract (has_one/has_many, join table with promotion probably)
# something to do with wrestling styles or something, hardcore/weapon ability

# (maybe) maximum levels for certain attributes (some people will only get so good)
# (maybe) rate of improvement for certain attributes (some people quickly improve in certain areas)

# wildcard traits (has_many?) - adjustments to various attributes, possibly beyond the normal range for that wrestler
  # maybe this should be handled away from attributes? ie: 
  # "a bonus to rolls when attempting a high-flying manoeuver", vs "a +5 bonus to agility"

# %%TODO add non-wrestler performers, ie managers, commentators