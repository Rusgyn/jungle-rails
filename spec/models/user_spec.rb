require "rails_helper"
  
describe 'User Validation' do
  
  let(:user) do
    User.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'John_Doe@gmail.com',
      password: "123abc",
      password_confirmation: "123abc"
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

  context "when email is already registered" do
    it "does not allow the user to register again with the same email" do
      user.save
      user_with_duplicate_email = User.new(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'John_Doe@gmail.com',
        password: "123abc",
        password_confirmation: "123abc"
      )
      expect(user_with_duplicate_email.valid?).to be false
      expect(user_with_duplicate_email.errors[:email]).to include("has already been taken")
    end
  end

  context "when email is already registered. Case sensitivity." do
    it "does not allow the user to register again with the same email, case sensitive" do
      user.save
      user_with_duplicate_email = User.new(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'JOHN_DOE@gmail.com',
        password: "123abc",
        password_confirmation: "123abc"
      )
      expect(user_with_duplicate_email.valid?).to be false
      expect(user_with_duplicate_email.errors[:email]).to include("has already been taken")
    end
  end

  context "when password is short" do
    it "should be invalid" do
      user.password = "123a"
      user.password_confirmation = "123a"

      expect(user.valid?).to be false
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end

  context "when password is long enough" do
    it "should return valid" do
      user.password = "123xyz"
      user.password_confirmation = "123xyz"

      expect(user.valid?).to be true
    end
  end

end
