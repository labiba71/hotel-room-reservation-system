drop database link site_link;
create database link site_link
connect to system identified by "1234567"
using '(DESCRIPTION =
(ADDRESS_LIST =
(ADDRESS = (PROTOCOL = TCP)
(HOST = 192.168.0.106)
(PORT = 1521))
)
(CONNECT_DATA =(SID = XE))
)'
;