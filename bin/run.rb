require_relative '../config/environment'
require "tty-prompt"


login = Login.new
main = Main.new
banner = Banners.new

banner.welcome_banner
login.greet
main.main_menu






