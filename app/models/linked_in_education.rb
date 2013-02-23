class LinkedInEducation < ActiveRecord::Base
  belongs_to :linked_in

  def self.create_educations_from_hash(linked_in_id, educations_json)
    educations_json.each do |edu_hash|
      LinkedInEducation.create({
                                   :linked_in_id => linked_in_id,
                                   :degree => edu_hash["degree"],
                                   :schoolName => edu_hash["schoolName"],
                                   :fieldOfStudy => edu_hash["fieldOfStudy"],
                                   :startDate => edu_hash["startDate"]["year"],
                                   :endDate => edu_hash["endDate"]["year"]
                               })

    end
  end
end
