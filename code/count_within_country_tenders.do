use "data/derived/ted-columns.dta", clear

count
*count within-country tenders
count if iso_country_code == win_country_code

*count cross-country tenders
count if iso_country_code != win_country_code