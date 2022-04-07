-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 07 avr. 2022 à 19:59
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `quizz_mcd mld mpd`
--

-- --------------------------------------------------------

--
-- Structure de la table `catégorie`
--

CREATE TABLE `catégorie` (
  `id_categorie` int(11) NOT NULL,
  `icone` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `catégorie`
--

INSERT INTO `catégorie` (`id_categorie`, `icone`) VALUES
(0, ''),
(1, 'icone1'),
(2, 'icone2');

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id_question` int(11) NOT NULL,
  `énoncé` varchar(255) NOT NULL,
  `id_quizz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id_question`, `énoncé`, `id_quizz`) VALUES
(0, 'Le lion rugit-il?', 0),
(1, 'Un développeur web a-t-il besoin d\'un ordinateur?', 1),
(2, 'le brocoli est-il bleu?', 2);

-- --------------------------------------------------------

--
-- Structure de la table `quizz`
--

CREATE TABLE `quizz` (
  `id_quizz` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `quizz`
--

INSERT INTO `quizz` (`id_quizz`, `titre`, `id_categorie`) VALUES
(0, 'légumes', 2),
(1, 'animaux', 0),
(2, 'informatique', 1);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE `reponse` (
  `id_reponse` int(11) NOT NULL,
  `correcteFausse` text NOT NULL,
  `id_question` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`id_reponse`, `correcteFausse`, `id_question`) VALUES
(0, 'oui', 0),
(1, 'oui', 1),
(2, 'non', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `catégorie`
--
ALTER TABLE `catégorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id_question`),
  ADD KEY `idx_question_id_quizz` (`id_quizz`);

--
-- Index pour la table `quizz`
--
ALTER TABLE `quizz`
  ADD PRIMARY KEY (`id_quizz`),
  ADD KEY `id_categorie_id_quizz` (`id_categorie`);

--
-- Index pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD PRIMARY KEY (`id_reponse`),
  ADD KEY `id_question_id_reponse` (`id_question`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `fk_question_quizz` FOREIGN KEY (`id_quizz`) REFERENCES `quizz` (`id_quizz`);

--
-- Contraintes pour la table `quizz`
--
ALTER TABLE `quizz`
  ADD CONSTRAINT `quizz_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `catégorie` (`id_categorie`);

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `fk_reponse_question` FOREIGN KEY (`id_question`) REFERENCES `question` (`id_question`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
