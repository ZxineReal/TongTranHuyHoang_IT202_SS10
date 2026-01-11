use social_network_pro;

EXPLAIN ANALYZE
select * from users
where hometown = 'Hà Nội';

create index idx_hometown
on users(hometown);

EXPLAIN ANALYZE
select * from users
where hometown = 'Hà Nội';

drop index idx_hometown 
on users;