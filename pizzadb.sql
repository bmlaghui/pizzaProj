-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 03 avr. 2020 à 10:27
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pizzadb`
--

-- --------------------------------------------------------

--
-- Structure de la table `composer`
--

DROP TABLE IF EXISTS `composer`;
CREATE TABLE IF NOT EXISTS `composer` (
  `numPizza` int(11) NOT NULL,
  `numIngredient` int(11) NOT NULL,
  PRIMARY KEY (`numPizza`,`numIngredient`),
  KEY `idIngredient` (`numIngredient`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `composer`
--

INSERT INTO `composer` (`numPizza`, `numIngredient`) VALUES
(1, 1),
(1, 4),
(1, 5),
(1, 6),
(1, 10),
(1, 11),
(1, 12),
(5, 1),
(5, 12),
(5, 13),
(5, 14),
(5, 15),
(5, 16),
(6, 2),
(6, 7),
(6, 14),
(7, 1),
(7, 2),
(7, 4),
(7, 14),
(7, 15),
(10, 1),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(10, 7),
(10, 9),
(10, 10),
(10, 11),
(10, 12),
(10, 13),
(10, 15),
(10, 16),
(12, 4),
(12, 5),
(12, 6),
(12, 16),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(13, 6),
(13, 7),
(13, 9),
(13, 11),
(13, 12),
(13, 15),
(13, 16),
(15, 1),
(15, 5),
(15, 10),
(15, 11);

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE IF NOT EXISTS `ingredient` (
  `numIngredient` int(11) NOT NULL AUTO_INCREMENT,
  `nomIngredient` varchar(255) NOT NULL,
  PRIMARY KEY (`numIngredient`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`numIngredient`, `nomIngredient`) VALUES
(1, 'Sauce Tomate'),
(2, 'Crème fraiche'),
(3, 'Ognions'),
(4, 'Olives'),
(5, 'Câpres'),
(6, 'Oeuf'),
(7, 'Lardons'),
(8, 'Jambon de dinde'),
(9, 'Poulet'),
(10, 'Thon'),
(11, 'Mozzarella'),
(12, 'Emmental'),
(13, 'Chèvre'),
(14, 'Boursin'),
(15, 'Gouda'),
(16, 'Champignions');

-- --------------------------------------------------------

--
-- Structure de la table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
CREATE TABLE IF NOT EXISTS `pizza` (
  `numPizza` int(11) NOT NULL AUTO_INCREMENT,
  `nomPizza` varchar(255) NOT NULL,
  `prixPizza` float NOT NULL,
  `descriptionPizza` varchar(255) NOT NULL,
  PRIMARY KEY (`numPizza`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pizza`
--

INSERT INTO `pizza` (`numPizza`, `nomPizza`, `prixPizza`, `descriptionPizza`) VALUES
(15, 'Tuna', 12, 'Pizza délicieuse ! '),
(13, 'Royale', 16.9, 'pizza des gourmands');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
