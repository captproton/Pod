Factory.define :person do |f|
  f.last_name "shirley"
  f.first_name "Donutcall"
  f.sequence(:email) { |n| "egeal#{n}@me.com" }
  f.last_name_1 "Shirley"
  f.address "123 cherry st."
  f.parents "donna & mary"
  f.classroom "lisa"
  
end

Factory.define :document do |f|
  f.title "Cool joe jives"
  f.description " Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. "
  f.tag_list "red, green"
  f.paper_list "form"
end