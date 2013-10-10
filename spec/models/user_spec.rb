require 'spec_helper'

describe User do
  it { should validate_presence_of :email_ids}
  it { should validate_presence_of :sender_id}
  it { should validate_presence_of :body}

  it { should have_and_belong_to_many :tasks}
  it { should belong_to :sender}

end
