CREATE DATABASE game_senercon;
REVOKE CONNECT ON DATABASE game_senercon FROM PUBLIC;
GRANT CONNECT ON DATABASE game_senercon TO supersede;
grant all privileges on database game_senercon to supersede;
alter database game_senercon owner to supersede;

