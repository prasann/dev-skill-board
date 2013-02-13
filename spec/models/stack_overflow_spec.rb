require 'spec_helper'

describe StackOverflow do
  describe 'accumulation of tags' do
    it "should accumulate attrs of tags to aggregates" do
      return_hash = [{"tag_name" => "java", "question_score" => 2, "question_count" => 4, "answer_score" => 10, "answer_count" => 10},
                     {"tag_name" => "jquery", "question_score" => 4, "question_count" => 3, "answer_score" => 8, "answer_count" => 9}]
      StackOverflowAPI.should_receive(:top_answer_tags).and_return(return_hash)
      tags = StackOverflow.accumulate_tags("token")
      tags.count.should == 2
      tags.first.should == ['java',26]
      tags.last.should == ['jquery',24]
    end
  end
end
