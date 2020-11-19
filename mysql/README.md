### 获取主节点当前binary log文件名和位置（position）
SHOW MASTER STATUS;

### 在从（Slave）节点上设置主节点参数
CHANGE MASTER TO  
MASTER_HOST='mysql-master',  
MASTER_USER='user_slave',  
MASTER_PASSWORD='123456',  
MASTER_LOG_FILE='mysql-bin.000003',  
MASTER_LOG_POS=135;  

### 查看主从同步状态  
show slave status\G;

### 开启主从同步
start slave;  