require "rails_helper"
  
describe 'User Validation' do
  
  let(:user) do
    User.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'John_Doe@gamil.com',
      password: "123a",
      password_confirmation: "123a"
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

  # Test the remaining field using loop each method.
  %i(last_name email password).each do |field|
    context "When #{field} is nil" do
      it "should be invalid" do
        user.public_send("#{field}=", nil)
        expect(user.save).to be false
      end
    end
  end

  context "when password and password_confirmation match" do
    it "should return valid" do
      user.password == user.password_confirmation
      expect(user.save).to be true
    end
  end

  context "when password and password_confirmation does match" do
    it "should return invalid" do
      user.password_confirmation = "not_same"
      expect(user.save).to be false
    end
  end

end
