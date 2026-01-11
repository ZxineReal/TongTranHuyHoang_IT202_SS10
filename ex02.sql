use social_network_pro;

create or replace view view_user_post as 
select u.user_id, count(p.post_id) as total_user_post
from users u
left join posts p on u.user_id = p.user_id
group by u.user_id;

select * from view_user_post;

create or replace view view_user_post as 
select u.full_name, u.user_id, count(p.post_id) as total_user_post
from users u
left join posts p on u.user_id = p.user_id
group by u.user_id;

select * from view_user_post;