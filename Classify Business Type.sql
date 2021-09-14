--Classify each business as either a restaurant, cafe, school, or other. A restaurant should --have the word 'restaurant' in the business name. For cafes, either 'cafe', 'café', or --coffee' can be in the business name. 'School' should be in the business name for schools. --All other businesses should be classified as 'other'.

SELECT DISTINCT business_name,
CASE 
    WHEN business_name ILIKE '%restaurant%' THEN 'Restaurant'
    WHEN business_name ILIKE '%cafe%' THEN 'Cafe'
    WHEN business_name ILIKE '%taqueria%' THEN 'Taqueria'
    WHEN business_name ILIKE '%kitchen%' THEN 'Kitchen'
    WHEN business_name ILIKE '%garden%' THEN 'Garden'
    WHEN business_name ILIKE '%school%' THEN 'School'
    ELSE 'Other'
END AS business_type
FROM sf_restaurant_health_violations;