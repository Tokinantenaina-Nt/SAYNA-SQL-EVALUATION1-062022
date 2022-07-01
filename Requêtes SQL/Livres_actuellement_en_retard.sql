SELECT distinct livres.NL, oeuvres.NO, dateEmp,  titre, auteur, (DATE_ADD(dateEmp, INTERVAL dureeMax DAY)) as 'DateRetPrevu', 
DATEDIFF((DATE_ADD(dateEmp, INTERVAL dureeMax DAY)), curdate()) as 'duree passée (j)' 
FROM emprunter, livres, oeuvres
where  oeuvres.NO = livres.NO and emprunter.NL = livres.NL and dateRet is null  
and DATEDIFF((DATE_ADD(dateEmp, INTERVAL dureeMax DAY)), curdate()) < 0