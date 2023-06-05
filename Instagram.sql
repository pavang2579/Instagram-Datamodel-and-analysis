select * from posts;

UPDATE posts
SET caption = 'Best Pizza Ever'
WHERE post_id = 3;

- Selecting all the posts where user_id is 1

select * from posts where user_id = 1;

-- Selecting all the posts and ordering them by created_at in descending order
select *
from posts
order by created_id desc;

-- Counting the number of likes for each post 
-- and showing only the posts with more than 2 likes

select p.post_id, count(l.like_id) 	 from posts as p
join likes as l on p.post_id = l.post_id
group by p.post_id
having count(l.like_id)>2;

-- Finding the total number of likes for all post
select sum(number_likes) as total_likes
from (
	select count(l.like_id) as number_likes 
	from posts as p
	join likes as l on p.post_id = l.post_id
	group by p.post_id
) as likes_by_post;

-- Finding all the users who have commented on post_id 1
select name 
from users 
where user_id IN (
	select user_id 
	from comments 
	where post_id =1
);

-- Ranking the posts based on the number of likes
with cte as (
select p.post_id,count(l.like_id) as number_likes 
	from posts as p
	join likes as l on p.post_id = l.post_id
	group by p.post_id 
)
select 
post_id, 
number_likes,
DENSE_RANK() over(order by number_likes desc) as rank_by_likes
from cte

-- Finding all the posts and their comments using a Common Table Expression (CTE)
with cte as (
	select 
	p.post_id,
	p.caption,
	c.comment_text
	from posts as p
	left join comments as c 
	on p.post_id = c.post_id
)
select * from cte

-- Categorizing the posts based on the number of likes
with cte as(
	select p.post_id, count(l.like_id) as number_likes 
	from posts as p
	join likes as l on p.post_id = l.post_id
	group by p.post_id
)
select 
post_id,
number_likes,
CASE WHEN number_likes  < 2 THEN 'low_Likes'
WHEN number_likes = 2 THEN 'Few_Likes'
WHEN number_likes > 2 THEN 'Lot_Likes'
ELSE 'No Data'
END AS like_category
from cte


--Finding all the posts created in the last month

select *
from posts
where created_id >= CAST(DATE_TRUNC('MONTH', CURRENT_TIMESTAMP - INTERVAL '1 MONTH') AS DATE);

--Categorize the users based on the number of comments they have made.

with cte as (
	
)