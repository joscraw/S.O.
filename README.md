# README

This project is using sqlite3 so there should be 
zero database configuration needed to get setup and running


SETUP WITHOUT VAGRANT 
---------------

You will need a minimum ruby version of 2.4.1 installed on your system.

1. $ gem install bundler (make sure bundler is installed)
2. $ git clone https://github.com/joscraw/S.O..git
3. $ cd $PROJECT_ROOT  
4. $ bundle install
5. $ bin/rails s


Go ahead and visit http://localhost:3000/ in your browser!



SETUP WITH VAGRANT
---------------
1. Head over to Vagrant and download and install the latest version for your system
https://www.vagrantup.com/downloads.html
2. Head over to virtual box and download and install the latest version for your sytem
https://www.virtualbox.org/wiki/Downloads
3. $ git clone https://github.com/joscraw/S.O..git
4. $ cd $PROJECT_ROOT 
5. $ vagrant up (This can take 5-10 minutes for your VM to be setup. Once this is done you can continue onto the next steps)
6. $ vagrant ssh
7. $ cd /var/www
8. $ bundle exec rails server -e development -b 0.0.0.0 -p 3000  (Run this command to start the server up)

Go ahead and visit http://192.168.56.108:3000/ in your browser!

RUN TEST SUITE
---------------

$ cd $PROJECT_ROOT  
$ rails test