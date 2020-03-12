CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES on wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
