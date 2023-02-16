use "data/derived/ted-columns.dta", clear

count
*count within-country tenders
count if iso_country_code == win_country_code

*count cross-country tenders
count if iso_country_code != win_country_code

generate same_country = 0
replace same_country = 1 if iso_country_code == win_country_code

*shorter way of creating dummy
replace same_country = (iso_country_code == win_country_code)

tabulate same_country