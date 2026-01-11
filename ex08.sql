use social_network_pro;

create index idx_user_gender 
on users (gender);

create view view_popular_posts as
select p.post_id, u.username, p.content, count(l.user_id) as total_likes, count(c.user_id) as total_comments
from posts p 
join users u on p.user_id = u.user_id
join likes l on p.post_id = l.post_id
join comments c on p.post_id = c.post_id
group by p.post_id;

select * from view_popular_posts;

select post_id, username, content, total_likes, total_comments, (total_likes + total_comments) as total_interaction
from view_popular_posts
where (total_likes + total_comments) > 10
order by (total_likes + total_comments) desc;