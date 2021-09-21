--Find the number of different street names for each postal code, for the given business dataset. For simplicity, just count the first part of the name if the street name has multiple words. 

SELECT business_postal_code,
       COUNT(DISTINCT LOWER(SPLIT_PART(business_address, ' ', 2))) AS street_name
FROM sf_restaurant_health_violations
GROUP BY business_postal_code;