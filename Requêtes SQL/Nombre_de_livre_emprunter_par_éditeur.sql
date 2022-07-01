SELECT distinct   editeur , count(livres.editeur) 
as 'nombre livre emprunter par éditeur' 
FROM emprunter, livres 
where livres.NL = emprunter.NL group by livres.editeur order by count(livres.editeur) ;