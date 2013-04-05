require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
	test " a user should enter a first name"  do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?

		
	end

	test " a user should enter a Last name"  do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?

		
	end

	test " a user should enter a profile name"  do
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?

		
	end

	test " a user should have unique profile name"  do
		user = User.new
		user.profile_name = users(:profil).profile_name

		assert !user.save
		puts user.errors.inspect
		assert !user.errors[:profile_name].empty?

		
	end

	test " a user should have  profile name without spaces"  do
		user = User.new(first_name: 'Fname', last_name: 'Lname', email: 'fname@gmail.com')
		user.password = user.password_confirmation = 'password123'
		
		user.profile_name = "AB DE"

		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly")

		
	end

	test "a user can have a correctly formatted profile name" do
		user = User.new(first_name: 'Fname', last_name: 'Lname', email: 'fname@gmail.com')
		user.password = user.password_confirmation = 'password123'

		user.profile_name = 'fname_123'
		assert user.valid?
	end 


end
