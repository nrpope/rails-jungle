require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(
    first_name: "Testing",
    last_name: "Something",
    email: "test@test.com",
    password: "qwerty123"
) }

  describe 'Validations' do
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
end