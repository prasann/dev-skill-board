class LinkedInPosition < ActiveRecord::Base
  belongs_to :linked_in

  def self.create_positions_from_hash(linked_in_id, positions_json)
    positions_json.each do |position|
      li_position = LinkedInPosition.find_or_create_by_position_id_frm_api(position["id"])
      li_position.update_attributes({
                                        :linked_in_id => linked_in_id,
                                        :company_name => position["company"]["name"],
                                        :company_industry => position["company"]["industry"],
                                        :is_current => position["isCurrent"],
                                        :startDate => "#{position['startDate']['month']} - #{position['startDate']['year']}",
                                        :endDate => end_date(position),
                                        :title => position["title"],
                                        :summary => position["summary"]
                                    })

    end
  end

  private
  def self.end_date(position)
    return "" if position["isCurrent"]
    "#{position['endDate']['month']} - #{position['endDate']['year']}"
  end
end
