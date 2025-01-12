-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 22 déc. 2022 à 23:45
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommerce.project`
--

-- --------------------------------------------------------

--
-- Structure de la table `buy_orders`
--

DROP TABLE IF EXISTS `buy_orders`;
CREATE TABLE IF NOT EXISTS `buy_orders` (
  `o_id` int NOT NULL AUTO_INCREMENT,
  `p_id` int DEFAULT NULL,
  `u_id` int DEFAULT NULL,
  `o_quantity` int NOT NULL,
  `o_date` varchar(450) NOT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `buy_orders`
--

INSERT INTO `buy_orders` (`o_id`, `p_id`, `u_id`, `o_quantity`, `o_date`) VALUES
(32, 10, 21, 1, '2022-12-23');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(450) NOT NULL,
  `category` varchar(450) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(450) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`) VALUES
(7, 'IPHONE', 'APPLE\r\nIPHONE 13 MINI 256G', 8399, 'photo11.jpg'),
(8, 'IPHONE', 'APPLE\r\nIPHONE 14 MINI 256G', 1549, 'photo4.jpg'),
(9, 'IPHONE', 'APPLE :\r\nIPHONE 13 PRO MAX 128G', 1236, 'photo11.jpg'),
(10, 'SAMSUNG', 'APPLE :\r\nSAMSUNG PRO MAX 128G', 1549, 'photo4.jpg'),
(11, 'IPHONE', 'PRO MAX 100G', 1549, 'photo15.jpg'),
(12, 'SAMSUNG', 'PRO MAX 100G', 1234, 'photo16.jpg'),
(13, 'IPHONE', 'PRO MAX 100G', 1111, 'photo14.jpg'),
(14, 'IPHONE', 'PRO MAX 200G', 223, 'photo15.jpg'),
(17, 'NOKIA', 'new', 122, 'photo6.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'kawtar', 'kkawter191@gmail.com', '1111'),
(14, '', 'zaim@gmail.com', '2222'),
(21, 'TEST1', 'test1@gmail.com', '1111');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
