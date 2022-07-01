SELECT distinct adherents.NA, nom, prenom, dateEmp, dureeMax, dateRet, 
(DATE_ADD(dateEmp, INTERVAL dureeMax DAY)) as 'DateRetPrevu',
(CASE
            WHEN ( (DATEDIFF((DATE_ADD(dateEmp, INTERVAL dureeMax DAY)), dateRet)) is null) 
            THEN DATEDIFF((DATE_ADD(dateEmp, INTERVAL dureeMax DAY)), curdate())
			WHEN ((DATEDIFF((DATE_ADD(dateEmp, INTERVAL dureeMax DAY)), dateRet)) is not null) 
            THEN DATEDIFF((DATE_ADD(dateEmp, INTERVAL dureeMax DAY)), dateRet)
END) as 'duree passée (j)'
FROM emprunter, adherents where adherents.NA = emprunter.NA
and DATEDIFF((DATE_ADD(dateEmp, INTERVAL dureeMax DAY)), dateRet) < 0
or adherents.NA = emprunter.NA and dateRet is null 
and DATEDIFF((DATE_ADD(dateEmp, INTERVAL dureeMax DAY)), curdate()) < 0