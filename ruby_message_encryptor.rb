# Libaries required for program
require 'openssl'
require 'encrypto_signo'

if !File.directory?("contacts")
    Dir.mkdir("contacts")
end

if !File.directory?("messages")
    Dir.mkdir("messages")
end

# Methods for program

# Method to encrypt messages which will also save them as txt files.
def encrypt_message

    puts "If you need help adding public keys please refer to the readme file in the directory..."

    puts "Choose public key to use..."
    
    contacts = Dir["../ruby_message_encryptor/contacts/*_public_key.txt"]

    n = 1
    contacts.each do |path|
        puts "#{n}. #{File.basename(path, '.txt')}"
        n = n + 1 
    end

    puts "Enter option number..."
    option = gets.chomp
    puts "Option #{option} selected."
    option = option.to_i - 1
    
    public_key = File.read "#{contacts[option]}"

    puts public_key

    puts "Enter message to encrypt..."
    message = gets.chomp

    puts "Encrypting message..."
    encrypted_message = EncryptoSigno.encrypt(public_key, message)
    puts encrypted_message
    message_file = File.new("../ruby_message_encryptor/messages/encrypted_message.txt", "w")
    message_file.puts(encrypted_message)
    message_file.close
    puts "Encryption successful!"
    puts "encryted_message.txt was saved to the messages folder in the directory."
end

# Method to decrypt messages which will also save them as txt files.
def decrypt_message
    private_key = File.read 'your_private_key.txt'

    message = File.read '../ruby_message_encryptor/messages/encrypted_message.txt'

    puts "Decrypting message..."
    decrypted_message = EncryptoSigno.decrypt(private_key, message)
    puts decrypted_message
    message_file = File.new("../ruby_message_encryptor/messages/decrypted_message.txt", "w")
    message_file.puts(decrypted_message)
    message_file.close
    puts "Decryption successful!"
    puts "decryted_message.txt was saved to the directory."
end


# Method to generate the key pair which will also save as txt files. 
def generate_key_pair
    Dir
    puts "Generating Key Pair..."
    rsa_key = OpenSSL::PKey::RSA.new(2048)
    ruby_private_key = File.new("your_private_key.txt", "w")
    ruby_private_key.puts(rsa_key)
    ruby_private_key.close
    puts File.read 'your_private_key.txt'

    ruby_public_key = File.new("../ruby_message_encryptor/contacts/your_public_key.txt", "w")
    ruby_public_key.puts(rsa_key.public_key)
    ruby_public_key.close
    puts File.read '../ruby_message_encryptor/contacts/your_public_key.txt'
    puts "Key pair generated succesfully..."
end

# Welcome to Message Encyptor!
puts "Welcome to Ruby Message Encryptor!"
puts "Please read the readme file before use..."

# Checks for existing key pair.
puts "Checking for key pair..."
if !File.exists? 'your_private_key.txt'
    puts "your_private_key.txt not found."
    puts "If you have a your_private_key.txt file, please put a copy into the ruby_message_encryptor directory."
    
    # If key pair is not found ask user to create one or exit the program. 
    puts "Would you like to create a new key pair? Please enter 'yes' to continue or enter any key to exit."
    
    option = gets.chomp
    
    if option == "yes"
        generate_key_pair
    else
        puts "Goodbye..."
        exit
    end
end

sleep(2)

# Ask the user what they would like to do
puts "What would you like to do?"
puts "1. Encrypt a message"
puts "2. Decrypt a message"
puts "3. Generate new key pair (CAUTION: This will overwrite your existing key pair!)"

# Save input to option variable & loop until a valid option is selected. 
option = nil 
while !option.to_i.between?(1,3)
  puts "Enter Option Number"
  option = gets.chomp.to_i
  puts "Option #{option} selected."

if option == 1
    encrypt_message
elsif option == 2
    decrypt_message
elsif option == 3
    generate_key_pair
else
  puts "Invalid option! Please try again."
end
end


  

