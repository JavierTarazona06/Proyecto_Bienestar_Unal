-- Tomás ------
-- user admin del Iparm
create user "adminIPARM"@"localhost" identified by "root";
grant all on vw_direcciónIparm  to "adminIPARM"@"localhost" ;

-- create user madre Ana
create user "Ana"@"localhost" identified by "root";
grant select on vw_userAna to "Ana"@"localhost";
grant select on  vw_childAna to "Ana"@"localhost";
grant select on vw_inscripChildAna to "Ana"@"localhost";

-- Tomás --