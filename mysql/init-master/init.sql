CREATE USER 'user_slave'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
GRANT REPLICATION SLAVE ON *.* TO 'user_slave'@'%';
flush privileges;