SELECT  adherents.NA, nom, prenom, NL, dateEmp FROM adherents inner join emprunter 
where adherents.NA = emprunter.NA and prenom='Jeanette' and nom = 'Lecoeur' 
