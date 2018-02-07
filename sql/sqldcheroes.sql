-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Gegenereerd op: 07 feb 2018 om 12:52
-- Serverversie: 5.7.19
-- PHP-versie: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dc-heroes`
--
CREATE DATABASE IF NOT EXISTS `dc-heroes` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dc-heroes`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `hero`
--

CREATE TABLE IF NOT EXISTS `hero` (
  `heroId` int(3) NOT NULL AUTO_INCREMENT COMMENT 'the unique heroId used as a parameter in the URL and fetched by PHP using the $_GET superblobal variable',
  `heroName` varchar(50) NOT NULL COMMENT 'the name of the hero, just a string',
  `heroDescription` text NOT NULL COMMENT 'some information of the hero, just a string',
  `heroPower` text NOT NULL,
  `heroImage` varchar(50) NOT NULL COMMENT 'the image of the hero is strored as a string. The actual image is strored on the server. Use the string as the source of the HTML img-tag.',
  `teamId` int(3) NOT NULL COMMENT 'this is the teamId. Used as a referenc to the team table.',
  PRIMARY KEY (`heroId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `hero`
--

INSERT INTO `hero` (`heroId`, `heroName`, `heroDescription`, `heroPower`, `heroImage`, `teamId`) VALUES
(1, 'Captain Boomerang', 'Sometimes, what you throw into the universe will come back to you. In the case of George Digge Harkness, a.k.a. Captain Boomerang, that would be a collection of lethally accurate boomerangs that wreak wanton destruction upon their targets before dependably returning to Harkness, ready for another go-round.', '\r\nboomerang throwing, unrivaled aim, combat skill, complete unpredictability', 'boomerang.png', 1),
(2, 'Arsenal', 'Its a hard life being a hero. Its stressful, dangerous and often thankless. Heroes save lives, but also get the blame when lives are lost. They have to make a thousand decisions, big and small, and sometimes they choose the wrong path. Without a rock solid mentor, the walls can close in. That happened to Arsenal.', '\r\narchery, unrivaled aim, exceptional martial artist, weapons expert, combat skill', 'arsenal.png', 1),
(3, 'Block Buster', 'Mark Desmond was a chemist whose experiments intending to increase his strength turned him into a mindless monster.', '\r\nBerserker Strength,\r\nFeral,\r\nHealing,\r\nIntellect,\r\nLeadership,\r\nStamina,\r\nSuper Strength,\r\nUnarmed Combat', 'blockbuster.jpg', 1),
(4, 'Air Wave', 'When he turned seventeen, young Hal Jordan (cousin of the famous Hal Jordan, Green Lantern) was given the costume of his father, the Golden Age Air Wave. Hal became the new Air Wave, able to convert and manipulate radio waves. Air Wave died during the Infinite Crisis.', '\r\nElectronic interaction,\r\nGadgets,\r\nMagnetism,\r\nPower Suit,\r\nWall Clinger', 'airwave.jpg', 1),
(5, 'Big Sir', 'Big Sir is the superstrong, but mentally slow, member of the Injustice League. He has no special fighting skills, just a single-mindedness towards violence and destruction.', 'Berserker Strength,\r\nEscape Artist,\r\nFeral,\r\nStamina,\r\nSuper Strength', 'bigsir.jpg', 1),
(6, 'Creeper', 'A talk show host and reporter with an uncontrollable alter ego.', 'Agility,\r\nBerserker Strength,\r\nFlight,\r\nHypnosis,\r\nLongevity,\r\nStamina,\r\nUnarmed Combat', 'creeper.jpg', 2),
(7, 'Atomic Knight', 'Sergeant Gardner Grayle became a test subject for S.T.A.R Lab\'s atomic research project. He was given atomic weapons and armor, and became the Atomic Knight. He was once briefly a member of the Outsiders team.', '\r\nBlast Power,\r\nFlight,\r\nForce Field,\r\nGadgets,\r\nIntellect,\r\nInvulnerability,\r\nLeadership,\r\nPower Suit,\r\nPrecognition,\r\nSuper Strength', 'atomicknight.jpg', 2),
(8, ' Black Lightning ', 'Jefferson Michael Pierce aka Black Lightning, is a teacher and former Olympic Gold Medal-winning athlete. He fights crime, using his electrokinetic powers.', 'Agility,\r\nBlast Power,\r\nElectricity Control,\r\nElectronic Disruption,\r\nElectronic interaction,\r\nEnergy Absorption,\r\nEnergy Based Constructs,\r\nEnergy Manipulation,\r\nEnergy Shield,\r\nEnergy-Enhanced Strike,\r\nFlight,\r\nForce Field,\r\nHealing,\r\nHeat Generation,\r\nIntellect,\r\nLeadership,\r\nLevitation,\r\nMagnetism,\r\nMarksmanship,\r\nRadar Sense,\r\nStamina,\r\nStealth,\r\nSuper Speed,\r\nSuper Strength,\r\nTechnopathy,\r\nTelekinesis,\r\nTeleport,\r\nTracking,\r\nUnarmed Combat', 'black.jpg', 2),
(9, 'Alfred Pennyworth ', 'Alfred Pennyworth is Bruce Wayne\'s loyal father figure and butler. Alfred raised Bruce (and later Dick Grayson) after the death of the Waynes. A former British secret agent, Alfred is a skilled surgeon who often fixes members of the Bat-Family.', '\r\nAgility,\r\nEscape Artist,\r\nGadgets,\r\nIntellect,\r\nMarksmanship,\r\nStamina,\r\nUnarmed Combat', 'alfred.jpg', 2),
(10, 'Cassandra Cain', 'The daughter of two notorious assassins, David Cain and Lady Shiva, Cassandra left her father as a child after she killed a man and saw his pain and fear while he died. After saving Commissioner Gordon\'s life, she became the new Batgirl with Batman and Oracle\'s blessing, and was later adopted by Bruce Wayne. Later still, she gave the role of Batgirl to her friend Stephanie Brown, and became Black Bat.', '\r\nAdaptive,\r\nAgility,\r\nEscape Artist,\r\nGadgets,\r\nIntellect,\r\nLeadership,\r\nMarksmanship,\r\nStamina,\r\nStealth,\r\nTracking,\r\nUnarmed Combat,\r\nWeapon Master', 'cain.jpg', 2),
(11, 'Anima ', 'Courtney Mason can leech bio-energy, manifest mystical armor and a blade, and her body is a conduit to summon the monstrous Animus. She\'s been a member of the Blood Pack and the Titans.', '\r\nEnergy Absorption,\r\nEnergy-Enhanced Strike,\r\nFlight,\r\nPower Suit,\r\nShape Shifter,\r\nSiphon Lifeforce,\r\nSuper Strength,\r\nUnarmed Combat', 'anima.jpg', 3),
(12, 'Aquagirl (Marquez) ', 'When San Diego was rendered underwater and renamed Sub Diego, Lorena Marquez was one of the survivors that developed the capabilities to breathe underwater. After helping Aquaman, she took up the mantle of Aquagirl. Lorena has served as a member of the Teen Titans.', '\r\nAdaptive,\r\nAgility,\r\nIntellect,\r\nPower Item,\r\nRadar Sense,\r\nStamina,\r\nSub-Mariner,\r\nSuper Speed,\r\nSuper Strength,\r\nTelepathy,\r\nTracking,\r\nUnarmed Combat', 'aquagirl.jpg', 3),
(13, 'Argent ', 'Argent is a descendant of the H\'San Natall & she can construct solid silver energy plasma. She is a former member of the Teen Titans.', '\r\nBlast Power,\r\nEnergy Based Constructs,\r\nEnergy Manipulation,\r\nEnergy Shield,\r\nEnergy-Enhanced Strike,\r\nFlight', 'argent.jpg', 3),
(14, 'Azrael ', 'A mysterious winged alien whose spaceship crash landed on Earth. He fell in love with Omen of the Teen Titans.', '\r\nAgility,\r\nFlight', 'azrael.jpg', 3),
(15, 'Bart Allen ', 'Hailing from the 30th century, Bart Allen is the grandson of the Flash, Barry Allen and Iris Allen. Originally using the name Impulse and trained by Max Mercury, Bart utilizes the same powers of super-speed possessed by his grandfather and fights crime alongside the Teen Titans, know as Kid Flash and Wally West\'s sidekick.', '\r\nImpulse\r\nKid Flash\r\nFlash,\r\nMonkey,\r\nFastest man alive,\r\nFastest boy alive,\r\nFastest flash ever,\r\nStupidest boy dead,\r\nSunshine,\r\nPongo,\r\nThe Goof,\r\nThe Reckless Youth,\r\nBartholomew Allen II,\r\nBart,\r\nKoko,\r\nImp,\r\nBar Tor ', 'allen.jpg', 3),
(16, 'Alec Holland ', 'Once a great scientist, Alec Holland died in a remote swamp, where the original Swamp Thing rose from the water with his memories, believing it was Holland. Now, Holland has returned to the world of the living, and has truly become the Swamp Thing, a warrior of the Green.', '\r\nClaws,\r\nControlled Bone Growth,\r\nFlight,\r\nHealing,\r\nIntellect,\r\nInvulnerability,\r\nPlant Control,\r\nShape Shifter,\r\nSize Manipulation,\r\nSuper Strength,\r\nUnarmed Combat', 'alec.jpg', 4),
(17, 'Amon Sur ', 'The son of Abin Sur, the dying Green Lantern that bestowed his power ring to Hal Jordan. Amon became leader of the criminal syndicate Black Circle and later a member of the Sinestro Corps. He was killed in cold blood by Laira. He is yet to appear in DC\'s wide reboot the New 52', '\r\nBlast Power,\r\nEnergy Based Constructs,\r\nFlight,\r\nForce Field,\r\nGadgets,\r\nPower Item,\r\nWillpower-Based Constructs', 'amon.jpg', 4),
(18, 'Anti-Monitor ', 'The Anti-Monitor is The Monitor\'s counterpart from The Anti-matter Universe. He is responsible for the original Crisis on Infinite Earths, was the sole Guardian of The Sinestro Corps and once, against his will, was the source of The Black Lantern Corps Central Power Battery.', '\r\nBlast Power,\r\nCosmic Awareness,\r\nDarkforce Manipulation,\r\nDarkness Manipulation,\r\nDimensional Manipulation,\r\nDivine Powers,\r\nEnergy Absorption,\r\nEnergy Manipulation,\r\nFlight,\r\nGenetic Manipulation,\r\nHealing,\r\nImmortal,\r\nIntellect,\r\nInvulnerability,\r\nMatter Absorption,\r\nPower Suit,\r\nReality Manpulation,\r\nSize Manipulation,\r\nStamina,\r\nSuper Eating,\r\nSuper Strength,\r\nTelepathy,\r\nTeleport,\r\nTime Manipulation,\r\nTime Travel', 'monitor.jpg', 4),
(19, 'Arkillo ', 'A member of the Sinestro Corps and archrival to the Green Lantern, Kilowog. He is one of Sinestro\'s greatest allies and servants for he will slaughter any Green Lanterns (or anyone else) that gets in the way of the Sinestro Corps\' plans.', 'Berserker Strength,\r\nBlast Power,\r\nClaws,\r\nEnergy Based Constructs,\r\nEnergy Manipulation,\r\nEnergy Shield,\r\nEnergy-Enhanced Strike,\r\nFeral,\r\nFlight,\r\nForce Field,\r\nLeadership,\r\nOmni-lingual,\r\nPower Item,\r\nStamina,\r\nStealth,\r\nSuper Strength,\r\nTracking,\r\nUnarmed Combat', 'arkillo.jpg', 4),
(20, 'Bekka ', '\r\nBekka is one of the good New Gods of New Genesis. Her father is the inventor Himon, who she lived with for many years in secret on Apokolips. ', '\r\nAgility,\r\nDivine Powers,\r\nEmotion Control,\r\nGadgets,\r\nHealing,\r\nImmortal,\r\nIntellect,\r\nInvulnerability,\r\nMarksmanship,\r\nPhasing / Ghost,\r\nStamina,\r\nSuper Speed,\r\nSuper Strength,\r\nUnarmed Combat', 'bekka.jpg', 4),
(21, 'Alloy ', 'He is a giant robot that is formed when the heroes known as the Metal Men join together.', '\r\nInvulnerability,\r\nSuper Strength', 'alloy.jpg', 5),
(22, 'Copper ', 'The latest creation of Will Magus for his Metal Men. Copper is known for being the sarcastic member of the team.', '\r\nDensity Control,\r\nElasticity,\r\nInvulnerability,\r\nShape Shifter,\r\nSuper Strength,\r\nUnarmed Combat', 'copper.jpg', 5),
(23, 'Gold ', 'Gold has the ability to stretch into a thin wire - miles long, and can also flatten himself into a sheet as thin as 4 millionths of an inch.', '\r\nAdaptive,\r\nAgility,\r\nDensity Control,\r\nElasticity,\r\nFlight,\r\nIntellect,\r\nLeadership,\r\nLongevity,\r\nShape Shifter,\r\nSuper Strength,\r\nUnarmed Combat', 'gold.jpg', 5),
(24, 'Iron', 'Iron is the Metal Men\'s strongman, able to be shaped into an infinite variety of objects to assist the team on their missions.', '\r\nAgility,\r\nDensity Control,\r\nElasticity,\r\nInvulnerability,\r\nShape Shifter,\r\nStamina,\r\nSuper Strength,\r\nUnarmed Combat', 'iron.jpg', 5),
(25, 'Lead ', 'Lead is a slow and clumsy member of the Metal Men. However, he often proves invaluable when he protects the team from harmful rays or radiation.', '\r\nDensity Control,\r\nElasticity,\r\nFlight,\r\nShape Shifter,\r\nSuper Strength', 'lead.jpg', 5);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `ratingId` int(3) NOT NULL AUTO_INCREMENT COMMENT 'unique rating is, auto incremented',
  `heroId` int(3) NOT NULL COMMENT 'the heroId used as reference to the hero table, can''t be unique in thie table',
  `rating` int(3) NOT NULL COMMENT 'rating is defined as an integer from 0 (min) to 10 (max)',
  `ratingDate` int(5) NOT NULL COMMENT 'the date of this rating. Dates are presented as an integer (timestamp) and displayed as a human readable date and time string using the PHP strftime() function',
  `ratingReview` text NOT NULL COMMENT 'a textual review added by the user\\nthe form where the user can rate the hero by using stars (radio-buttons)',
  PRIMARY KEY (`ratingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `teamId` int(3) NOT NULL AUTO_INCREMENT COMMENT 'unique teamId can be used as a parameter in the URL and fetched using the $_GET variable',
  `teamName` varchar(50) NOT NULL COMMENT 'team name, just an ordinary string',
  `teamDescription` text NOT NULL COMMENT 'team description, just a string',
  `teamImage` varchar(100) NOT NULL COMMENT 'team image, stored as a string and used with the source of the HTML-tag',
  PRIMARY KEY (`teamId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `team`
--

INSERT INTO `team` (`teamId`, `teamName`, `teamDescription`, `teamImage`) VALUES
(1, 'Suicide Squad', 'The modern incarnation of the Suicide Squad is a team of incarcerated supervillains who carry out secret missions in exchange for reduced prison sentences. The Suicide Squad\'s name alludes to the dangerous nature of their missions. The team is based out of Belle Reve Penitentiary under the directorship of Amanda Waller.', 'Suicidesquad.jpg'),
(2, 'Outsiders', 'The Outsiders is a group of non-primary superheroes in the DC Universe that has become the \"frontline\" team that handles major threats that are endangering the Earth and its people since Batman\'s apparent demise.', 'outsiders.jpg'),
(3, 'Teen Titans', 'De Teen Titans, ook wel bekend als “The New Teen Titans”, “New Titans”, of “The Titans”, is een fictief superheldenteam uit de strips van DC Comics. De groep debuteerde in The Brave and the Bold #54 (juli 1964), bedacht door Bob Haney en Bruno Premiani. De naam “Teen Titans” werd voor het eerst gebruikt in Brave and the Bold #60.', 'teentitans.jpg'),
(4, ' Sinestro Corps ', 'The Sinestro Corps is a mirror organization to the Green Lantern Corps. Its members are chosen from those who can instill great fear and are given Qwardian Yellow Power rings. They are considered to be the evil equivalent of the Green Lantern Corps.', 'sinestocorps.jpg'),
(5, 'Metal Men ', 'A group of robotic superheroes created by William Magnus. Each of them are constructed with a responsometer, a device that gives them human intelligence and personalities and allows them to control their given element.', 'metalmen.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
