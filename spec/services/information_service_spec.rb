require 'rails_helper'

describe InformationService do
  id = 1
  describe '#call' do
      context "when a call" do
        @result = InformationService.new(id).call
      end

      it "result return with sucess" do
        expect(@result).nil? 
      end
    end
end