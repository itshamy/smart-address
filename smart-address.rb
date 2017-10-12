puts "Welcome to Smart Address!"

require_relative 'controllers/menu_controllers'

menu = MenuController.new
system "clear"
puts "Welcome to Smart Address"
menu.main_menu
