-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 21 dec 2023 om 13:03
-- Serverversie: 10.4.24-MariaDB
-- PHP-versie: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bijlesschool`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `announcement`
--

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `announcement`
--

INSERT INTO `announcement` (`id`, `title`, `description`, `date`, `time`, `role`, `admin_id`) VALUES
(1, 'lessons', 'geen les vandaag', '2023-12-31', '02:04:00', 'ROLE_TEACHER', 1),
(2, 'lessons', 'je hebt vandaag geen les', '2023-12-19', '11:12:00', 'ROLE_STUDENT', 1),
(3, 'Lessen', 'De lessen zijn veranderd', '2024-03-18', '12:15:00', 'ROLE_TEACHER', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20231219084219', '2023-12-19 09:42:28', 42),
('DoctrineMigrations\\Version20231219105943', '2023-12-19 12:07:22', 6),
('DoctrineMigrations\\Version20231219111340', '2023-12-19 12:13:45', 46),
('DoctrineMigrations\\Version20231219111826', '2023-12-19 12:18:30', 9),
('DoctrineMigrations\\Version20231219135731', '2023-12-19 14:58:02', 71),
('DoctrineMigrations\\Version20231220083140', '2023-12-20 09:31:48', 57),
('DoctrineMigrations\\Version20231220141232', '2023-12-20 15:12:42', 84);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `lesson`
--

CREATE TABLE `lesson` (
  `id` int(11) NOT NULL,
  `schoolles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doelles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `lesson`
--

INSERT INTO `lesson` (`id`, `schoolles`, `doelles`, `time`, `date`, `teacher_id`, `student_id`) VALUES
(1, 'Nederlands', 'Begrijpend Lezen', '13:40:00', '2023-12-24', 4, 5),
(2, 'Economie', 'Inflatie', '14:00:00', '2023-12-26', 4, 2),
(4, 'Symfony', 'we  gaan beginnen met creeren van database', '17:30:00', '2023-12-27', 7, 5);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateofbirth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `nationality`, `name`, `dateofbirth`) VALUES
(1, 'eo89134@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$FZwA3Ks8QgCTk4LYtlj26O4eBYVNEMYSGlC0GcXEyCMF9ifWkn3.m', 'Ghana', 'Emmanuel Owusu', '2013-12-04'),
(2, 'emmanuel@gmail.com', '[\"ROLE_STUDENT\"]', '$2y$13$c6vaLzC9ztSfAOq6Pl4aT.BoAb1iYe2n.if82BxzbnkJ4XIfVvUxW', 'Nederland', 'Emmanuel', '2018-12-09'),
(3, 'daniel@gmail.com', '[\"ROLE_TEACHER\"]', '$2y$13$zIZTk8ZjLw8Z009guOzBA.UsKzBNICF.guxICDMa9T6cRDcPtznCy', 'Nederland', 'Daniel', '2019-03-06'),
(4, 'Emmanuel070@gmail.com', '[\"ROLE_TEACHER\"]', '$2y$13$Ytxxs5sZPLHDzpreS2gccO46t7F7gsaQvIpRpVvBtyd7N/sYa3iVS', 'Nederland', 'Emmanuel', '2023-12-20'),
(5, 'daan@gmail.com', '[\"ROLE_STUDENT\"]', '$2y$13$EVwe4lM7HYmmf5OCI1dGe.Yc9/zFFpf0A/QbzYuda2jUVpyud0UmC', 'nederlands', 'daan', '2023-07-10'),
(6, 'bas@gmail.com', '[\"ROLE_STUDENT\"]', '$2y$13$el6eMDtNg24jdFWIXHqHze3jsGwUsALK9OmudBLgtB7d4LV8.sN8e', 'nederlands', 'bas', '2023-07-11'),
(7, 'jong@gmail.com', '[\"ROLE_TEACHER\"]', '$2y$13$MvEQnmDfgWQKYl/FQDjFe.f21.O7FlF1gBMG7rkuHOQ.vGoKFuUsu', 'nederlands', 'Mnr. De jong', '2022-12-11');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4DB9D91C642B8210` (`admin_id`);

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F87474F341807E1D` (`teacher_id`),
  ADD KEY `IDX_F87474F3CB944F1A` (`student_id`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `FK_4DB9D91C642B8210` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`);

--
-- Beperkingen voor tabel `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `FK_F87474F341807E1D` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_F87474F3CB944F1A` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
