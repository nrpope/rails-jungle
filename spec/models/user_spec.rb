require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    subject { described_class.new(
      first_name: "Testing",
      last_name: "Something",
      email: "test@test.com",
      password: "qwerty"
    ) }
    it "is valid given correct parameters" do
      expect(subject).to be_valid
    end
    it "must be created with password and password_confirmation fields" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it "must contain a unique case insensitive email" do
      described_class.create!(first_name: "Testing",
        last_name: "Something",
        email: "test@test.com",
        password: "qwerty")
      expect(subject).to_not be_valid
    end
    it "must contain first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
    it "must contain first name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it "must contain email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it "must contain password of certain length" do
      subject.password = "123"
      expect(subject).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    before {
      described_class.create!(
        first_name: "Testing",
        last_name: "Something",
        email: "test@test.com",
        password: "abcdefg") 
    }

    it "must log in the user given correct credentials" do

      user = described_class.authenticate_with_credentials("test@test.com","abcdefg")
      expect(user).to be_instance_of(described_class)
    end

    it "must deny access given incorrect username" do

      user = described_class.authenticate_with_credentials("test@test.comm","abcdefg")
      expect(user).to be_nil
    end

    it "must deny access given incorrect password" do
      user = described_class.authenticate_with_credentials("test@test.com","abcdefggggg")
      expect(user).to be_nil
    end

    it "must trim spaces from user input and log them in" do
      user = described_class.authenticate_with_credentials("   test@test.com    ","abcdefg")
      expect(user).to be_instance_of(described_class)
    end

    it "must log in regardless of email case/CASE" do
      user = described_class.authenticate_with_credentials("TEST@test.COM","abcdefg")
      expect(user).to be_instance_of(described_class)
    end
<<<<<<< HEAD
  end
=======

  end

>>>>>>> feature/user-specs
end