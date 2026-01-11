use social_network_pro;

create or replace view view_users_firstname as 
select user_id, username, full_name, email, created_at
from users
where full_name like 'Nguyễn%';

select * from view_users_firstname;

insert into users(username, full_name, email, password) values 
('long', 'Nguyễn Gia Long', 'long@gmail.com', '123');

select * from view_users_firstname;

delete from users where user_id = 26;

select * from view_users_firstname;