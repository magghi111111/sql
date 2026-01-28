-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Nov 12, 2025 alle 10:24
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinica`
--
create database clinica3;
use clinica3;
-- --------------------------------------------------------

--
-- Struttura della tabella `camera`
--

CREATE TABLE `camera` (
  `numero` int(5) NOT NULL,
  `piano` int(5) NOT NULL,
  `letti` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `camera`
--

INSERT INTO `camera` (`numero`, `piano`, `letti`) VALUES
(101, 1, 2),
(102, 1, 1),
(103, 1, 2),
(201, 2, 3),
(202, 2, 2),
(203, 2, 1),
(301, 3, 2),
(302, 3, 2),
(303, 3, 4),
(304, 3, 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `camera`
--
ALTER TABLE `camera`
  ADD PRIMARY KEY (`numero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
