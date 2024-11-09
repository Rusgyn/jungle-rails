require 'rails_helper'

# RSpec.describe Widget, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe '#id' do
  let(:widget) do
    Widget.new()
  end

  context "should not exist for new record" do
    it "should return nil" do
      widget.id = nil
      expect(widget.id).to be nil
    end
  end

  context "should be auto-assigned by AR for saved records" do
    it "should be present" do
      widget.save!
      expect(widget.id).to be_present
    end
  end



end

      