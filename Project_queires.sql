#### Queires I need for showing my visulizations

#Q. Top animes watched by females ,males and non binary.Based on gender

select distinct a.title,
count(distinct r.uid) as no_of_users,
round(avg(r.score),2) as avg_score
from anime_new a
left join review r on a.anime_id=r.anime_id
left join profile p on r.profile=p.profile
where gender ='Female'
group by a.title
having no_of_users >100
order by avg_score DESC
limit 10;

# Top animes watched by males

select distinct a.title,count(distinct r.uid) as no_of_users,round(avg(r.score),2) as avg_score
from anime_new a
left join review r on a.anime_id=r.anime_id
left join profile p on r.profile=p.profile
where gender ='Male'
group by a.title
having no_of_users >200
order by avg_score DESC;

select distinct a.title,
count(distinct r.uid) as no_of_users,
round(avg(r.score),2) as avg_score
from anime_new a
left join review r on a.anime_id=r.anime_id
left join profile p on r.profile=p.profile
where gender not in ('Female','Male')
group by a.title
having no_of_users >100
order by avg_score DESC;


####### Top animes based on score,story,animation,sound,characters and enjoyment

select distinct a.title,
count(distinct r.uid) as no_of_users,
round(avg(r.story),1) as avg_story
from anime_new a 
left join review r on a.anime_id=r.anime_id
group by title
having avg_story > 7 and no_of_users >100
order by avg_story DESC;
 
select distinct a.title,
count(distinct r.uid) as no_of_users,
round(avg(r.animation),1) as avg_animation
from anime_new a 
left join review r on a.anime_id=r.anime_id
group by title
having avg_animation > 7 and no_of_users >100
order by avg_animation DESC;


select distinct a.title,
count(distinct r.uid) as no_of_users,
round(avg(r.sound),1) as avg_sound
from anime_new a 
left join review r on a.anime_id=r.anime_id
group by title
having avg_sound> 7 and no_of_users >100
order by avg_sound DESC;


select distinct a.title,count(distinct r.uid) as no_of_users,round(avg(r.characters),1) as avg_characters
from anime_new a 
left join review r on a.anime_id=r.anime_id
group by title
having avg_characters> 7 and no_of_users >300
order by avg_characters DESC;



#Score
select distinct a.title,count(distinct r.uid) as no_of_users,round(avg(r.overall),1) as avg_overall
from anime_new a 
left join review r on a.anime_id=r.anime_id
group by title
having avg_overall> 7 and no_of_users >100
order by avg_overall DESC;

#Popularity
select distinct a.title,
count(distinct r.uid)as no_of_users ,
round(avg(r.score),2) as avg_score,
a.popularity
from anime_new a
left join review r on a.anime_id=r.anime_id
group by title,a.popularity
having no_of_users >100
order by a.popularity ;

#Genre
select distinct a.title,
count(distinct r.uid)as no_of_users,
round(avg(r.score),2) as avg_score
from anime_new a
left join review r on a.anime_id=r.anime_id
where genre='Comedy'#Changed in into various genre depending on the order
group by title
having no_of_users >100
order by avg_score DESC;


select genre, count(distinct anime_id) as total_anime
from anime_new
group by genre;

select distinct title,members,popularity
from anime_new
order by popularity
