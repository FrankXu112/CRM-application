require_relative 'contact'
require_relative 'rolodex'

class CRM 

    def self.run
        crm_app = new
        crm_app.main_menu
    end

    def initialize
        @rolodex = Rolodex.new
    end

	def main_menu
        while true
        	print_main_menu
        	user_selected = gets.chomp.to_i
        	call_option(user_selected)
        end
    end
	

	def print_main_menu
		puts "[1] Add a new contact"
        puts "[2] Modify an existing contact"
        puts "[3] Display the contact"
        puts "[4] Display an attribute"
        puts "[5] Delete a contact"
        puts "[6] Exit"
        puts "Enter a number: "
    end

    def call_option(user_selected)
    	add_new_contact if user_selected == 1
    	modify_contact if user_selected == 2
    	display_contact if user_selected == 3
    	display_attribute if user_selected == 4
    	delete_contact if user_selected == 5
    	exit if user_selected == 6
    end

    def add_new_contact
        print "Enter First Name: "
        first_name = gets.chomp
        print "Enter Last Name: "
        last_name = gets.chomp
        print "Enter Email Address: "
        email = gets.chomp
        print "Enter a Note: "
        notes = gets.chomp
        contact = Contact.new(first_name, last_name, email, notes)
        @rolodex.add_contact(contact)
        puts "new contact has been added."
    end

    def modify_contact
        puts "Enter the contact id you want to update: "
        id = gets.chomp.to_i
        contact = @rolodex.find(id)
        puts contact
        # puts "Are you sure you want to modify this contact(Y/N)"

        puts "What would you like to modify? 1. First Name, 2. Last Name, 3. email, 4. notes"
        attribute_to_modify = gets.chomp.to_i
        puts "Enter the new value:"
        new_value = gets.chomp
     
        case attribute_to_modify
        when 1
            contact.first_name = new_value
        when 2
            contact.last_name = new_value
        when 3
            contact.email = new_value
        when 4
            contact.notes = new_value
        end
        # main_menu if user_input == "N"
    end

    def display_contact
        puts "Enter the contact id you want to view:"
        id = gets.chomp.to_i
        contact = @rolodex.find(id)
        puts contact
    end 

    def display_attribute
        puts "Enter an attribute to search contact(first name, last name, email): "
        attribute = gets.chomp.to_i
        puts "Enter the value to search:"
        value = gets.chomp
        contact = @rolodex.search(attribute, value)
        puts contact
    end

    def delete_contact
        puts "Enter the contact id you want to delete: "
        id = gets.chomp.to_i
        contact = @rolodex.find(id)
        puts contact
        puts "Are you sure you want to delete this contact(Y/N)?"
        user_input = gets.chomp
        @rolodex.delete_contact(contact) if user_input == "Y"
        main_menu if user_input == "N"
    end

    def Exit
        puts "\e[H\e[2J"
    end
end

CRM.run
