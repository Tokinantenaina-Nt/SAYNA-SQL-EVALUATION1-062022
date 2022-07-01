-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.2:3307
-- Généré le :  ven. 01 juil. 2022 à 22:17
-- Version du serveur :  10.3.15-MariaDB
-- Version de PHP :  7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `biblio`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherents`
--

CREATE TABLE `adherents` (
  `NA` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `adr` varchar(100) NOT NULL,
  `tel` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adherents`
--

INSERT INTO `adherents` (`NA`, `nom`, `prenom`, `adr`, `tel`) VALUES
(1, 'Lecoeur', 'Jeanette', '16 rue de la République, 75010 Paris', '0145279274'),
(2, 'Lecoeur', 'Philippe', '16 rue de la République, 75010 Paris', '0145279274'),
(3, 'Dupont', 'Yvan', '73 rue Lamarck, 75018 Paris', '0163538294'),
(4, 'Mercier', 'Claude', '155 avenue Parmentier, 75011 Paris', '0136482736'),
(5, 'Léger', 'Marc', '90 avenue du Maine, 75014 Paris', '0164832947'),
(6, 'Martin', 'Laure', '51 boulevard Diderot, 75012 Paris', '0174693277'),
(7, 'Crozier', 'Martine', '88 rue des Portes Blanches, 75018 Paris', '0146829384'),
(8, 'Lebon', 'Clément', '196 boulevard de Sebastopol, 75001 Paris', '0132884739'),
(9, 'Dufour', 'Jacques', '32 rue des Alouettes, 75003 Paris', '0155382940'),
(10, 'Dufour', 'Antoine', '32 rue des Alouettes, 75003 Paris', '0155382940'),
(11, 'Dufour', 'Stéphanie', '32 rue des Alouettes, 75003 Paris', '0155382940'),
(12, 'Raymond', 'Carole', '35 rue Oberkampf, 75011 Paris', '0153829402'),
(13, 'Durand', 'Albert', '4 rue Mandar, 75002 Paris', '0642374021'),
(14, 'Wilson', 'Paul', '12 rue Paul Vaillant Couturier, 92400 Montrouge', '0642327407'),
(15, 'Grecault', 'Philippe', '15 rue de la Roquette, 75012 Paris', '0132762983'),
(16, 'Carre', 'Stéphane', '51 boulevard Diderot, 75012 Paris', '0174693277'),
(17, 'Johnson', 'Astrid', '3 rue Léon Blum, 75002 Paris', '0143762947'),
(18, 'Mirou', 'Caroline', '2 square Mirabeau, 75011 Paris', '0163827399'),
(19, 'Espelette', 'Jean-Jacques', '141 avenue de France, 75019 Paris', '0134887264'),
(20, 'Despentes', 'Anthony', '56 boulevard de la Villette, 75019 Paris', '0133889463'),
(21, 'Terlu', 'Véronique', '45 rue des Batignolles, 75020 Paris', '0165998372'),
(22, 'Rihour', 'Cécile', '7 rue Montorgueil, 75002 Paris', '0166894754'),
(23, 'Franchet', 'Pierre', '160 rue Montmartre, 75009 Paris', '0633628549'),
(24, 'Trochet', 'Ernest', '34 rue de l\'Esperance, 75008 Paris', '0638295563'),
(25, 'Gainard', 'Simon', '55 rue Desnouettes, 75015 Paris', '0174928934'),
(26, 'Touche', 'Johanna', '14 rue du Bac, 75006 Paris', '0619384065'),
(27, 'Cornu', 'Sylvain', '22 rue Mouffetard, 75005 Paris', '0184927489'),
(28, 'Frederic', 'Cyril', '15 rue du Simplon, 75018 Paris', '0173625492'),
(29, 'Crestard', 'Cedric', '5 rue Doudeauville, 75018 Paris', '0629485700'),
(30, 'Le Bihan', 'Karine', '170 bis rue Ordener, 75018 Paris', '0638995221'),
(31, 'Olivier', 'DUPOND', '76, quai de la Loire, 75018 Paris', '0102030405');

--
-- Déclencheurs `adherents`
--
DELIMITER $$
CREATE TRIGGER `adherents_BEFORE_INSERT` BEFORE INSERT ON `adherents` FOR EACH ROW BEGIN
SET new.nom = upper(new.nom);

SET new.prenom = concat(
upper (left(new.prenom,1)) ,
lower (substring(new.prenom,2)) 
 );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `durée des livres en retard`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `durée des livres en retard` (
`NA` int(11)
,`nom` varchar(30)
,`prenom` varchar(30)
,`dateEmp` date
,`dureeMax` int(11)
,`dateRet` date
,`DateRetPrevu` date
,`jPassed` int(7)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `durée_livres_retardés_actuellement`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `durée_livres_retardés_actuellement` (
`NL` int(11)
,`NO` int(11)
,`dateEmp` date
,`titre` varchar(150)
,`auteur` varchar(100)
,`DateRetPrevu` date
,`duree passée (j)` int(7)
);

-- --------------------------------------------------------

--
-- Structure de la table `emprunter`
--

CREATE TABLE `emprunter` (
  `NL` int(11) NOT NULL,
  `dateEmp` date NOT NULL DEFAULT current_timestamp(),
  `dureeMax` int(11) NOT NULL DEFAULT 14,
  `dateRet` date DEFAULT NULL,
  `NA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `emprunter`
--

INSERT INTO `emprunter` (`NL`, `dateEmp`, `dureeMax`, `dateRet`, `NA`) VALUES
(1, '2021-07-16', 21, '2021-07-17', 26),
(1, '2022-01-29', 14, '2022-02-09', 3),
(1, '2022-03-17', 14, '2022-03-22', 2),
(1, '2022-06-03', 14, '2022-06-08', 1),
(2, '2022-05-25', 14, '2022-06-03', 4),
(2, '2022-06-21', 14, '2022-07-01', 28),
(3, '2022-06-10', 14, '2022-06-14', 3),
(4, '2021-08-12', 21, '2021-08-25', 4),
(4, '2021-11-11', 14, '2021-11-15', 12),
(4, '2022-03-20', 14, '2022-03-30', 5),
(5, '2022-06-26', 14, NULL, 16),
(6, '2021-12-14', 14, '2021-12-19', 3),
(8, '2021-12-12', 14, '2021-12-30', 13),
(8, '2022-04-16', 14, '2022-04-22', 18),
(9, '2022-06-21', 14, '2022-07-01', 28),
(10, '2021-10-01', 21, '2021-10-24', 7),
(10, '2022-01-13', 14, '2022-01-25', 8),
(11, '2022-06-01', 14, NULL, 22),
(12, '2021-09-04', 21, '2018-12-19', 7),
(14, '2022-06-22', 14, NULL, 1),
(15, '2022-02-05', 14, '2022-02-13', 10),
(16, '2022-06-22', 14, NULL, 1),
(18, '2022-04-06', 14, '2022-04-13', 3),
(20, '2021-09-21', 21, '2021-09-22', 27),
(20, '2022-06-07', 14, '2022-06-23', 9),
(21, '2022-06-08', 14, '2022-06-20', 14),
(21, '2022-06-30', 14, NULL, 20),
(23, '0000-00-00', 0, NULL, 7),
(24, '2021-11-17', 14, '2021-11-23', 26),
(25, '2021-08-24', 21, '2021-09-11', 1),
(26, '2021-08-20', 21, '2021-08-17', 9),
(29, '0000-00-00', 0, NULL, 28),
(29, '2021-06-01', 14, NULL, 27),
(31, '2022-06-30', 14, NULL, 20),
(32, '2022-06-30', 14, NULL, 20),
(33, '0000-00-00', 0, NULL, 7);

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `NL` int(11) NOT NULL,
  `editeur` varchar(50) DEFAULT NULL,
  `NO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`NL`, `editeur`, `NO`) VALUES
(1, 'GF', 1),
(2, 'FOLIO', 2),
(3, 'HACHETTE', 3),
(4, 'GF', 4),
(5, 'FOLIO', 5),
(6, 'FOLIO', 6),
(7, 'GF', 7),
(8, 'FOLIO', 8),
(9, 'HACHETTE', 9),
(10, 'GF', 10),
(11, 'HACHETTE', 11),
(12, 'FOLIO', 12),
(13, 'GF', 13),
(14, 'FOLIO', 14),
(15, 'HACHETTE', 15),
(16, 'HACHETTE', 16),
(17, 'GF', 1),
(18, 'FOLIO', 2),
(19, 'HACHETTE', 2),
(20, 'FOLIO', 4),
(21, 'GF', 5),
(22, 'HACHETTE', 4),
(23, 'HACHETTE', 7),
(24, 'FOLIO', 8),
(25, 'GF', 1),
(26, 'HACHETTE', 10),
(27, 'FOLIO', 11),
(28, 'FOLIO', 12),
(29, 'GF', 1),
(30, 'HACHETTE', 14),
(31, 'FOLIO', 17),
(32, 'GALLIMARD', 18);

-- --------------------------------------------------------

--
-- Structure de la table `oeuvres`
--

CREATE TABLE `oeuvres` (
  `NO` int(11) NOT NULL,
  `titre` varchar(150) NOT NULL,
  `auteur` varchar(100) DEFAULT NULL,
  `annee` int(11) DEFAULT NULL,
  `genre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `oeuvres`
--

INSERT INTO `oeuvres` (`NO`, `titre`, `auteur`, `annee`, `genre`) VALUES
(1, 'Narcisse et Goldmund', 'Hermann HESSE', 1930, 'Roman'),
(2, 'Bérénice', 'Jean RACINE', 1670, 'Théâtre'),
(3, 'Prolégomènes à  toute métaphysique future', 'Emmanuel KANT', 1783, 'Philosophie'),
(4, 'Mon coeur mis à nu', 'Charles BAUDELAIRE', 1887, 'Journal'),
(5, 'Voyage au bout de la nuit', 'Louis-Ferdinand CELINE', 1932, 'Roman'),
(6, 'Les possédés', 'Fedor DOSTOIEVSKI', 1872, 'Roman'),
(7, 'Le Rouge et le Noir', 'STENDHAL', 1830, 'Roman'),
(8, 'Alcibiade', 'Jacqueline de ROMILLY', 1995, 'Roman'),
(9, 'Monsieur Teste', 'Paul VALERY', 1926, 'Roman'),
(10, 'Lettres de Gourgounel', 'Kenneth WHITE', 1979, 'Récit'),
(11, 'Lettres à un jeune poète', 'Rainer Maria RILKE', 1929, 'Lettre'),
(12, 'Logique sans peine', 'Lewis CAROLL', 1887, 'Logique'),
(13, 'L\'éthique', 'Baruch SPINOZA', 1677, 'Philosophie'),
(14, 'Sur le rêve', 'Sigmund FREUD', 1900, 'Philosophie'),
(15, 'Sens et dénotation', 'Gottlob FREGE', 1892, 'Philosophie'),
(16, 'Penser la logique', 'Gilbert HOTTOIS', 1989, 'Philosophie'),
(17, 'Au coeur des ténèbres', 'Joseph CONRAD', 1899, 'Roman'),
(18, 'Jan Karski', 'Yannick HAENEL', 2009, 'Roman');

-- --------------------------------------------------------

--
-- Structure de la vue `durée des livres en retard`
--
DROP TABLE IF EXISTS `durée des livres en retard`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `durée des livres en retard`  AS  select distinct `adherents`.`NA` AS `NA`,`adherents`.`nom` AS `nom`,`adherents`.`prenom` AS `prenom`,`emprunter`.`dateEmp` AS `dateEmp`,`emprunter`.`dureeMax` AS `dureeMax`,`emprunter`.`dateRet` AS `dateRet`,`emprunter`.`dateEmp` + interval `emprunter`.`dureeMax` day AS `DateRetPrevu`,case when to_days(`emprunter`.`dateEmp` + interval `emprunter`.`dureeMax` day) - to_days(`emprunter`.`dateRet`) is null then to_days(`emprunter`.`dateEmp` + interval `emprunter`.`dureeMax` day) - to_days(curdate()) when to_days(`emprunter`.`dateEmp` + interval `emprunter`.`dureeMax` day) - to_days(`emprunter`.`dateRet`) is not null then to_days(`emprunter`.`dateEmp` + interval `emprunter`.`dureeMax` day) - to_days(`emprunter`.`dateRet`) end AS `jPassed` from (`emprunter` join `adherents`) where `adherents`.`NA` = `emprunter`.`NA` and to_days(`emprunter`.`dateEmp` + interval `emprunter`.`dureeMax` day) - to_days(`emprunter`.`dateRet`) < 0 or `adherents`.`NA` = `emprunter`.`NA` and `emprunter`.`dateRet` is null and to_days(`emprunter`.`dateEmp` + interval `emprunter`.`dureeMax` day) - to_days(curdate()) < 0 ;

-- --------------------------------------------------------

--
-- Structure de la vue `durée_livres_retardés_actuellement`
--
DROP TABLE IF EXISTS `durée_livres_retardés_actuellement`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `durée_livres_retardés_actuellement`  AS  select distinct `livres`.`NL` AS `NL`,`oeuvres`.`NO` AS `NO`,`emprunter`.`dateEmp` AS `dateEmp`,`oeuvres`.`titre` AS `titre`,`oeuvres`.`auteur` AS `auteur`,`emprunter`.`dateEmp` + interval `emprunter`.`dureeMax` day AS `DateRetPrevu`,to_days(`emprunter`.`dateEmp` + interval `emprunter`.`dureeMax` day) - to_days(curdate()) AS `duree passée (j)` from ((`emprunter` join `livres`) join `oeuvres`) where `oeuvres`.`NO` = `livres`.`NO` and `emprunter`.`NL` = `livres`.`NL` and `emprunter`.`dateRet` is null and to_days(`emprunter`.`dateEmp` + interval `emprunter`.`dureeMax` day) - to_days(curdate()) < 0 ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adherents`
--
ALTER TABLE `adherents`
  ADD PRIMARY KEY (`NA`);

--
-- Index pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD PRIMARY KEY (`NL`,`dateEmp`),
  ADD KEY `NA` (`NA`),
  ADD KEY `dateEmp` (`dateEmp`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`NL`),
  ADD KEY `NO` (`NO`);

--
-- Index pour la table `oeuvres`
--
ALTER TABLE `oeuvres`
  ADD PRIMARY KEY (`NO`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adherents`
--
ALTER TABLE `adherents`
  MODIFY `NA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `livres`
--
ALTER TABLE `livres`
  MODIFY `NL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `oeuvres`
--
ALTER TABLE `oeuvres`
  MODIFY `NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD CONSTRAINT `emprunter_ibfk_1` FOREIGN KEY (`NL`) REFERENCES `livres` (`NL`),
  ADD CONSTRAINT `emprunter_ibfk_2` FOREIGN KEY (`NA`) REFERENCES `adherents` (`NA`);

--
-- Contraintes pour la table `livres`
--
ALTER TABLE `livres`
  ADD CONSTRAINT `livres_ibfk_1` FOREIGN KEY (`NO`) REFERENCES `oeuvres` (`NO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
