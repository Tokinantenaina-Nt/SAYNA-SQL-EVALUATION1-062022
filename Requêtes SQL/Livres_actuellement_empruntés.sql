SELECT DISTINCT livres.NL as 'Livre actuellement emprunté',  livres.NO, 
oeuvres.titre, oeuvres.auteur
FROM emprunter, adherents, livres, oeuvres WHERE dateRet IS NULL 
and adherents.NA = emprunter.NA 
and livres.NL = emprunter.NL and oeuvres.NO = livres.NO