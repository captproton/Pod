class Person < ActiveRecord::Base
## Cannot validate orginal import.  Uncomment after import
  #validates_presence_of :address
  #validates_presence_of :classroom
  #validates_presence_of :parents
  #validates_presence_of :last_name_1
  #validates_presence_of :last_name
  #validates_presence_of :first_name
  
  
  attr_accessible :last_name, :last_name_1, :last_name_2, :first_name, :address, :telephone, :parents, :email, :classroom, :count, :corrected, :classroom_job

end
