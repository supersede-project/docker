CREATE DATABASE atos;
REVOKE CONNECT ON DATABASE atos FROM PUBLIC;
GRANT CONNECT ON DATABASE atos TO supersede;
grant all privileges on database atos to supersede;
alter database atos owner to supersede;

