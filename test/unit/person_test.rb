require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  context 'A person' do
    setup do
      @person = Factory(:person)
    end
  end
  ## bad data to import at first. Un comment later. #should_validate_presence_of :last_name, :last_name_1, :first_name, :address, :parents, :classroom
  
end
