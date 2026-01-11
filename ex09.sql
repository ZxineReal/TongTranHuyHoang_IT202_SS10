use social_network_pro;

create index idx_user_gender 
on users (gender);

create view view_user_activity as
select u.user_id, count(p.post_id) as total_posts, count(c.comment_id) as total_comments
from users u
join posts p on u.user_id = p.user_id
join comments c on u.user_id = c.user_id
group by u.user_id;

select * from view_user_activity;

select u.user_id, u.username, u.full_name, u.gender, u.email, v.total_posts, v.total_comments
from users u
join view_user_activity v on u.user_id = v.user_id
where total_posts > 5 and total_comments > 20 
order by total_comments desc 
limit 5;