require 'spec_helper'
require 'rails_helper'

describe 'home page' do
  it 'welcomes the user' do
    visit '/'
    page.should have_content('Log in')
  end
end