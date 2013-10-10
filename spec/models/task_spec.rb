require 'spec_helper'

describe Task do
  it { should validate_presence_of :todo_item}
  it { should validate_presence_of :priority }
  it { should belong_to :project}
end
