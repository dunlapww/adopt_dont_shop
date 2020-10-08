require 'rails_helper'

RSpec.describe Pet do
  describe "relationship" do
    it {should belong_to :shelter}
  end

  
end
