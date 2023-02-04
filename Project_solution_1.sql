                                                              #--MANDATORY PROJECT 01--  ON MOVIEDB DATABASE#
			                    #-------------------------------------------------------------------------------------#

# 1. Write a SQL query to find the actors who were cast in the movie 'Annie Hall'. Return actor first name, last name and role.

use moviedb;    #-- TO ACTIVATE THE DATABASE--#
show tables;    #-- TO SEE ALL THE TABLES IN DATABASE--#   

select * from actors;           #-- TO GET THE ACTOR FIRST NAME,LAST NAME #
select * from movie_cast;       #-- TO GET THE ROLE COLUMN # FUTHER JOINED ACTORS TABLE AND MOVIE_CAST TABLE WITH -< ACT_ID >COMMON KEY COLUMN #--
select * from movie;            #-- FUTHER JOINED MOVIE_CAST TABLE AND MOVIE TABLE WITH < MOV_ID > COMMON KEY COLUMN 

select act_fname as 'actor first name',act_lname as 'actor last name',role from 
actors join movie_cast on actors.act_id=movie_cast.act_id
join  movie on movie.mov_id=movie_cast.mov_id
where mov_title='annie hall';                                    #--TO FULFILL THE WHERE CLAUSE FILTER CONDITION



# 2. From the following tables, write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'.
# Return director first name, last name and movie title.

select * from director;             #-- TO GET THE DIRECTOR FIRST NAME,LAST NAME #
select * from movie_direction;      #-- TO GET THE MOV_TITLE COLUMN --# FUTHER JOINED DIRECTOR TABLE AND MOVIE_DIRECTION TABLE-- < DIR_ID >COMMON KEY COLUMN 
select * from movie;                #--FURTHER JOINED MOVIE_DIRECTION TABLE AND MOVIE TABLE WITH <  MOV_ID > COMMON KEY COLUMN #

select dir_fname as 'Director first name',dir_lname as 'director last name',mov_title as 'movie title'
from director join movie_direction on director.dir_id= movie_direction.dir_id
join movie on movie.mov_id=movie_direction.mov_id
where mov_title='Eyes Wide Shut';                                #--TO FULFILL THE WHERE CLAUSE FILTER CONDITION



# 3.Write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’. Return director first name, last name and movie title.

select* from director;                #-- TO GET THE DIRECTOR FIRST NAME,LAST NAME #
select * from movie_direction;        #-- FURTHER JOINED DIRECTOR TABLE AND MOVIE_DIRECTION TABLE WITH < DIR_ID >COMMON COLUMN #
select * from movie;                  #--FURTHER JOINED  MOVIE_DIRECTION AND MOVIE TABLE WITH < MOV_ID > COMMON KEY COLUMN #-- AND TO GET THE MOVI_TITLE COLUMN 
select * from movie_cast;             #--FURTHER JOINED  MOVIE AND MOVIE_CAST TABLE WITH< MOV_ID > COMMON KEY COLUMN 

select dir_fname as 'director First Name' , dir_lname as 'director Last Name', mov_title as 'Movie title' from 
director join movie_direction on director.dir_id=movie_direction.dir_id
join movie on movie.mov_id=movie_direction.mov_id
join movie_cast on movie.mov_id=movie_cast.mov_id
where role='sean maguire';                                       #-- TO FULFILL THE WHERE CLAUSE FILTER CONDITION



# 4.Write a SQL query to find the actors who have not acted in any movie between 1990 and 2000(Begin and end values are included.). 
#Return actor first name, last name, movie title and release year. 

select * from actors;                #-- TO GET THE ACTOR FIRST NAME,LAST NAME # 
select * from movie_cast;            #-- FUTHER JOINED ACTORS TABLE AND MOVIE_CAST TABLE WITH -< ACT_ID >COMMON KEY COLUMN
select * from movie;                 #-- FUTHER JOINED MOVIE_CAST TABLE AND MOVIE TABLE WITH -< MOV_ID >COMMON KEY COLUMN # AND TO GET MOV_TITLE,MOV_YEAR   
 
select act_fname as 'actor first name', act_lname as 'actor last name', mov_title as 'movie title', mov_year as 'release year'
from actors join movie_cast on actors.act_id=movie_cast.act_id
join movie on movie.mov_id=movie_cast.mov_id
where mov_year not between 1990 and 2000;                        #--TO FULFILL THE WHERE FILTER CONDITION 



# 5. Write a SQL query to find the directors with the number of genres of movies. Group the result set on director first name,last name and generic title. 
#Sort the result-set in ascending order by director first name and last name.Return director first name, last name and number of genres of movies.

select * from director;                       #-- TO GET THE DIRECTOR FIRST NAME,LAST NAME #
select * from movie_direction;                #-- JOINED DIRECTOR AND MOVIE_DIRECTION TABLE WITH < DIR_ID >-- COMMON COLUMN #
select * from movie_genres;                   #-- JOINED MOVIE_DIRECTION AND MOVIE_GENRES TABLE WITH < MOV_ID >-- COMMON COLUMN #
select * from genres;                         #-- JOINED MOVIE_GENRES AND GENRES TABLE WITH < MOV_ID >-- COMMON COLUMN #

select dir_fname as 'director first name', dir_lname as 'director last name',gen_title as 'generic title', count(*) as 'number of genres of movies' from director 
join movie_direction on director.dir_id=movie_direction.dir_id
join movie_genres on movie_genres.mov_id= movie_direction.mov_id
join genres on genres.gen_id=movie_genres.gen_id
group by dir_fname, dir_lname, gen_title
order by dir_fname, dir_lname asc;

# OR #  ------------------- SINCE ALL THE TABLES HAS SINGLE COMMON COLUMN IS PRESENT-------------- # 
 
select dir_fname as 'director first name',dir_lname as 'director last name', gen_title as 'generic title',count(*) as 'number of genres of movies' from 
director natural join movie_direction natural join movie_genres natural join genres                #-- AUTOMATICALLY CREATED RELATION BETWEEN TABLES WITH KEY COLUMNS
group by dir_fname, dir_lname,gen_title
order by dir_fname,dir_lname asc;

#_________________________________________________________________________________________________________________________________________________________________________#
																#THE END#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#