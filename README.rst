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

You may now start and stop the virtual machine by issuing command in the same directory::

    $ vagrant suspend

stops the virtual machine, saving an image of its state so that you may later restart with::

    $ vagrant resume

stop virtual machine::

    $ vagrant halt

start virtual machine::

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


References
----------

`How To Install Linux, Nginx, MySQL, PHP (LEMP Stack) on Debian 8 <https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-debian-8>`_
