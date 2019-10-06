require 'spec_helper'

describe Cell do
  context "#initialize" do
    it "is set to empty" do
      cell = Cell.new
      expect(cell.value).to eq ''
    end
  end
end
