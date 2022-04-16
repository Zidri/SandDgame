-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2022 at 04:06 AM
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
(2, 'Right', 'A2', 'I1'),
(3, 'Straight', 'A2', 'J1'),
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
(17, 'Go Home', 'F7', 'F8'),
(18, 'Ignore Chad', 'E2', 'E3'),
(19, 'Start Damage Reports', 'E2', 'H1'),
(20, 'Go Out', 'E4', '0'),
(21, 'Stay In', 'E4', 'E5'),
(22, 'Exaggerate Report', 'H2', 'H3'),
(23, 'Stick to Truth', 'H2', 'H22'),
(24, 'Check on Margret and Dave', 'H6', 'H7'),
(25, 'Not that guilty, go home', 'H6', 'H16'),
(26, 'Check Flowers', 'J1', 'K1'),
(27, 'Check Counter', 'J1', 'N1'),
(28, 'Go to Back Room', 'J1', 'O1'),
(29, 'Back Outside', 'J1', 'J2'),
(30, 'Back Outside', 'K2', 'K3'),
(31, 'Stay in Shop', 'K2', 'M1'),
(32, 'Use Door', 'K3', 'J2'),
(33, 'Use Window', 'K3', 'K4'),
(34, 'Talk to Person', 'K7', 'K8'),
(35, 'Keep Wandering', 'K7', 'L1'),
(36, 'Grab Card', 'N1', 'N2'),
(37, 'Grab Key', 'N1', 'N3'),
(38, 'Return to Room', 'N2', 'J4'),
(39, 'Grab Key', 'N2', 'N4'),
(40, 'Grab Card', 'N3', 'N5'),
(41, 'Return to Room', 'N3', 'J4'),
(42, 'Return to Room', 'N4', 'J4'),
(43, 'Return to Room', 'N5', 'J4'),
(44, 'Open Door', 'O4', 'O12'),
(45, 'Return to Main Room', 'O4', 'J4'),
(46, 'Check Flowers', 'J4', 'K1'),
(47, 'Check Counter', 'J4', 'N1'),
(48, 'Go to Back Room', 'J4', 'O1'),
(49, 'Back Outside', 'J4', 'J2'),
(50, 'Check Flowers', 'J5', 'K1'),
(51, 'Check Counter', 'J5', 'N1'),
(52, 'Go to Back Room', 'J5', 'O1'),
(53, 'Back Outside', 'J5', 'J2'),
(55, 'Look for Key', 'O12', 'O7'),
(56, 'Pick Lock', 'O12', 'O5'),
(57, 'Open door', 'O1', 'O12'),
(58, 'Explore Room', 'O1', 'O2');

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
('B3', '<strong>Eh, could be worse… I guess? maybe?: Morgan remains a sidekick</strong>', 1),
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
('E3', 'Morgan decides they’re done. They’re still covered in garbage from escaping the fight Chad abandoned them to. Instead, they head home and take a shower, and change. ', 0),
('E4', 'Deciding it’s still too early to go to bed, Morgan debates going out and trying to save what’s left of the day or just watching some TV and going to bed.', 0),
('E5', 'Deciding to stay in, Morgan gets clean and puts on some soft pajamas, and binges their favorite show. It’s a nice end to an otherwise awful day.', 0),
('E6', '<strong>All’s Well That Ends Well: Morgan remains a sidekick</strong>', 1),
('F1', 'Morgan tentatively approaches the villain, making a bit of noise along the way. Complex seems unconcerned with their approach but looks up once Morgan is within a few feet. ', 0),
('F2', '“Um, What are you doing? Um  uh villain?” Morgan asks.', 0),
('F3', '“Looking for my wallet, why are you covered in garbage?” Oh, right, the dumpster. Is the supervillain seriously looking for their lost wallet? ', 0),
('F4', '“Uh, not important!” fumbling for something more to say, years of sidekick training kick in and Morgan finds themself saying, “I’ll help you look!”', 0),
('F5', '“Uh, sure, thanks.” Complex says bemusedly.', 0),
('F6', 'Morgan starts to look around, shuffling debris and looking along the path the fight took. They finally see a wallet on the ground almost hidden by part of a terrace that collapsed during the fight. They return the wallet to Complex after checking the ID inside, huh so their name’s Alex.', 0),
('F7', '“Thanks, uh if you ever need a favor let me know, ya know?” Complex says, taking the wallet and handing a business card to Morgan. A business card? Really??\r\n<br>>> Complex\'s card: Complex - professional villain (xxx) xxx-xxxx', 0),
('F8', 'Morgan heads home and goes to sleep thinking of the business card Complex gave them. The villain seemed surprisingly nice, Morgan hopes they can see them again outside of a fight.', 0),
('F9', '<strong>This might be fun: Morgan decides to give Alex a call in the morning</strong>', 1),
('G1', 'Morgan goes home and showers, once they\'re no longer covered in garbage they decide not to give today the chance to get worse and go to bed.', 0),
('G2', 'TBD', 1),
('H1', 'Morgan starts on the damage reports.', 0),
('H10', '“Hey, Margret, Dave, I felt bad that your dinner plans were ruined, so I made you some food.”', 0),
('H11', '“Wow, thanks so much Morgan!!” Margret exclaims.', 0),
('H12', '“Yeah dude, your food is better than we could get at a restaurant anyway.” Dave compliments.', 0),
('H13', 'Morgan has dinner with the other heroes, and then helps them lead civilians to the temporary shelters set up for those who’ve lost their home for a while before heading back home to go to bed.', 0),
('H14', 'Morgan drifts to sleep with a clean conscience, knowing that even though they lied about the amount of damage done during the fight, they were able to help people recover from the damage that was actually done and spend some time with their sister and her fiance too.', 0),
('H15', '<strong>Clean Conscious: Morgan gets closer with their sister and her fiancé</strong>', 1),
('H16', 'Morgan does feel guilty, but it’s been a long day and really they just want to go home.', 0),
('H17', 'Once home, they put on the news while making dinner. Most of it is about the battle, but they do have a segment on Leader USA and Ms. Amazing helping with the clean-up.', 0),
('H18', 'The two heroes are shown removing rubble from several collapsed buildings and helping civilians to safety. Looking at the damage on the news, Morgan really didn’t exaggerate much on the reports. ', 0),
('H19', 'They’re glad Margret and Dave decided to help with the clean-up, it looks like a lot of lives were saved because they were there.', 0),
('H2', 'They think about the apartment building that was destabilized. They wonder if there’s anything they can do to help. Of course, they could claim the damage is worse than it actually was and ensure they get more insurance money, but that would be illegal.', 0),
('H20', 'Morgan goes to sleep, having learned the lesson that sometimes lying is the right thing to do.', 0),
('H21', '<strong>I guess liars do prosper: Morgan remains a sidekick, but not for long.</strong>', 1),
('H22', 'Morgan works on the reports for the next hour before the heroes finish their debrief. Most of them walk by without comment, but their sister Margret does stop for a bit.', 0),
('H23', '“Hey, Morgan!! Are you doing the damage reports? Perfect!! Dave and I wanted to get dinner, and since you’ve got the reports covered we can!!”', 0),
('H24', '<strong>It only got worse: Morgan goes to bed regretting getting up this morning, it had been an awful day and Morgan is seriously considering a career change.</strong>', 1),
('H3', 'Morgan exaggerates the damage done to the surrounding area from the fight, which is saying a lot since there looked to be quite a lot of damage from what they saw. ', 0),
('H4', 'As they’re filling out the reports, their sister Margret walks by on her way out of the debrief. She sees the report Morgan exaggerated on, and picks it up.', 0),
('H5', '“Oh, wow, that’s a lot more damage than I thought. Dave and I were going to get dinner, but I think we’ll stop by to help with repairs instead! ', 0),
('H6', 'After Margret leaves, Morgan finishes the reports and they start to feel guilty for lying about the damage and ruining Margret’s dinner plans. Maybe they’ll stop by and see how the repairs are going.', 0),
('H7', 'Morgan decides to bring Margret and Dave some food as an apology for ruining their dinner plans.', 0),
('H8', 'They head to the kitchen and throw together a quick meal that they put in some tupperware, and head out to check on Margret and Dave.', 0),
('H9', 'When they find Margret and Dave, they’re helping clear the rubble of a collapsed shop. Once they finish, Morgan approaches them and offers the two heros the food they made.', 0),
('I1', 'Morgan runs towards the main road, unfortunately, that\'s the same direction as the laser.', 0),
('I2', 'Morgan is hit with the laser, and since Chad left without them there\'s no one to help.', 0),
('I3', 'Morgan dies in the fight', 0),
('I4', '<strong>Oh, dang. Guess they\'re dead now, huh.</strong>', 1),
('J1', 'Morgan ran straight towards the flower shop and made it inside before the villain noticed that they hadn’t escaped with Chad. Looking around, Morgan can see several displays of flowers, a counter with a register near the back, and behind the counter a curtain hanging in a doorway that seemed to lead to a back room.', 0),
('J2', 'Morgan leaves the shop and sees Complex fighting Dave Dogers and Morgan’s sister, Margret. In the distance the Fairness Association’s jet is approaching, so that’s where Chad got to. Morgan is called into the fray and joins the fight against Complex. They’re badly injured after a stray balcony collapses on them. They aren’t noticed until the fight ends and are removed to the Fairness Association’s medical bay.', 0),
('J3', 'Send to B2', 0),
('J4', 'Returning to the main room, Morgan sees several displays of flowers, a counter with a register near the back, and behind the counter a curtain hanging in a doorway that seemed to lead to a back room.', 0),
('J5', 'Morgan sees several displays of flowers, a counter with a register near the back, and behind the counter a curtain hanging in a doorway that seemed to lead to a back room.', 0),
('K1', 'There are all kinds of flowers, but Morgan only really recognizes the roses. There is a really pretty red flower with petals that seemed to spread and curl downwards that Morgan really liked. It had thin spidery bits that formed a kind of bowl shape and was probably the prettiest flower they had ever seen. Morgan couldn’t resist grabbing one.', 0),
('K10', 'The person looks at Morgan for a second, before replying, “I don’t believe so, and that’s the worst pickup line I’ve ever heard. What next? Are you going to tell me you must have seen me in your dreams?”', 0),
('K11', 'A bit upset at the rudeness of the apparent stranger, Morgan replies, “I wasn’t but now that I’ve gotten a better look I think you’re right, you look just like a monster from my nightmares.”', 0),
('K12', 'Surprisingly the stranger laughs, “That sounds about right. So what did you need, if not a date?”', 0),
('K13', '“Well your name would be a good start, but if you’re offering I won’t say no, I’m Morgan,” Morgan replies.', 0),
('K14', '“Alex, and sure, why not? Got your phone on you?”', 0),
('K15', 'You hand Alex your phone, and they put their number in. When Morgan goes to put it away again, they feel the flower in their pocket.', 0),
('K16', '“Here, it’s almost as pretty as you,” Morgan says, handing Alex the flower with a smile.', 0),
('K17', 'Alex blushes but accepts the flower.', 0),
('K18', 'Morgan and Alex talk for a bit before Alex continues on their way home. Morgan stands there for a minute before remembering that they have their phone and can just get directions home.', 0),
('K19', 'Following the directions from their phone, Morgan arrives home and goes to sleep off their concussion, thinking about their upcoming date with Alex.', 0),
('K2', 'The sounds of the fight have died down, and Morgan considers going back outside and seeing if Complex has left yet.', 0),
('K20', '<strong>Well, this could get complex: Morgan and Alex have a nice date, where Alex convinces Morgan they deserve to be treated better and Morgan decides that Alex is too much fun to not go on another date with.</strong>', 1),
('K3', 'Morgan decides to go outside', 0),
('K4', 'Morgan sees a window leading to the side of the shop, they try to jump through it, but in their haste forget to open it and end up knocking their head against the glass. It doesn’t break, but they do feel a bit dizzy.', 0),
('K5', 'Morgan opens the window and climbs out.\r\nThey’re in a side street, and the sounds of fighting are picking up again, but Morgan knows better than to try and fight with a concussion.', 0),
('K6', 'They leave in the direction of home but get turned around trying to avoid the fight and subsequent damage.', 0),
('K7', 'After what could be a few minutes or maybe several hours (don’t ask them, they have a concussion), Morgan sees someone that looks pretty familiar. They can’t place where they know the person from, but they definitely recognize them.', 0),
('K8', 'Morgan walks up to the person.', 0),
('K9', '“Hey, I’m sorry, but you look really familiar, do I know you?”', 0),
('L1', 'Morgan never does find their way back home and ends up sleeping in an alley, not too far from the fight. The following morning they make their way home with a clearer head. ', 0),
('L2', 'On the way home, feeling sick of being forgotten after fights and getting injured, Morgan decides to quit being a sidekick.', 0),
('L3', '<strong>Ever heard of a good landlord?: They think about how many people lose their homes in villain fights and have to sleep outside like they did last night.</strong>', 1),
('L4', 'Thinking of the card they have for the flower shop, they consider giving them a call and seeing if they need employees after things from the fight are repaired.', 0),
('L5', '<strong>Time to take stalk of your life: Morgan arrives home with a plan and gets a job at a flower shop.</strong>', 1),
('M1', 'Morgan stays in the shop, within minutes the fight seems to pick up again, good thing they didn’t go back out there.', 0),
('M2', 'Jump to J5', 0),
('N1', 'The counter has a register and some business cards, there’s also a key on a hook under the counter.', 0),
('N2', 'Morgan grabs a card', 0),
('N3', 'Morgan grabs the key', 0),
('N4', 'Morgan grabs the key', 0),
('N5', 'Morgan grabs a card', 0),
('O1', 'Morgan walks through the curtain at the back of the room and sees several shelves with various items, including pots, ribbons, colored paper, aprons, small trowels, and boxes. At the back of the room is a door that appears to lead out of the shop.', 0),
('O10', 'Maybe it’ll be by the counter in the front of the shop. They leave the room and check out the counter.', 0),
('O11', 'Jump to N1', 0),
('O12', 'Morgan tries to open the door, and it’s locked. The door has a keyhole.', 0),
('O13', 'Jump to R1', 0),
('O2', 'Morgan looks around the room and finds various gardening supplies, as well as things for wrapping flowers.', 0),
('O3', 'There’s also several bags of soil, some trowels, and several aprons presumably worn by the shop\'s employees.', 0),
('O4', 'Checking the aprons Morgan finds some leaves and dirt, but nothing useful.', 0),
('O5', 'Morgan goes to pick the lock using a small trowel. The trowel is much too big for the lock and breaks. The tip of the trowel is now stuck in the lock. Morgan uses the remainder of the trowel to repeatedly hit the door. After hitting the door several times the room starts to shake.', 0),
('O6', 'Jump to P1', 0),
('O7', 'Morgan looks around the room, they check around the door, looking to see if the key is hanging nearby.', 0),
('O8', 'When they don’t see one, they check the various shelves.', 0),
('O9', 'They find a variety of gardening supplies and assorted things for wrapping flowers, but no key.', 0),
('P1', 'Morgan goes to leave when an earthquake shakes the room.', 0),
('P2', 'It’s probably the hero Rockalanche comes fighting Complex, but either way, it makes the room shake, and the ceiling is making a groaning noise that Morgan doesn’t like.', 0),
('P3', 'Before Morgan can move to escape back outside, the building collapses on top of them.', 0),
('P4', '<strong>Well, at least you\'re already buried: Morgan was knocked in the head by some of the debris and survived for a bit, but no one knew they were there and they died before help could arrive.</strong>', 1),
('Q1', 'Morgan looks around the room, they check around the door, looking to see if the key is hanging nearby.', 0),
('R1', 'Morgan tries to open the door, and it’s locked. The door has a keyhole. They remember the key from the desk and give it a try. It works! The door opens and Morgan leaves the shop.', 0),
('R10', '“Uh, sure you can join me I guess, but call me Alex,” Complex, or rather Alex answers.', 0),
('R11', '<strong>Really, in a grocery store?!: Morgan goes shopping with Alex and they actually have a really nice time. Morgan and Alex exchange numbers and decide to get together for brunch later in the week.</strong>', 1),
('R2', 'The door leads to a back alley, Morgan leaves the alley and ends up a street over from the fight. Knowing Chad probably went to the Fairness Association headquarters, Morgan decides to head there.', 0),
('R3', 'Walking towards the headquarters, Morgan sees Complex walking along the street ahead of them.  Confused, because they were sure Complex was still on the same street as the fight, Morgan cautiously approached them.', 0),
('R4', '“Uh, Weren’t you fighting over there?” Morgan asked, gesturing towards the street the fight had been on.', 0),
('R5', '“Yeah, I still am, but I forgot to get groceries so I’m going shopping too,” Complex replies.', 0),
('R6', '“What do you mean you’re still fighting?”', 0),
('R7', '“I just cloned myself, because the market is having a sale on deli meat and I want to make sandwiches tomorrow,” the villain explains.', 0),
('R8', 'Morgan thinks that they should probably keep an eye on the villain. Even though it doesn’t look like they’re doing anything particularly villainous, Morgan still feels morally obligated to make sure it stays that way.', 0),
('R9', '“Great, so you won’t mind if I join you! My name’s Morgan by the way, should I just call you Complex?” Morgan introduces themself.', 0);

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
  MODIFY `ChoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
