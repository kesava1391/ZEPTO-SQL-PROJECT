-- A. Pricing & Discount Analysis
-- ------------------------------

-- Top 10 best value products based on discount
select distinct(name), discount_percent from zepto
order by zepto.discount_percent desc
fetch first 10 rows only;


-- Products with high MRP but low discount
select distinct name, mrp , discount_percent from zepto 
where mrp > 500 and discount_percent <10
order by mrp desc, discount_percent desc;


-- Top 5 categories with highest average discount
select category, round(avg(discount_percent),2) as discount_avg_percent from zepto
group by category
order by discount_avg_percent desc
fetch first 5 rows only;


-- B. Inventory & Stock Analysis
-- -----------------------------

-- High MRP products that are out of stock
select distinct(name), mrp from zepto
where outofstock = 'YES' and mrp>300
order by mrp desc;

-- Total inventory weight per category
select category, sum(weight_gms * available_quantity) as total_weight
from zepto
group by category
order by total_weight;


-- C. Revenue & Demand Analysis
-- ----------------------------

-- Estimated revenue by category
select category, sum(discounted_selling_price * quantity) as total_revenue
from zepto group by category
order by total_revenue;

-- Revenue loss due to out-of-stock products
select name,category,mrp,discounted_selling_price,quantity,
(discounted_selling_price * quantity) as estimated_lost_revenue
from zepto
where outofstock = 'yes'
order by estimated_lost_revenue desc
fetch first 10 rows only;


-- D. Value & Weight-Based Analysis
-- --------------------------------

-- Price per gram for products above 100g
select distinct name, weight_gms, discounted_selling_price, 
round(discounted_selling_price / weight_gms,2) as price_per_gram from zepto
where weight_gms >=100
order by price_per_gram;

-- Product weight classification
select distinct name, weight_gms,
case when weight_gms < 1000 then 'LOW'
when weight_gms <5000 then 'MEDIUM'
else 'bulk'
end as weight_category
from zepto;


-- E. Category Integrity Analysis (Advanced)
-- -----------------------------------------

-- Products appearing in multiple categories
select name,count(distinct category) as category_count
from zepto
group by name
having count(distinct category) > 1
order by category_count desc;




