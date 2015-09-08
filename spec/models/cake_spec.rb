require 'rails_helper'

describe Cake do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:kind) }
  it { should validate_presence_of(:description) }
  it { should validate_uniqueness_of(:name) }
end

describe Cake do
  it do
  should validate_inclusion_of(:kind).
           in_array(%w(tasty non-gluten vegan))
  end
end

describe Cake do
        it { should validate_length_of(:name).is_at_least(3).is_at_most(30) }
        it { should validate_length_of(:description).is_at_least(10).is_at_most(5000) }
end