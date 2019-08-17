class Performer < ApplicationRecord
  belongs_to :promotion, optional: true
  has_many :title_reigns

  after_create :initialize_new_performer_attributes

  def self.determine_starting_stat_ranges(body_type)
    # %%TODO actually decide these ranges
    giant_starting_stat_ranges = {
      "strength" => [1, 2], "agility" => [1, 2], "size" => [1, 2],
      "wrestling ability" => [1, 2], "work rate" => [1, 2], "selling" => [1, 2]
    }
    heavyweight_starting_stat_ranges = {
      "strength" => [1, 2], "agility" => [1, 2], "size" => [1, 2],
      "wrestling ability" => [1, 2], "work rate" => [1, 2], "selling" => [1, 2]
    }
    middleweight_starting_stat_ranges = {
      "strength" => [1, 2], "agility" => [1, 2], "size" => [1, 2],
      "wrestling ability" => [1, 2], "work rate" => [1, 2], "selling" => [1, 2]
    }
    cruiserweight_starting_stat_ranges = {
      "strength" => [1, 2], "agility" => [1, 2], "size" => [1, 2],
      "wrestling ability" => [1, 2], "work rate" => [1, 2], "selling" => [1, 2]
    }
    highflyer_starting_stat_ranges = {
      "strength" => [1, 2], "agility" => [1, 2], "size" => [1, 2],
      "wrestling ability" => [1, 2], "work rate" => [1, 2], "selling" => [1, 2]
    }

    case body_type
    when "giant"
      return giant_starting_stat_ranges
    when "heavyweight"
      return heavyweight_starting_stat_ranges
    when "middleweight"
      return middleweight_starting_stat_ranges
    when "cruiserweight"
      return cruiserweight_starting_stat_ranges
    when "highflyer"
      return highflyer_starting_stat_ranges
    end
  end

  def determine_random_stat(range)
    rand(range[1] - range[0]) + range[0] + 1
  end

  private

  def initialize_new_performer_attributes
    genders = ["male", "female"]
    body_types = ["giant", "heavyweight", "middleweight", "cruiserweight", "highflyer"]

    # Determine performer details
    name = "Barvis" # %%TODO random name generator
    age = rand(13) + 18
    gender = genders[rand(genders.length)] # %%TODO consider making these probabilities not equally weighted

    # Determine body size
    body_type = body_types[rand(body_types.length)] # %%TODO consider making these probabilities not equally weighted

    starting_stat_ranges = Performer.determine_starting_stat_ranges(body_type)

    # Determine base attributes
    size = determine_random_stat(starting_stat_ranges["size"])
    strength = determine_random_stat(starting_stat_ranges["strength"])
    agility = determine_random_stat(starting_stat_ranges["agility"])

    # Determine wrestling attributes
    wrestling_ability = determine_random_stat(starting_stat_ranges["wrestling ability"])
    work_rate = determine_random_stat(starting_stat_ranges["work rate"])
    selling = determine_random_stat(starting_stat_ranges["selling"])

    self.update(
      name: name,
      age: age,
      gender: gender,
      body_type: body_type,
      size: size,
      strength: strength,
      agility: agility,
      wrestling_ability: wrestling_ability,
      work_rate: work_rate,
      selling: selling
    )
  end

end
