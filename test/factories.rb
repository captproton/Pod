Factory.define :person do |f|
  f.last_name "shirley"
  f.first_name "Donutcall"
  f.sequence(:email) { |n| "egeal#{n}@me.com" }
  f.last_name_1 "Shirley"
  f.address "123 cherry st."
  f.parents "donna & mary"
  f.classroom "lisa"
  
end