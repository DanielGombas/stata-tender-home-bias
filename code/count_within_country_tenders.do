use "data/derived/ted-columns.dta", clear

count
*count within-country tenders
count if iso_country_code == win_country_code

*count cross-country tenders
count if iso_country_code != win_country_code

*shorter way of creating dummy
gen same_country = (iso_country_code == win_country_code)

tabulate same_country

*award_value is very scewed, with huge outliers, model ln() insteas

gen ln_award_value_euro = ln(award_value_euro)
reg ln_award_value_euro same_country, r

*create histogram by dummy
hist ln_award_value_euro, by(same_country)
graph export "figure/value_histogram.pdf"