CREATE DATABASE game_siemens;
REVOKE CONNECT ON DATABASE game_siemens FROM PUBLIC;
GRANT CONNECT ON DATABASE game_siemens TO supersede;
grant all privileges on database game_siemens to supersede;
alter database game_siemens owner to supersede;

