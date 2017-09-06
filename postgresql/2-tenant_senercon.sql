CREATE DATABASE senercon;
REVOKE CONNECT ON DATABASE senercon FROM PUBLIC;
GRANT CONNECT ON DATABASE senercon TO supersede;
grant all privileges on database senercon to supersede;
alter database senercon owner to supersede;

