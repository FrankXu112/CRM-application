# contact = {
# 	:id => 0,
# 	:lastname => 1,
# 	:firstname => 2,
# 	:email => 3,
# 	:notes => 4
# }

class Contact

	attr_accessor :id, :lastname, :firstname, :email, :notes

	def initialize(lastname, firstname, email, notes)
		@lastname = lastname
		@firstname = firstname
		@email = email
		@notes = notes
	end


	def ==(other)
		self.lastname == other.lastname and
		self.firstname == other.firstname and
		self.email == other.email
	end
end

class Rolodex
	def initialize
		@last_id = 0
		@contacts = []
	end

	def add_contact(first, last, etc)
		new_contact = Contact.new(first, last, etc)

		duplicate = @contacts.find {|contact| contact == new_contact }
		return nil if duplicate

		@last_id += 1
		new_contact.id = @last_id
		@contacts << new_contact

		new_contact
	end

	def find(id)
		@contacts.find { |contact| contact.id == id }
	end

	def search(query)
	end
end

rolodex = Rolodex.new


puts "what do you want to do?"
puts "--type 'add' to add a contact."
puts "--type 'modify' to update a contact."
puts "--type 'display all' to show all contacts."
puts "--type 'display attribute' to search for contacts with attribute(firstname,lastname,etc.)"
puts "--type 'delete' to remove contacts."
puts "--type 'exit' to exit."

choice = gets.chomp

case choice
	when 'add'
		puts "enter lastname"
		lastname = gets.chomp
		puts "enter firstname"
		firstname = gets.chomp
		puts "enter an email address"
		email = gets.chomp
		puts "enter a note"
		notes = gets.chomp
		rolodex.add_contact(lastname, firstname, email, notes)
		puts "new contact has been added!"
	when 'modify'
		puts "which contact do you want to update?"
		id = gets.chomp
		contact = rolodex.find(id)


	when 'display all' 
		puts "displayed all!"
	when 'display attribute'
		puts "1"
	when 'delete'
		puts "deleted!"
	when 'exit'
		puts "welcome to come again!"
	else
		puts "Sorry, cannot find this order."
	end

