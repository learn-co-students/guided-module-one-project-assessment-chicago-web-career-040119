require "tty-prompt"


class Login

 def initialize 
@prompt = TTY::Prompt.new
 end

    #################### Logging In

def greet 
    puts "Hey there, welcome to the bar."
    check_age
    puts "Been here before? Y or N"
    resp = gets.chomp
    patron(resp)
end


def patron(resp)
    if resp == "N"
        new_user
    elsif resp == "Y"
        login
    else
        puts "Sorry, friend, let's try again. Been here before? Enter Y or N:"
        resp2 = gets.chomp
        patron(resp2)
    end
end

def login
    puts "I thought I recognized you...enter your email:"
    email = gets.chomp
    validate_user(email)
end

def validate_user(email)
    user = User.where('email=?', email)
    if !user || User.count == 0
        "Wait, are you sure you've been here? We'll just go ahead and create an account..."
        check_age
    else
        $user = user[0]
        puts "Welcome back, #{$user.first_name}!"
    end
    
end

# def password
#     puts "And what's the password?"
#     gets.chomp
# end

# def validate_password(password)
#     yes_user = User.where($user
# end

def check_age
    puts "Wait, how old are you?"
    age = gets.chomp
    if age.to_i >= 21
        puts "You can stay."
    else
        puts "Get out of here, kid."
        exit    
    end
end

def new_user

    user = @prompt.collect do

  
        key(:email).ask('What is your e-mail?') do |q|
        q.validate(/\A\w+@\w+\.\w+\Z/)
        q.messages[:valid?] = 'Invalid email address'
        end
  
        key(:password).mask("Choose a password....and please, don't use 'password' as your password...")
  
        key(:first_name).ask('First Name')
  
        key(:last_name).ask('Last Name')

  
        key(:about_me).ask('Tell me a little about yourself, what brings you here?')
  
      end
      $user = User.create(
        first_name: user[:first_name],
        last_name: user[:last_name],
        email: user[:email],
        password: user[:password],
        about_me: user[:about_me]
      )

#    puts "What's your first name?"
#    fname = gets.chomp
#    puts "What's your last name?"
#    lname = gets.chomp
#    puts "Okay, what's your email?"
#    uemail = gets.chomp
#    puts "Choose a password....and please, don't use 'password' as your password..."
#    pw = gets.chomp
#    puts "Thanks #{fname}! Tell me a little bit about yourself, what brings you into the bar?"
#    me = gets.chomp
 
#       $user = User.create(
#         first_name: fname,
#         last_name: lname,
#         email: uemail,
#         password: pw,
#         about_me: me
#       )
#       puts "Cool, welcome in!"
end


   

end