CREATE DATABASE game_atos;
REVOKE CONNECT ON DATABASE game_atos FROM PUBLIC;
GRANT CONNECT ON DATABASE game_atos TO supersede;
grant all privileges on database game_atos to supersede;
alter database game_atos owner to supersede;

