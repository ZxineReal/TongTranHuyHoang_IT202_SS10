use social_network_pro;

select post_id, content, created_at from posts 
where user_id = 1;

create index idx_created_at_user_id
on posts (created_at, user_id);

EXPLAIN ANALYZE
select post_id, content, created_at from posts 
where user_id = 1;

select user_id, username, email from users
where email = 'an@gmail.com';

create index idx_email 
on users (email);

EXPLAIN ANALYZE
select user_id, username, email from users
where email = 'an@gmail.com';

drop index idx_created_at_user_id
on posts;

drop index idx_email 
on users