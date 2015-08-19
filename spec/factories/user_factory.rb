# This will guess the User class
FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password "zyxwvutsrqp"
    password_confirmation { |u| u.password }
    admin false
    first_name "Katy"
    last_name "Pohlman"
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email
    password "zyxwvutsrqp"
    password_confirmation { |u| u.password }
    admin true
    first_name "Admin"
    last_name "User"
  end
end