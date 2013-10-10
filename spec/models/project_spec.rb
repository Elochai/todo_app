require 'spec_helper'

describe Project do
  it { should validate_presence_of :project_name }
  it { should have_many :task}
  it { should belong_to :user}
end