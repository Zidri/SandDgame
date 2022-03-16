-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2022 at 08:15 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sadta_db`
--
DROP DATABASE IF EXISTS `sadta_db`;
CREATE DATABASE IF NOT EXISTS `sadta_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sadta_db`;

-- --------------------------------------------------------

--
-- Table structure for table `choices`
--

CREATE TABLE `choices` (
  `ChoiceID` int(11) NOT NULL,
  `Options` text NOT NULL,
  `StoryID` varchar(11) NOT NULL,
  `ChoiceStoryID` varchar(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `choices`
--

INSERT INTO `choices` (`ChoiceID`, `Options`, `StoryID`, `ChoiceStoryID`) VALUES
(1, 'Left', 'A2', 'A3'),
(2, 'Right', 'A2', '0'),
(3, 'Straight', 'A2', '0'),
(4, 'Behind', 'A2', '0'),
(5, 'Climb Gate', 'A3', 'C1'),
(6, 'Turn Around', 'A3', 'B1'),
(9, 'Return to Fight', 'C4', 'C5'),
(10, 'Go Home', 'C4', 'G1'),
(11, 'Return to Base', 'C5', 'C6'),
(12, 'Talk to Complex', 'C5', 'F1'),
(13, 'Talk to Civilians', 'C6', 'D1'),
(14, 'Continue to Base', 'C6', 'E1'),
(15, 'Continue to Base', 'D4', 'E1'),
(16, 'Go to Base', 'F7', 'C6'),
(17, 'Go Home', 'F7', 'G1');

-- --------------------------------------------------------

--
-- Table structure for table `story`
--

CREATE TABLE `story` (
  `StoryID` varchar(11) NOT NULL,
  `StoryText` text NOT NULL,
  `StoryEnd` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `story`
--

INSERT INTO `story` (`StoryID`, `StoryText`, `StoryEnd`) VALUES
('A1', 'In a world where superpowers exist, heroes and villains are ranked by danger level. S-tier being effectively undefeatable, followed by A, B, C, D, E, and F-tier being regular criminals without powers. Morgan is an E-tier sidekick working for their brother, the A-tier hero The Chadster.', 0),
('A2', 'Morgan and Chad are in the Big City, Chad is fighting the S-tier villain Complex… It is not going well. After a particularly rough hit, Chad decides to retreat. Unfortunately, he leaves without Morgan. Just as Morgan goes to leave, Complex shoots a laser from their eyes that hits to Morgan’s right. Where should they go? To the left is an alley, to the right the main road, straight leads to a flower shop, and behind them past Complex is the subway.\r\n', 0),
('A3', 'Morgan runs into the alley. Looking around they see a large dumpster on the left, some cardboard and scraps to the right, and straight ahead is a gate that blocks their path. Outside the alley is a loud crashing sound as other heroes arrive to fight Complex.', 0),
('B1', 'Morgan leaves the alley and sees Complex fighting Dave Dogers and Morgan’s sister, Margret. In the distance the Fairness Association’s jet is approaching, so that’s where Chad got to. Morgan is called into the fray and joins the fight against Complex. They’re badly injured after a stray balcony collapses on them. They aren’t noticed until the fight ends and are removed to the Fairness Association’s medical bay.\r\n', 0),
('B2', 'Morgan is bedridden for several months and continues to be Chad’s sidekick.', 0),
('B3', '<strong>Morgan remains a sidekick: </strong>Eh, could be worse… I guess? maybe?', 1),
('C1', 'Morgan climbs the dumpster and moves to jump part-way up the gate. Before they can push off, the lid gives way under their weight and they fall into the trash. Now covered in garbage, they climb out of the dumpster and push off the edge so they can reach the top of the gate. They make it this time and work their way over the gate. Just as they reach the other side a stray laser shoots down the alley. It doesn’t hit Morgan, but it does startle them into losing their footing, and they fall to the ground. Sore and covered in garbage, they make their way back to Chad’s base.', 0),
('C2', 'Morgan walks into the base to find that, not only had Chad left them at the fight, but while they were falling in the garbage and stinking up the taxi on the way here, he had not only returned and received medical help, but also sent the rest of his team, The Fairness Association, to fight Complex completely forgetting Morgan in the process.', 0),
('C3', 'Chad: “Oh hey Morgan! Margret just left with the others to finish the fight, you can still catch them if you hurry!”', 0),
('C4', 'Recognizing a dismissal, Morgan leaves the room and heads towards the vehicle bay.', 0),
('C5', 'Morgan gets in a car and heads back towards the fight against Complex. Once they\'re within a few blocks of the fight, they’re able to see several partially collapsed buildings. It looks like the fight is over, and the Fairness Association jet is flying back to the base. Looking around, Morgan can see Complex clearing some of the rubble.', 0),
('C6', 'Turning back around Morgan heads back towards the base. Only a bit away, they see a group of civilians crowded together in a park. Not too far away is a damaged building, likely due to A-tier hero Rockalanch’s power.', 0),
('D1', 'Morgan approaches the group of people and asks what happened. ', 0),
('D2', 'Civilian Mother: We were evacuated when the fight got too close, but Rockalanch’s earthquake made the building too unstable to go back inside.', 0),
('D3', 'Civilian Child: Yeah!! It was cool, but also really scary! The ground shook real bad but mommy protected me so everything\'s fine now!!!', 0),
('D4', 'Civilian Elder: I own the building, and I can use the Hero Damage Insurance Program to pay for the repairs, and somewhere to stay while the repairs are completed.', 0),
('E1', 'Morgan arrives back at  the base, and is once again annoyed to find that the other heroes don’t seem to notice that they weren\'t there before. Fed up, they go into the kitchen and decide to grab a snack, but are stopped by Chad.', 0),
('E2', '“Morgan! My faithful sidekick, grab me a drink before the debrief starts. Oh! And while we\'re in the debrief, why don’t you get a head start on the damage reports?”', 0),
('F1', 'Morgan tentatively approaches the villain, making a bit of noise along the way. Complex seems unconcerned with their approach but looks up once Morgan is within a few feet. ', 0),
('F2', '“Um, What are you doing? Um  uh villain?” Morgan asks.', 0),
('F3', '“Looking for my wallet, why are you covered in garbage?” Oh, right, the dumpster. Is the supervillain seriously looking for their lost wallet? ', 0),
('F4', '“Uh, not important!” fumbling for something more to say, years of sidekick training kick in and Morgan finds themself saying, “I’ll help you look!”', 0),
('F5', '“Uh, sure, thanks.” Complex says bemusedly.', 0),
('F6', 'Morgan starts to look around, shuffling debris and looking along the path the fight took. They finally see a wallet on the ground almost hidden by part of a terrace that collapsed during the fight. They return the wallet to Complex after checking the ID inside, huh so their name’s Alex.', 0),
('F7', '“Thanks, uh if you ever need a favor let me know, ya know?” Complex says, taking the wallet and handing a business card to Morgan. A business card? Really??\r\n<br>>> Complex\'s card: Complex - professional villain (xxx) xxx-xxxx', 0),
('G1', 'Morgan goes home and showers, once they\'re no longer covered in garbage they decide not to give today the chance to get worse and go to bed.', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `choices`
--
ALTER TABLE `choices`
  ADD PRIMARY KEY (`ChoiceID`);

--
-- Indexes for table `story`
--
ALTER TABLE `story`
  ADD PRIMARY KEY (`StoryID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `choices`
--
ALTER TABLE `choices`
  MODIFY `ChoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
