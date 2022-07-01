SELECT adherents.*, (DATE_ADD(dateEmp, INTERVAL dureeMax DAY)) as 'DateRetPrevu', 
DATEDIFF((DATE_ADD(dateEmp, INTERVAL dureeMax DAY)), curdate()) as 'duree passée (j)'
FROM biblio.emprunter, adherents where adherents.NA = emprunter.NA and dateRet is null 
and DATEDIFF((DATE_ADD(dateEmp, INTERVAL dureeMax DAY)), curdate()) < 0