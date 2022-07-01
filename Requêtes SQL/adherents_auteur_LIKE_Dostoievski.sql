SELECT distinct emprunter.NA, adherents.nom, prenom, tel,  emprunter.NL, livres.NO, titre, auteur 
FROM adherents, emprunter, livres, oeuvres
where adherents.NA = emprunter.NA and emprunter.NL = livres.NL and 
livres.NO = oeuvres.NO
and
auteur LIKE "%Fedor Dostoievski%"