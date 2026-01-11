use social_network_pro;

create index idx_hometown 
on users (hometown);

select u.user_id, u.username, u.full_name, u.hometown, p.post_id, p.content from users u
join posts p on u.user_id = p.user_id
where hometown = 'Hà Nội'
order by username desc 
limit 10;

EXPLAIN ANALYZE
select u.user_id, u.username, u.full_name, u.hometown, p.post_id, p.content from users u
join posts p on u.user_id = p.user_id
where hometown = 'Hà Nội'
order by username desc 
limit 10;