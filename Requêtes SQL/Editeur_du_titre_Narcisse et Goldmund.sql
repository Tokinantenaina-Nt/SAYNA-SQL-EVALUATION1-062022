SELECT distinct livres.NO , titre, auteur as 'de',  editeur as 'Editeur'
FROM oeuvres, livres where oeuvres.NO = livres.NO 
and titre = "Narcisse et Goldmund"