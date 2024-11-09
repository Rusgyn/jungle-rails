require "rails_helper"
  
describe 'User Validation' do
  
  let(:user) do
    User.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'John_Doe@gamil.com',
      password: "123a"
    )
  end

  context "when all required fields are present" do
    it "should be valid" do
      expect(user.save).to be true
    end
  end

  context "when first_name is nil" do
    it "should be invalid" do
      user.first_name = nil
      expect(user.save).to be false
    end
  end


end
