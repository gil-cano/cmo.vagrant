CMO Vagrant
===========

This is a kit for setting up a development enviroment for LEMP stack (Linux, Nginx, MySQL, PHP) in a hosted virtual machine.

Installation
------------

1. Install `VirtualBox <https://www.virtualbox.org>`_

2. Install `Vagrant <http://www.vagrantup.com>`_

3. Clone the repository::

    $ git clone  https://github.com/gil-cano/cmo.vagrant.git

4. Change directory into the cmo.vagrant directory. Run "vagrant up"::

    $ cd cmo.vagrant
    $ vagrant up

This is going to download a virtual box kit, download and install `Nginx <https://www.nginx.com/>`_, `PHP <http://php.net/>`_, `MySQL <https://www.mysql.com/>`_, and set up some convenience scripts.

Using the Vagrant-installed VirtualBox
--------------------------------------

To you get a command prompt on your "guest" machine use the command::

    $ vagrant ssh

You may now start and stop the virtual machine by issuing command in the same directory.

Stop the virtual machine, saving an image of its state so that you may later resume::

    $ vagrant suspend

resume virtual machine from previus state::

    $ vagrant resume

stop virtual machine::

    $ vagrant halt

reload virtual machine (this will update configuration)::

    $ vagrant reload

Finally, you may remove the VirtualBox (deleting its image) with the command::

    $ vagrant destroy


Test Configuration
------------------

We can test it to validate that Nginx can correctly hand .php files off to our PHP processor.

In your web browser open the page::

    http://localhost:8088/info.php


For now, remove the file by typing::

    $ vagrant ssh
    $ sudo rm /var/www/html/info.php

Install CMO
-----------

copy application to /var/www/html::

    $ ln -s /vagrant/app /var/www/html/

go to::

    http://localhost:8088/app/welcome.php

(disable validation in welcome.php for testing)

Install cmo database (usurios.php)::

    $ mysql -u user -p
    mysql> CREATE DATABASE databasename;
    mysql> CREATE USER 'user'@'localhost' IDENTIFIED BY 'some_password';
    mysql> GRANT ALL ON databasename.* TO 'user'@'localhost';
    mysql> \q
    $ mysql -u user -p databasename < dump_file.sql


MySQL access from host
----------------------

Grant access to database ::

    mysql> CREATE USER 'user'@'%' IDENTIFIED BY 'some_password';
    mysql> GRANT ALL ON databasename.* TO 'user'@'%';


Update Database
---------------

Delete database (When a database is dropped, user privileges on the database are not automatically dropped) ::

    mysql> DROP DATABASE IF EXISTS cons_cmo;


References
----------

`How To Install Linux, Nginx, MySQL, PHP (LEMP Stack) on Debian 8 <https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-debian-8>`_

`mysql-vagrant <https://github.com/AlexDisler/mysql-vagrant>`_
