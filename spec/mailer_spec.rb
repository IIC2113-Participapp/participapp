require 'rails_helper'
require 'spec_helper'

describe 'Mailer gets activated' do
  it 'should detect users who must receive an e-mail' do
    user = FactoryGirl.create(:user)
    user.periodicity = 7
    user.last_received = 1.week.ago
    User.fetch_for_mailing.should include(user)
  end
end

describe 'Mailer detect an user' do
  it 'send mail should contain the right categories' do
    true.should == false
  end
end

describe 'Mailer gets activated' do
  it 'contents should correspond to the chosen category' do
    true.should == false
  end
end


describe 'Mailer gets activated' do
  it 'sent news should be marked as approved' do
    true.should == false
  end
end
