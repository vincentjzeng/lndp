-- root account root/MnisND.!

--create the LNDP local development account
CREATE USER 'lndpalldev'@'localhost' IDENTIFIED BY 'zzzzzz0';
GRANT ALL PRIVILEGES ON *.* TO 'lndpalldev'@'localhost' WITH GRANT OPTION;

--create the LNDP local development account
CREATE USER 'lndpallrel'@'%' IDENTIFIED BY 'zzzzzz0';
GRANT ALL PRIVILEGES ON *.* TO 'lndpallrel'@'%' WITH GRANT OPTION;

--create the admin account for reload and process
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'zzzzzz0';
GRANT RELOAD,PROCESS ON *.* TO 'admin'@'localhost';

--remove users
--DROP USER 


