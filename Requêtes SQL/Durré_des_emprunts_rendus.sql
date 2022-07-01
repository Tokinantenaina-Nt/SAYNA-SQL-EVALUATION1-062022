SELECT distinct NL, abs(datediff(dateEmp, dateRet))
as "Durée de retour des livres rendus (j)"
FROM biblio.emprunter 
where dateRet is not null 