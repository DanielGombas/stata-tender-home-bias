import delimited "data/raw/ted/ted-sample.csv", clear
keep iso_country_code win_country_code award_value_euro

* winsorize small tender values
replace award_value_euro = 500 if award_value_euro <500

* drop tenders with multiple winners
* FIXME: deal with multi-winner tenders
drop if strlen(win_country_code) > 2
drop if strlen(iso_country_code) > 2
drop if missing(win_country_code, iso_country_code)

save "data\derived\ted-columns.dta", replace
