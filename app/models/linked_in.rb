class LinkedIn < ActiveRecord::Base
  has_many :linked_in_educations
  has_many :linked_in_positions

  def self.create_linked_in(json_txt)
    json = JSON.parse(json_txt)
    linked_in = LinkedIn.create({:user_id => User.current.id,
                                 :skills => skills(json)})
    LinkedInEducation.create_educations_from_hash(linked_in.id, json["educations"]["values"])
    LinkedInPosition.create_positions_from_hash(linked_in.id, json["positions"]["values"])
  end

  def self.skills(json)
    skills = []
    skill_array = json["skills"]["values"]
    skill_array.each do |skill_json|
      skills << skill_json["skill"]["name"]
    end
    skills.join(',')
  end
end
