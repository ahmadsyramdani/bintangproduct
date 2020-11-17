require 'rails_helper'

RSpec.describe Product, :type => :model do
  subject {
    described_class.new(name: "Anything",
                        price: "Lorem ipsum",
                        category: DateTime.now,
                        image: fixture_file_upload('files/sample.png', 'image/png'),
                        email: "lorem@mail.com")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a price" do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a category" do
    subject.category = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an image" do
    subject.image = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with incorrect email" do
    subject.email = "test@gmail"
    expect(subject).to_not be_valid
  end
end
