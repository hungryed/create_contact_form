require 'spec_helper'

describe Inquiry do
  it { should validate_presence_of :subject }
  it { should validate_presence_of :description }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should have_valid(:first_name).when('Jim') }
  it { should_not have_valid(:first_name).when(nil, '') }
  it { should have_valid(:last_name).when('Jim') }
  it { should_not have_valid(:last_name).when(nil, '') }
  it { should have_valid(:email).when('jim@jim.com') }
  it { should_not have_valid(:email).when('jim', nil, '', 'jim@jim') }

end
