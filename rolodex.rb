class Rolodex

    def initialize
        @last_id = 1
        @contacts = []
    end

    def add_contact(contact)
        contact.id = @last_id
        @contacts << contact
        @last_id += 1
    end

    def find(id)
        @contacts.find { |contact| contact.id == id }
    end


    def search(attribute, value)
        @contacts.find do |contact|
            case attribute
            when 1 
                return @contacts.find {|contact| contact.first_name == value }
            when 2
                return @contacts.find {|contact| contact.last_name == value }
            end
        end
    end


    def delete_contact(contact)
        @contacts.delete(contact) 
    end
end