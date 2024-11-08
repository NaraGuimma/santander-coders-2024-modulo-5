select
	"LISTING_ID" ,
	"DATE" ,
	"AVAILABLE",
	"PRICE",
	"ADJUSTED_PRICE",
	"MINIMUM_NIGHTS",
	"MAXIMUM_NIGHTS"

from {{source ('ADA', 'calendar')}}
