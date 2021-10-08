--Find the number of times the words 'bull' and 'bear' occur in the contents. We're counting the number of times the words occur so words like 'bullish' should not be included in our count.
--Output the word 'bull' and 'bear' along with the corresponding number of occurrences.

select 'bull' as word,
sum(case when contents ilike '%bull %' then 1 else 0 
end) as count_words
from google_file_store
union
select 'bear' as word,
sum(case when contents ilike '%bear %' then 1 else 0 
end) as count_words
from google_file_store;

