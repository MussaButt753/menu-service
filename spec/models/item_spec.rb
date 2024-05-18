# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "#valid?" do
    it 'does not create item with null label' do
      expect(build(:item, label: nil).valid?).to be false
    end

    Item::ALLOWED_TYPES.each do |type|
      it "returns true when type is #{type}" do
        expect(build(:item, type:).valid?).to be true
      end
    end

    it "returns false when type is nil" do
      expect(build(:item, type: nil).valid?).to be false
    end

    it "returns false when type is invalud" do
      expect(build(:item, type: "invalid").valid?).to be false
    end

    it "retruns false when price is nil" do
      expect(build(:item, price: nil).valid?).to be false
    end

    it "retruns false when price is negative" do
      expect(build(:item, price: -1.0).valid?).to be false
    end

    it "retruns true when price is positive" do
      expect(build(:item, price: 1.0).valid?).to be true
    end
  end
end
