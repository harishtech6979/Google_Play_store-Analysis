create database google_play_store;
use google_play_store;
select * from gp_store;

-- =========================================================
-- GOOGLE PLAY STORE SQL PRACTICE QUESTIONS
-- =========================================================


-- Q1. Find the total number of apps in the dataset.
select count(App) as total_App_in_DataBase from gp_store;

-- Q2. Find the total number of unique app categories.
select Category,count(*) as Total_Apps from gp_store
group by Category
order by Total_Apps desc ;


-- Q3. Display all unique app categories.
select   distinct Category from gp_store;

-- Q4. Find the total number of free and paid apps.
select Type ,count(*) as Total_NUmber
from gp_store 
group by Type;

-- Q5. Find the average rating of all apps.
select App, avg(Rating) as Average_Rating from gp_store
group  by App
;
-- Q6. Find the maximum rating.
select max(Rating) as Maximum_Rating
 from gp_store order by Maximum_Rating desc limit 1;

-- Q7. Find the minimum rating.
select min(Rating) as Minimum_Rating from gp_store 
order by  Minimum_Rating asc limit 1;

-- Q8. Find the app with the highest number of reviews.
select App,max(Rating) as `highest number of reviews` from gp_store
group by App  order by `highest number of reviews` desc  limit 1;

-- Q9. Find the app with the highest number of installs.
select App ,Installs from gp_store
 order by Installs desc limit 1;

-- Q10. Find the top 10 apps based on reviews.
select App,Reviews from gp_store
order by Reviews desc limit 10;

-- Q11. Find the top 10 apps based on installs.
select App,Installs from gp_store
order by Installs desc limit 10;

-- Q12. Find the number of apps in each category.
select Category,count(App) as No_Of_App  from gp_store 
group by Category order by No_Of_App  ;

-- Q13. Find the average rating for each category.
select Category, avg(Rating) as Average_Rating from gp_store
group by Category;

-- Q14. Find the total reviews for each category.
select Category, sum(Reviews) as Total_Revive from gp_store
group by Category;

-- Q15. Find the total installs for each category.
select Category, sum(Installs) as Total_Installation from gp_store
group by Category;

-- Q16. Find the number of free and paid apps in each category.
select Category,Type,count(Type) as No_Of_App from gp_store
group by Category,Type
order by Category,Type ;

-- check 
select * from gp_store where  not Type ='Free';

-- Q17. Find the number of apps for each content rating.
select `Content Rating`,count(App) as Number_Of_App from gp_store
group by `Content Rating`;

-- Q18. Find the average price of paid apps.
select App, avg(Price) as Avrage_price  from gp_store
where  not Type='Free' group by App;

-- Q19. Find the most expensive paid app.
select max(Price) as maximum_Price  from gp_store;

-- Q20. Find apps with a rating greater than 4.5.
select App,Rating from gp_store
where Rating > 4.5
group by App,Rating ;

-- Q21. Find apps with more than 100,000 reviews.
select App ,Reviews from gp_store
where Reviews >  100000
group by App ,Reviews ;

-- Q22. Find apps with more than 1,000,000 installs.
select App,Installs from gp_store
where Installs > 1000000
group by App,Installs;

-- Q23. Find paid apps with a rating greater than 4.5.
select Type ,Rating from gp_store 
where Rating > 4.5 and  not Type ='Free'
group by Type ,Rating;

-- Q24. Find the top 10 categories by number of apps.
select Category,count(App) as No_Of_App from gp_store
group by Category order by No_Of_App desc limit 10;

-- Q25. Find the top 10 categories by total installs.
select Category ,sum(Installs) as total_install from gp_store
group by Category  order by total_install limit 10;

-- Q26. Find the top 10 categories by total reviews.
select Category  ,sum(Reviews) as Total_Reviews
from gp_store
group by Category order by Total_Reviews limit 10;

-- Q27. Find the category with the highest average rating.
select Category,avg(Rating) as Max_Average_Rating from gp_store
group by Category order by Max_Average_Rating  desc limit 1 ; 

-- Q28. Find the category with the lowest average rating.
select Category, avg(Rating)  as Min_Avg_Rating from gp_store
group by Category order by Min_Avg_Rating asc limit 1;

-- Q29. Find the highest-rated app in each category.
select App,Category,max(Rating) as maximum_Rating from gp_store
group by App,Category order by maximum_Rating desc ;

-- Q30. Find the most-reviewed app in each category.


SELECT g.Category, g.App, g.Reviews
FROM gp_store g
WHERE g.Reviews = (
    SELECT MAX(Reviews)
    FROM gp_store
    WHERE Category = g.Category
);

-- Q31. Find the most-installed app in each category.
select g.App,g.Installs,g.Category from gp_store g
 where g.Installs =( 
 select max(Installs) from gp_store
 where g.Category = Category 
 );
 

-- Q32. Find the second-highest-rated app.
SELECT App, Rating
FROM gp_store
ORDER BY Rating DESC
LIMIT 1 OFFSET 1;

-- Q33. Find the top 3 most-reviewed apps in each category.


-- Q34. Find apps whose rating is higher than their category's average rating.
select App, Category,Rating from gp_store
where Rating > (select avg(g.Category) from gp_store g)
limit 0,10000;
 

-- Q35. Find apps whose reviews are higher than their category's average reviews.
select App, Reviews,Category from gp_store
where Reviews > (select avg(g.Category) from gp_store g)
group by App, Reviews,Category ;

-- Q36. Find the percentage of free apps.
select count(*)*100 / (select count(App) from gp_store) 
 as percentage_free from gp_store
group by Type;

-- Q37. Find the percentage of paid apps.
select count(*)*100 / (select count(*) from gp_store)
 as percentage_Paid from gp_store
where Type = 'Paid';

-- Q38. Find the average rating of free vs paid apps.
select 
Type,
avg(Rating) as average_rating
from gp_store
group by Type;
-- Q39. Find the average reviews of free vs paid apps.
select Type ,
avg(Reviews) as Average_Reviews
from gp_store
group by Type;

-- Q40. Find the average installs of free vs paid apps.
select Type ,
avg(Installs) as Average_INstall
from gp_store
group by Type;

-- Q41. Find the category with the highest number of paid apps.
select Category,
count(App) as paid_App from gp_store
where Type = 'Paid'
group by Category
order by paid_App;


-- Q42. Find the category with the highest percentage of paid apps.
select Category,
count(*)*100 /(select count(*) from gp_store) as Higest_percentage
from gp_store
where Type ='Paid'
group by Category;

-- Q43. Find apps with high installs but low ratings.
select App, Installs,Rating
from gp_store
where Installs > 100000 and Rating < 3.0
order by Installs desc, Rating asc;

select max(Installs) from gp_store;
select min( Rating) from gp_store;

-- Q44. Find apps with high ratings but low reviews.
select App,Rating ,Reviews
from gp_store
where Rating  >=( select max(Rating) from gp_store) and 
Reviews <= (select min(Reviews) from gp_store)
order by Rating desc, Reviews asc;

-- Q45. Find the top 10 paid apps by estimated revenue using Price × Installs.
select App
,sum(Price * Installs) as  Estimated_revenue
from gp_store
group by App
order by Estimated_revenue desc limit 10;

-- Q46. Find the total estimated revenue of paid apps by category.
 select Category,App,
 sum(Installs*Price) as estimated_revenue
 from gp_store
 where Type ='Paid'
 group by Category,App
 order by estimated_revenue;

-- Q47. Find the category with the highest estimated revenue.
select Category ,sum(values(Installs)*Price)  as Higest_Revenue from gp_store 
group by Category;
-- Q48. Find the average price of paid apps in each category.
select App,Category, avg(Price)  as Average_Price ,Type
from gp_store where Type = 'Paid'
group by App,Category order by Average_Price ;

-- Q49. Find the number of apps updated in each year.
select count(App) as no_of_App,YEAR(STR_TO_DATE(`Last Updated`, '%d-%b-%y')) AS year_value
from gp_store
group by year_value order by no_of_App;

-- Q50. Find the year in which the highest number of apps were updated.
select year(str_to_date(`Last Updated`,'%d-%b-%y')) as year_ , count(App) as no_of_App
from gp_store group by year_ order by no_of_App desc limit 1;


-- =========================================================
-- END OF SQL PRACTICE
-- =========================================================