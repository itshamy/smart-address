require_relative '../models/address_book.rb'

class MenuController
    attr_reader :address_book
    
    def initialize
        @address_book = AddressBook.new
    end
    
    def main_menu
        puts "Main Menu - #{address_book.entries.count} entries"
        puts "1 - View all entries"
        puts "2 - View specific entry"
        puts "3 - Create an entry"
        puts "4 - Search for an entry"
        puts "5 - Import entries from a CVS"
        puts "6 - Exit"
        print "Enter your selection: "
        
        selection = gets.to_i
        
        case selection
            when 1
                system "clear"
                view_all_entries
                main_menu
            when 2
                system "clear"
                view_specific_entry
                main_menu
            when 3
                system "clear"
                create_entry
                main_menu
            when 4
                system "clear"
                search_entries
                main_menu
            when 5
                system "clear"
                read_cvs
                main_menu
            when 6
                puts "Good-bye!"
                exit(0)
            else
                system "clear"
                puts "Sorry, that is not a valid input"
                main_menu
        end
    end
    
    def view_all_entries
        address_book.entries.each do |entry|
            system "clear"
            puts entry.to_s
            entry_submenu(entry)
        end
        system "clear"
        puts "End of entries"
    end
    
    def view_specific_entry
        print "Enter the entry number: "
        number = gets.to_i
        if address_book.entries.length < 1
            system "clear"
            puts "Sorry there is no entry to display. Please add entry/entries"
        elsif number >= 0 && number < address_book.entries.length
            system "clear"
            puts "This is entry number #{number}"
            puts address_book.entries[number]
        else
            system "clear"
            puts "Sorry, that is not a valid entry number. Please try again and enter entry number between 0 and #{address_book.entries.length - 1}"
        end
    end
    
    def create_entry
        system "clear"
        puts "New Smart Address Entry"
        print "Name: "
        name = gets.chomp
        print "Phone Number: "
        phone = gets.chomp
        print "Email: "
        email = gets.chomp
        
        address_book.add_entry(name, phone, email)
        system "clear"
        puts "New entry created"
    end
    
    def search_entries
    end
    
    def read_cvs
    end
    
    def entry_submenu(entry)
        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        
        selection = gets.chomp
        case selection
            when "n"
            
            when "d"
            when "e"
            when "m"
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a valid input"
                entry_submenu(entry)
        end
    end
end
