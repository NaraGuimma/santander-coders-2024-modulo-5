select
	"LISTING_ID",
	"ID",
	"DATE",
	"REVIEWER_ID",
	"REVIEWER_NAME",
	"COMMENTS" 
from {{source ('ADA', 'reviews')}}