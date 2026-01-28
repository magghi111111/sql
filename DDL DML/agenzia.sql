-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Nov 08, 2025 alle 10:31
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
-- Database: `agenzia`
--
creata database agenzia1;
use agenzia1;
-- --------------------------------------------------------

--
-- Struttura della tabella `annesso`
--

CREATE TABLE `annesso` (
  `id` int(5) NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `superficie` decimal(10,3) NOT NULL,
  `codice_immobile` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `annesso`
--

INSERT INTO `annesso` (`id`, `descrizione`, `superficie`, `codice_immobile`) VALUES
(1, 'garage', 10.000, 2),
(14, 'Garage singolo', 18.000, 1),
(15, 'Cantina', 10.500, 1),
(16, 'Box doppio', 30.000, 2),
(17, 'Giardino privato', 45.000, 2),
(18, 'Terrazza panoramica', 25.000, 7),
(19, 'Magazzino', 50.000, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `immobile`
--

CREATE TABLE `immobile` (
  `codice` int(5) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `superifice` int(5) NOT NULL,
  `num_vani` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `immobile`
--

INSERT INTO `immobile` (`codice`, `tipo`, `superifice`, `num_vani`) VALUES
(1, 'appartamento', 268, 5),
(2, 'villa', 500, 3),
(5, 'Appartamento', 85, 4),
(6, 'Villetta a schiera', 120, 5),
(7, 'Loft', 70, 2),
(8, 'Attico', 140, 6),
(9, 'Rustico', 200, 7),
(10, 'Appartamento', 85, 4),
(11, 'Villetta a schiera', 120, 5),
(12, 'Loft', 70, 2),
(13, 'Attico', 140, 6),
(14, 'Rustico', 200, 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `proprietario`
--

CREATE TABLE `proprietario` (
  `codice_fiscale` char(16) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `numero_telefono` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `proprietario`
--

INSERT INTO `proprietario` (`codice_fiscale`, `cognome`, `nome`, `numero_telefono`) VALUES
('BNCLRA75B12F205K', 'Bianchi', 'Laura', '3395566778'),
('FRNGNN85D15C351S', 'Ferrini', 'Gianna', '3334455667'),
('MRTLCU70E02D612J', 'Martelli', 'Luca', '3496655443'),
('RSSMRA80A01H501U', 'Rossi', 'Mario', '3471122334'),
('VRDGPP90C20A662M', 'Verdi', 'Giuseppe', '3209988776');

-- --------------------------------------------------------

--
-- Struttura della tabella `vendita`
--

CREATE TABLE `vendita` (
  `id` int(5) NOT NULL,
  `data` varchar(255) NOT NULL,
  `prezzo` decimal(10,3) NOT NULL,
  `codice_immobile` int(5) NOT NULL,
  `codice_proprietario` char(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `vendita`
--

INSERT INTO `vendita` (`id`, `data`, `prezzo`, `codice_immobile`, `codice_proprietario`) VALUES
(6, '2024-02-15', 185000.000, 1, 'RSSMRA80A01H501U'),
(7, '2024-06-20', 320000.000, 2, 'BNCLRA75B12F205K'),
(8, '2024-09-10', 145000.000, 5, 'VRDGPP90C20A662M'),
(9, '2025-01-30', 450000.000, 6, 'FRNGNN85D15C351S'),
(10, '2025-04-05', 280000.000, 5, 'MRTLCU70E02D612J');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `annesso`
--
ALTER TABLE `annesso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `immobile` (`codice_immobile`);

--
-- Indici per le tabelle `immobile`
--
ALTER TABLE `immobile`
  ADD PRIMARY KEY (`codice`);

--
-- Indici per le tabelle `proprietario`
--
ALTER TABLE `proprietario`
  ADD PRIMARY KEY (`codice_fiscale`);

--
-- Indici per le tabelle `vendita`
--
ALTER TABLE `vendita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codice_immobile` (`codice_immobile`),
  ADD KEY `proprietario` (`codice_proprietario`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `annesso`
--
ALTER TABLE `annesso`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT per la tabella `immobile`
--
ALTER TABLE `immobile`
  MODIFY `codice` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `vendita`
--
ALTER TABLE `vendita`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `annesso`
--
ALTER TABLE `annesso`
  ADD CONSTRAINT `annesso_ibfk_1` FOREIGN KEY (`codice_immobile`) REFERENCES `immobile` (`codice`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `vendita`
--
ALTER TABLE `vendita`
  ADD CONSTRAINT `vendita_ibfk_1` FOREIGN KEY (`codice_immobile`) REFERENCES `immobile` (`codice`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vendita_ibfk_2` FOREIGN KEY (`codice_proprietario`) REFERENCES `proprietario` (`codice_fiscale`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
