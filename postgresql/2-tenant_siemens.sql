CREATE DATABASE siemens;
REVOKE CONNECT ON DATABASE siemens FROM PUBLIC;
GRANT CONNECT ON DATABASE siemens TO supersede;
grant all privileges on database siemens to supersede;
alter database siemens owner to supersede;

