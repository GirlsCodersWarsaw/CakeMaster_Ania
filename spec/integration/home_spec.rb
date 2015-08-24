require 'spec_helper'
require 'rails_helper'

describe 'home page' do
  it 'welcomes the user' do
    visit '/'
    expect(page).to have_content('Log in')
  end
end