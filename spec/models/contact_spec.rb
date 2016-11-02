require 'rails_helper'

RSpec.describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a full_name" do
        contact = Contact.new(email: "name@email.com", position: "sales")
        expect(contact).to be_invalid
      end
      it "is invalid without an email" do
        contact = Contact.new(full_name: "Taylor Swift", position: "sales")
        expect(contact).to be_invalid
      end
      it "is invalid without a position" do
        contact = Contact.new(full_name: "Taylor Swift", email: "name@email.com")
        expect(contact).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with content" do
        contact = Contact.new(full_name: "Taylor Swift", email: "name@email.com", position: "Sales")
        expect(contact).to be_valid
      end
    end
  end
  describe "relationships" do
    it "belongs to a job" do
      contact = Contact.new(full_name: "Taylor Swift", email: "name@email.com", position: "Sales")
      expect(contact).to respond_to(:company)
    end
  end
end
