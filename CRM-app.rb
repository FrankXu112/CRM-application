class Contact

	attr_accessor :id, :first_name, :last_name, :email, :notes

	def initialize(first_name, last_name, email, notes)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@notes = notes
	end

	def add_new_contact
		print "Enter First Name: "
        first_name = gets.chomp
        print "Enter Last Name: "
        last_name = gets.chomp
        print "Enter Email Address: "
        email = gets.chomp
        print "Enter a Note: "
        note = gets.chomp
        new_contact = Contact.new(first_name, last_name, email, notes)
    end

    def display_contact
    	puts new_contact
    end
end

class Rolodex

	def initialize
		@last_id = 0
		@contacts = []
	end

	def add_contact(new_contact)
		new_contact.id = @last_id
		@contacts << new_contact
		@last_id += 1
	end

	def find(id)
		@contacts.find { |contact| contact.id == id }
	end

	def search(first_name)
		@contacts.find { |contact| contact.first_name == first_name}
	end
end

rolodex = Rolodex.new


# puts "what do you want to do?"
# puts "--type 'add' to add a contact."
# puts "--type 'modify' to update a contact."
# puts "--type 'display all' to show all contacts."
# puts "--type 'display attribute' to search for contacts with attribute(first_name,first_name,etc.)"
# puts "--type 'delete' to remove contacts."
# puts "--type 'exit' to exit."

# choice = gets.chomp

# case choice
# 	when 'add'
# 		puts "enter last_name"
# 		lastname = gets.chomp
# 		puts "enter first_name"
# 		first_name = gets.chomp
# 		puts "enter an email address"
# 		email = gets.chomp
# 		puts "enter a note"
# 		notes = gets.chomp
# 		rolodex.add_contact(last_name, first_name, email, notes)
# 		puts "new contact has been added!"
# 	when 'modify'
# 		puts "which contact do you want to update?"
# 		id = gets.chomp
# 		contact = rolodex.find(id)


# 	when 'display all' 
# 		puts "displayed all!"
# 	when 'display attribute'
# 		puts "1"
# 	when 'delete'
# 		puts "deleted!"
# 	when 'exit'
# 		puts "welcome to come again!"
# 	else
# 		puts "Sorry, cannot find this order."
# 	end

