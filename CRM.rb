class CRM

	def main_menu
    	print_main_menu
    	user_selected = gets.to_i
    	call_option(user_selected)
    end
	

	def print_main_menu
		puts "[1] Add a new contact"
        puts "[2] Modify an existing contact"
        puts "[3] Display all the contacts"
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
end

a_crm_app = CRM.new
a_crm_app.main_menu


