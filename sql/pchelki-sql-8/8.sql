select *
from wp_posts;


select *
from wp_posts
where right(post_title, 1) = '.';


select *
from wp_posts
where right(post_title, 1) = '.'
    and right(post_title, 2) <> '..';


	
select post_title, 
    left(post_title, len(post_title)-1) new_pt
from wp_posts 
where right(post_title, 1) = '.' 
    and right(post_title, 2) <> '..';


	
select post_title, 
    reverse(substring(reverse(post_title), 2, 1000)) as new_pt
from wp_posts 
where right(post_title, 1) = '.' 
    and right(post_title, 2) <> '..';


	
update wp_posts
set wp_title = reverse(substring(reverse(post_title), 2, 1000))
where right(post_title, 1) = '.' 
    and right(post_title, 2) <> '..';