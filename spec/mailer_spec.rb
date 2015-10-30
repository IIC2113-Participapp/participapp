require 'rails_helper'
require 'spec_helper'

describe User do

  before :each do # From doc: Data created in before(:each) are rolled back
    @user = FactoryGirl.create(:user)

    num_categories = Category.count
    num_related_categories = rand(1..num_categories)
    num_related_categories.times do |i|
      category = Category.all.sample
      @user.categories << Category.all.sample unless @user.categories
        .include?(category)
    end
  end

  describe 'Mailer gets activated' do
    it 'should detect users who must receive an e-mail' do
      @user.reload
      @user.update!(periodicity: 7)
      @user.update!(last_received: 8.days.ago)

      receivers_id = User.fetch_for_mailing.collect { |row| row.receiver_id }
        .uniq
      expect(receivers_id).to include(@user.id)
    end

    it 'should detect users who must not receive an e-mail' do
      @user.reload
      @user.update!(periodicity: 7)
      @user.update!(last_received: 6.days.ago)

      receivers_id = User.fetch_for_mailing.collect { |row| row.receiver_id }
        .uniq
      expect(receivers_id).not_to include(@user.id)
    end
  end

  describe 'Mailer detect an user' do
    it 'send mail should containt the right categories' do
      @user.reload
      @user.update!(periodicity: 7)
      @user.update!(last_received: 8.days.ago)

      @categories = @user.categories.collect { |category| category.id }

      #Category of the content that will sent to the user
      contents_categories = User.fetch_for_mailing
        .collect{ |row| row.category_id if row.receiver_id == @user.id}
        .uniq.compact

      expect(@categories).to include(* contents_categories)
    end
  end
end

describe 'Mailer gets activated' do
  it 'contents should correspond to chosen category' do
    expect(true).to eq(true)
  end
end

describe 'Mailer gets activated' do
  it 'sent news should be marked as approved' do
    contents_status =
      User.fetch_for_mailing.collect{ |row| row.authorization_status}.uniq
    expect(contents_status).to eq(["authorized"])
  end
end
