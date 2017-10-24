-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 24 Octobre 2017 à 15:43
-- Version du serveur :  5.6.11-log
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `dsgn`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date_creation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `titre`, `contenu`, `date_creation`) VALUES
(1, 'Article 1', 'Contenu de l\'article 1', '2017-10-01 00:00:00'),
(2, 'Article 2', 'Contenu de l\'article 2', '2017-10-02 00:00:00'),
(3, 'Article 3', 'Contenu de l\'article 3', '2017-10-03 00:00:00'),
(4, 'Article 4', 'Contenu de l\'article 4', '2017-10-04 00:00:00'),
(5, 'Article 5', 'Contenu de l\'article 5', '2017-10-05 00:00:00'),
(6, 'Article 6', 'Contenu de l\'article 6', '2017-10-06 00:00:00'),
(7, 'Article 7', 'Contenu de l\'article 7', '2017-10-07 00:00:00'),
(8, 'Article 8', 'Contenu de l\'article 8', '2017-10-08 00:00:00'),
(9, 'Article 9', 'Contenu de l\'article 9', '2017-10-09 00:00:00'),
(10, 'Article 10', 'Contenu de l\'article 10', '2017-10-10 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `article_commentaire`
--

CREATE TABLE `article_commentaire` (
  `id` int(11) NOT NULL,
  `auteur_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `contenu` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `article_like`
--

CREATE TABLE `article_like` (
  `id` int(11) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `article_like`
--

INSERT INTO `article_like` (`id`, `article_id`, `user_id`) VALUES
(1, 9, 1),
(2, 10, 1),
(3, 6, 1),
(4, 9, 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `nom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `nom`, `prenom`) VALUES
(1, 'onesteve', 'onesteve', 'contact@onesteve.net', 'contact@onesteve.net', 1, NULL, '$2y$13$OhVVxgG5l4u8cebMtr5fH.Fq8fKZUbgpG2rNriqoUcPUKIyfFUIYq', '2017-10-24 15:35:30', NULL, NULL, 'a:0:{}', 'ONEPHANDARA', 'Stevens-Son'),
(2, 'twosteve', 'twosteve', 'contact@twosteve.net', 'contact@twosteve.net', 1, NULL, '$2y$13$Eg8.W5h/yce3zVbP1ygKq.YCHbXWUBlLgOI72Fzygx3mQZAYcQVfK', '2017-10-24 15:37:55', NULL, NULL, 'a:0:{}', NULL, NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `article_commentaire`
--
ALTER TABLE `article_commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FD7302DB60BB6FE6` (`auteur_id`),
  ADD KEY `IDX_FD7302DB7294869C` (`article_id`);

--
-- Index pour la table `article_like`
--
ALTER TABLE `article_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1C21C7B27294869C` (`article_id`),
  ADD KEY `IDX_1C21C7B2A76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `article_commentaire`
--
ALTER TABLE `article_commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `article_like`
--
ALTER TABLE `article_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article_commentaire`
--
ALTER TABLE `article_commentaire`
  ADD CONSTRAINT `FK_FD7302DB7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FK_FD7302DB60BB6FE6` FOREIGN KEY (`auteur_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `article_like`
--
ALTER TABLE `article_like`
  ADD CONSTRAINT `FK_1C21C7B2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_1C21C7B27294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
