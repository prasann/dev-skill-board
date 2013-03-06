class StackOverflow < ActiveRecord::Base
  def self.update_so_instance
    token = Site.access_token_for(Site::PROVIDERS[:stackoverflow])
    reputation = StackOverflowAPI.get_user_reputation(token)
    question_count = StackOverflowAPI.get_questions_count(token)
    answer_count = StackOverflowAPI.get_answers_count(token)
    tags = accumulate_tags(token)
    stack_overflow = StackOverflow.find_or_create_by_user_id(User.current.id)
    stack_overflow.update_attributes({
                                         :reputation => reputation,
                                         :question_count => question_count,
                                         :answer_count => answer_count,
                                         :tags => tags.to_s
                                     })

  end

  def self.accumulate_tags(token)
    result_array = []
    tags = StackOverflowAPI.top_answer_tags(token)
    tags.each do |tag|
      aggregate = 0
      ["question_score", "question_count", "answer_score", "answer_count"].each do |tag_name|
        aggregate += tag.delete(tag_name)
      end
      result_array << [tag["tag_name"], aggregate]
    end
    result_array
  end
end
