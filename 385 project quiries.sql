	#name and age above 25
SELECT Fname, Lname, age
FROM crime.person, crime.drivers_license
WHERE age > 25 AND person.license_id = drivers_license.license_id ; 

	#name and age below 25
 SELECT Fname, Lname, age
FROM crime.person, crime.drivers_license
WHERE age < 25 AND person.license_id = drivers_license.license_id ; 

	# name and verdict
 SELECT Fname, Lname, verdict
FROM crime.person, crime.drivers_license, crime.court
WHERE age > 25 AND person.license_id = drivers_license.license_id AND court.crt_id = person.crm_id ; 

	#name and crime type (male)
 SELECT Fname, Lname, gender, crm_type
FROM crime.person, crime.drivers_license, crime.crime
WHERE gender = 'Male' AND person.license_id = drivers_license.license_id AND person.crm_id = crime.crm_id ; 

	#name and crime type (female)
 SELECT Fname, Lname, gender, crm_type
FROM crime.person, crime.drivers_license, crime.crime
WHERE gender = 'Female' AND person.license_id = drivers_license.license_id AND person.crm_id = crime.crm_id ; 

	#name, gender, crime type and location
 SELECT Fname, Lname, gender, crm_type, crm_location
FROM crime.person, crime.drivers_license, crime.crime
WHERE person.license_id = drivers_license.license_id AND person.crm_id = crime.crm_id ; 

	#crimes in winona and verdict
 SELECT Fname, Lname, gender, crm_type, crm_county, verdict
FROM crime.person, crime.drivers_license, crime.crime, crime.court
WHERE crm_county = 'winona county' AND  person.license_id = drivers_license.license_id AND person.crm_id = crime.crm_id AND court.crt_id = crime.crm_id ; 

	#crimes in wabasha and verdict
SELECT Fname, Lname, gender, crm_type, crm_county, verdict
FROM crime.person, crime.drivers_license, crime.crime, crime.court
WHERE crm_county = 'wabasha county' AND  person.license_id = drivers_license.license_id AND person.crm_id = crime.crm_id AND court.crt_id = crime.crm_id ; 


 SELECT Fname, Lname, age, crm_type, crm_location, verdict
FROM crime.person, crime.drivers_license, crime.crime, crime.court
WHERE age < 25 AND person.license_id = drivers_license.license_id AND person.crm_id = crime.crm_id AND court.crt_id = crime.crm_id ; 

	#crime in winona county plus court data and time
SELECT Fname, Lname, crm_type, crt_date, crt_time, verdict
FROM crime.person, crime.crime, crime.court
WHERE crm_county = 'winona county' AND person.crm_id = crime.crm_id AND court.crt_id = crime.crm_id 
