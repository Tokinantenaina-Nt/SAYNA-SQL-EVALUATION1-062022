SELECT (sum(datediff(dateEmp, dateRet)) / count(emprunter.NL))
as "Durée moyenne de retour des livres rendus (j)"
FROM biblio.emprunter 
where dateRet is not null 