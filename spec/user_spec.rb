require 'rails_helper'
require 'spec_helper'

feature 'Sign up user' do
  it 'should accept and render a success message' do
    user = FactoryGirl.build(:user)
    visit root_path

    fill_in 'user[first_name]', :with => user.first_name
    fill_in 'user[last_name]', :with => user.last_name
    fill_in 'user_email', :with => user.email
    fill_in 'user_password', :with => user.password
    fill_in 'user_password_confirmation', :with => user.password_confirmation
    click_button 'sign_up'
    
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end

feature 'Sign in user' do
  it 'should accept the request and render a success message' do
    visit root_path

    fill_in 'sign_in_user_email', :with => 'admin@example.net'
    fill_in 'sign_in_user_password', :with => 'napoleon'
    click_button 'sign_in'

    expect(page).to have_content 'Signed in successfully.' 

    logout(:user)
  end
end

feature 'logged user checks new category Educacion' do
  it ' should be added to users category preferences' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    
    visit 'users/edit'
    check "category_users_ids_2"
    fill_in 'user_current_password', :with => user.password
    click_button "¡Listo!"

    expect(user.categories.take.name).to eq 'Educación'
  end
end

feature 'logged user changes email periodicity' do
  it 'should change to value  every 14 days' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit 'users/edit'
    select "Cada 14 días", :from => "user_periodicity"
    fill_in 'user_current_password', :with => user.password
    click_button "¡Listo!"
    user.reload

    expect(user.periodicity).to eq 14
  end
end


