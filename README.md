# ruby_message_encryptor
Ruby Message Encryptor by Luke Littler

Prerequisites

This program needs the following to run: 

Ruby installation
openssl gem
encrypto_signo gem


Installation

To install ruby please visit:
https://www.ruby-lang.org/en/documentation/installation/ 

When ruby is installed, open the command line (Windows) or Terminal (MacOS, Linux)

Enter the following commands: 
gem install openssl
gem install encrypto_signo


Starting the program

Open the command line (Windows) or Terminal (MacOS, Linux) and change to the ruby_message_encryptor directory: 

Example:
cd user/downloads/ruby_message_encryptor

Enter the following command: 
ruby ruby_message_encryptor.rb 

The program will then begin.


Generating a Key Pair 

The program will generate you a key pair on startup if one is not found. 
If you create a new key pair your existing key pair will be overwritten so be careful and make backups!

Your private key will be generated in the ruby_message_encryptor root directory.
Your public key will be generated in the ruby_message_encryptor/contacts directory.

The keys generated are RSA keys. 


Adding Contacts

To add a new contacts public key create a new .txt file in the contacts folder.
Copy the contacts public key and paste into the file.
Save the file to the contacts folder in the ruby_message_encryptor directory.  
The file name can begin with anything, for example the persons name. 
The file must end with _public_key.txt. 

Example: 
lukes_public_key.txt
abduls_public_key.txt


Encrypting a Message

Messages will be encrypted using the contacts public key. 
The program will list your contacts public keys and you can choose which key to encrypt your message with. 

Your encrypted message will display in the terminal and also be saved as encrypted_message.txt 
in the messages folder. 

Creating an encrypted message will overwrite any previous message.


Decrypting a Message

To decrypt a recieved message, the message must have been encrypted using your public key.
This can be found in the your_public_key.txt file in the contacts folder.

Your private key must be in the ruby_message_encryptor root directory.  

Copy the encrypted message and create a file in the messages folder called encrypted_message.txt. 
If one already exists replace the content of that file and save.

The decrypted message will display in the terminal and will also be saved as decrypted_message.txt
in the messages folder. 

Decrypting a message will overwrite any previous decrypted messages. 





