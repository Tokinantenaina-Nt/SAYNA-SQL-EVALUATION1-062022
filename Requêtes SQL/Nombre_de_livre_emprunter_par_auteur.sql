SELECT distinct  auteur, count(livres.NO) as 'nombre de livre emprunter par auteur' 
FROM livres, oeuvres
where oeuvres.NO = livres.NO
GROUP BY oeuvres.NO order by count(livres.NO);