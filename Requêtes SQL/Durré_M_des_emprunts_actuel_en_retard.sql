SELECT abs((sum(`duree passée (j)`)/count(NL))) 
as 'durée moyenne des retards emprunts actuel' 
FROM biblio.`durée_livres_retardés_actuellement`;
