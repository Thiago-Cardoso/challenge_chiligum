require 'rails_helper'

describe InformationService do
  id = rand(1...10)
  describe '#call' do
      context "when a call" do
        @result = InformationService.new(id).call
      end

      it "result return with sucess" do
        expect(@result).nil? 
      end
    end
end