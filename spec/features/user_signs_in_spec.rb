require 'spec_helper'
require 'rails_helper'
require 'devise'

feature 'User signs in' do
  scenario 'with valid email and password' do
    sign_in_with 'valid@example.com', 'password'
    expect(page).to have_content("Signed in successfully.")
  end

  scenario 'with invalid email' do
    sign_in_with 'invalid_email', 'password'
    expect(page).to have_content("Invalid email or password")
  end

  scenario 'with blank password' do
    sign_in_with 'valid@example.com', ''
    expect(page).to have_content("Invalid email or password")
  end

  scenario 'with too short password' do
    sign_in_with 'valid@example.com', 'passwor'
    expect(page).to have_content("Invalid email or password")
  end

  def sign_in_with(email, password)
    User.create(email: 'valid@example.com', password: 'password', password_confirmation: 'password')
    visit '/users/sign_in'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end