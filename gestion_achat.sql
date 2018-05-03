-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2018 at 08:31 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestion_achat`
--

-- --------------------------------------------------------

--
-- Table structure for table `achat`
--

CREATE TABLE `achat` (
  `qte_demande` int(11) DEFAULT NULL,
  `date_achat` date DEFAULT NULL,
  `code_article` int(11) NOT NULL,
  `num_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `code_article` int(11) NOT NULL,
  `nom_article` varchar(50) DEFAULT NULL,
  `num_cat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`code_article`, `nom_article`, `num_cat`) VALUES
(1, 'boite de protection', 1),
(2, 'asdasd', 1);

-- --------------------------------------------------------

--
-- Table structure for table `catergorie_article`
--

CREATE TABLE `catergorie_article` (
  `num_cat` int(11) NOT NULL,
  `libelle_cat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catergorie_article`
--

INSERT INTO `catergorie_article` (`num_cat`, `libelle_cat`) VALUES
(1, 'categorie1'),
(2, 'categorie2'),
(3, 'categorie3'),
(10, 'categorie4'),
(13, 'categorie5'),
(15, 'categorie6'),
(17, 'categorie7');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `num_service` int(11) NOT NULL,
  `code_service` varchar(25) DEFAULT NULL,
  `nom_service` varchar(25) DEFAULT NULL,
  `spécialité` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`num_service`, `code_service`, `nom_service`, `spécialité`) VALUES
(1, 'hhh', 'kkk', 'lll'),
(2, 'TI', 'telecom', 'informatique');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `Id_utilisateur` int(11) NOT NULL,
  `nom_utilisateur` varchar(30) DEFAULT NULL,
  `mot_de_passe` varchar(30) DEFAULT NULL,
  `num_service` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`Id_utilisateur`, `nom_utilisateur`, `mot_de_passe`, `num_service`) VALUES
(1, 'vvv', 'ssss', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achat`
--
ALTER TABLE `achat`
  ADD PRIMARY KEY (`code_article`,`num_service`),
  ADD KEY `FK_achat_num_service` (`num_service`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`code_article`),
  ADD UNIQUE KEY `nom_article` (`nom_article`),
  ADD KEY `FK_Article_num_cat` (`num_cat`);

--
-- Indexes for table `catergorie_article`
--
ALTER TABLE `catergorie_article`
  ADD PRIMARY KEY (`num_cat`),
  ADD UNIQUE KEY `libelle_cat` (`libelle_cat`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`num_service`),
  ADD UNIQUE KEY `code_service` (`code_service`,`nom_service`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`Id_utilisateur`),
  ADD UNIQUE KEY `nom_utilisateur` (`nom_utilisateur`),
  ADD KEY `FK_Utilisateur_num_service` (`num_service`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `code_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `catergorie_article`
--
ALTER TABLE `catergorie_article`
  MODIFY `num_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `num_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `Id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `achat`
--
ALTER TABLE `achat`
  ADD CONSTRAINT `FK_achat_code_article` FOREIGN KEY (`code_article`) REFERENCES `article` (`code_article`),
  ADD CONSTRAINT `FK_achat_num_service` FOREIGN KEY (`num_service`) REFERENCES `service` (`num_service`);

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_Article_num_cat` FOREIGN KEY (`num_cat`) REFERENCES `catergorie_article` (`num_cat`);

--
-- Constraints for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_Utilisateur_num_service` FOREIGN KEY (`num_service`) REFERENCES `service` (`num_service`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
