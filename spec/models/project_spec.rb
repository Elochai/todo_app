require 'spec_helper'

describe Project do
  it { should validate_presence_of :project_name_ids}
  it { should validate_presence_of :sender_id}
  it { should validate_presence_of :body}

  it { should have_and_belong_to_many :tasks}
  it { should belong_to :sender}
end
