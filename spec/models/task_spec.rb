require 'spec_helper'

describe Task do
  it { should validate_presence_of :todo_item_ids}
  it { should validate_presence_of :sender_id}
  it { should validate_presence_of :body}

  it { should have_and_belong_to_many :reciever}
  it { should belong_to :sender}

end
