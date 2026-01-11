use social_network_pro;

create index idx_name 
on users (username);

create view view_user_activity_2 as
select u.user_id, u.username, u.full_name, u.gender, u.email, u.hometown, count(p.post_id) as total_posts, 
count(distinct
case
when f.user_id = u.user_id then f.friend_id
when f.friend_id = u.user_id then f.user_id
end
) as total_friends
from users u
join posts p on u.user_id = p.user_id
join friends f on u.user_id = f.user_id and f.status = 'accepted'
group by u.user_id;

select * from view_user_activity_2;

select u.full_name, v.total_posts, v.total_friends,
(case
when v.total_friends > 5 then 'Nhiều bạn bè'
when v.total_friends between 2 and 5 then 'Vừa đủ bạn bè'
when v.total_friends < 2 then 'Rất ít bạn bè'
end
) as friend_description,
(case
when v.total_posts > 10 then v.total_posts * 1.1
when v.total_posts between 5 and 10 then v.total_posts
when v.total_posts < 5 then v.total_posts * 0.9
end
) as post_activity_score
from users u
join view_user_activity_2 v on u.user_id = v.user_id
where v.total_posts > 0 
order by total_posts desc;
