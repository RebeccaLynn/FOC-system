DROP DATABASE IF EXISTS FOC_DB;
CREATE DATABASE IF NOT EXISTS FOC_DB;
GRANT ALL PRIVILEGES ON FOC_DB.* TO 'Useruser'@'localhost' identified by 'user';
USE FOC_DB;

CREATE TABLE IF NOT EXISTS `committees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `committees`
--

INSERT INTO `committees` (`id`, `cName`) VALUES
(1, 'Bachelor of Liberal Studies'),
(2, 'Campus Academic Resources'),
(3, 'Curriculum'),
(4, 'Distance and Blended Learning'),
(5, 'Faculty Development and Grants'),
(6, 'Faculty Organization'),
(7, 'Faculty Senate'),
(8, 'First Year Seminar'),
(9, 'Honors Program'),
(10, 'James Farmer Multicultural Center Advisory'),
(11, 'Museum Studies'),
(12, 'Promotion and Tenure'),
(13, 'Speaking Intensive'),
(14, 'Teaching Center Advisory'),
(15, 'University Avademic Affairs'),
(16, 'University Budget Advisory'),
(17, 'University Curriculum'),
(18, 'University Faculty Affairs'),
(19, 'University Faculty Appeals and Grievance Committee'),
(20, 'University General Education'),
(21, 'University Sabbaticals, Fellowships, & Faculty Awards'),
(22, 'University Student Affairs & Campus Life Advisory'),
(23, 'Writing Intensive');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `memberPK_id` int(11) NOT NULL AUTO_INCREMENT,
  `fName` varchar(50) DEFAULT NULL,
  `lName` varchar(50) DEFAULT NULL,
  `department` varchar(60) NOT NULL,
  `active` varchar(3) DEFAULT NULL,
  `previousPos` varchar(50) DEFAULT NULL,
  `interests` varchar(50) DEFAULT NULL,
  `dateActivity` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`memberPK_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=446 ;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`memberPK_id`, `fName`, `lName`, `department`, `active`, `previousPos`, `position`, `dateActivity`) VALUES
(1, 'Laurie B.', 'Abeel', '', '', NULL, NULL, NULL),
(2, 'Janice N.', 'Adams', '', '', NULL, NULL, NULL),
(3, 'Kathryn K.', 'Ahearn', '', '', NULL, NULL, NULL),
(4, 'Maysoon Fayez Al-Sayed', 'Ahmad', '', '', NULL, NULL, NULL),
(5, 'Nabil S.', 'Al-Tikriti', '', '', NULL, NULL, NULL),
(6, 'William R.', 'Alexander', '', '', NULL, NULL, NULL),
(7, 'Kenneth F.', 'Allwine', '', '', NULL, NULL, NULL),
(8, 'Beverly A.', 'Almond', '', '', NULL, NULL, NULL),
(9, 'David K.', 'Ambuel', 'CLPR', '', NULL, NULL, NULL),
(10, 'Mehdi', 'Aminrazavi', '', '', NULL, NULL, NULL),
(11, 'Alexander W.', 'Anderson', '', '', NULL, NULL, NULL),
(12, 'Kelly Lane', 'Andrus', '', '', NULL, NULL, NULL),
(13, 'Karen M.', 'Anewalt', 'CPSC', '', NULL, NULL, NULL),
(14, 'Deena', 'Applebury', '', '', NULL, NULL, NULL),
(15, 'Olga R.', 'Arans', '', '', NULL, NULL, NULL),
(16, 'Rosemary H.', 'Arneson', '', '', NULL, NULL, NULL),
(17, 'Janet A.', 'Asper', '', '', NULL, NULL, '2013'),
(18, 'Clinton W.', 'Bagwell', '', '', NULL, NULL, NULL),
(19, 'David J.', 'Baker', '', '', NULL, NULL, NULL),
(20, 'Dianne M.', 'Baker', '', '', NULL, NULL, NULL),
(21, 'Kerri S.', 'Barile', '', '', NULL, NULL, NULL),
(22, 'Robert R.', 'Barr', '', '', NULL, NULL, NULL),
(23, 'Rosemary', 'Barra', '', '', NULL, NULL, NULL),
(24, 'Antonio', 'Barrenechea', '', '', NULL, NULL, NULL),
(25, 'Kevin P.', 'Bartram', '', '', NULL, NULL, NULL),
(26, 'James Martin', 'Bass', '', '', NULL, NULL, NULL),
(27, 'Michael L.', 'Bass', '', '', NULL, NULL, NULL),
(28, 'Johanna L.', 'Beaver', '', '', NULL, NULL, NULL),
(29, 'Porter R.', 'Blakemore', '', '', NULL, NULL, NULL),
(30, 'Maria Laura', 'Bocaz', '', '', NULL, NULL, NULL),
(31, 'Damien T.', 'Bollino', '', '', NULL, NULL, NULL),
(32, 'Eric C.', 'Bonds', '', '', NULL, NULL, NULL),
(33, 'Pamela', 'Booth', '', '', NULL, NULL, NULL),
(34, 'Dawn S.', 'Bowen', '', '', NULL, NULL, NULL),
(35, 'Jon', 'Boyle', '', '', NULL, NULL, NULL),
(36, 'Abby G.', 'Brethauer', '', '', NULL, NULL, NULL),
(37, 'Catherine M.', 'Brewer', '', '', NULL, NULL, NULL),
(38, 'Michelle O.', 'Briggs', '', '', NULL, NULL, NULL),
(39, 'Nancy B.', 'Brittle', '', '', NULL, NULL, NULL),
(40, 'Gail D.', 'Brooks', '', '', NULL, NULL, NULL),
(41, 'John P.', 'Broome', '', '', NULL, NULL, NULL),
(42, 'Donna J.', 'Broussard', '', '', NULL, NULL, NULL),
(43, 'Adrienne F.', 'Brovero', '', '', NULL, NULL, NULL),
(44, 'Robert G.', 'Brown', '', '', NULL, NULL, NULL),
(45, 'Shauna R.', 'Brown', '', '', NULL, NULL, NULL),
(46, 'Karen E.', 'Burrell', '', '', NULL, NULL, NULL),
(47, 'Erik W.', 'Burtis', '', '', NULL, NULL, NULL),
(48, 'Martha F.', 'Burtis', '', '', NULL, NULL, NULL),
(49, 'Garland E.', 'Carper', '', '', NULL, NULL, NULL),
(50, 'Deborah L.', 'Carter', '', '', NULL, NULL, NULL),
(51, 'Patrick L.', 'Catullo', '', '', NULL, NULL, NULL),
(52, 'Charles C.', 'Chadbourn', '', '', NULL, NULL, NULL),
(53, 'Jeanne D.', 'Chalifoux', '', '', NULL, NULL, NULL),
(54, 'Wei', 'Chen', '', '', NULL, NULL, NULL),
(55, 'Yuan-Jen', 'Chiang', 'MATH', '', NULL, NULL, NULL),
(56, 'Ana Garcia', 'Chichester', '', '', NULL, NULL, NULL),
(57, 'Tracy B.', 'Citeroni', '', '', NULL, NULL, NULL),
(58, 'Susan Z.', 'Clark', '', '', NULL, NULL, NULL),
(59, 'Courtney M.', 'Clayton', '', '', NULL, NULL, NULL),
(60, 'Teresa L.', 'Coffman', '', '', NULL, NULL, NULL),
(61, 'Mark A.', 'Cohen', '', '', NULL, NULL, NULL),
(62, 'Manning G.', 'Collier', '', '', NULL, NULL, NULL),
(63, 'Deborah A.', 'Conway', '', '', NULL, NULL, NULL),
(64, 'Eugene A.', 'Cooper', '', '', NULL, NULL, NULL),
(65, 'Rosalyn L.', 'Cooperman', '', '', NULL, NULL, NULL),
(66, 'Aksel B.', 'Corlu', '', '', NULL, NULL, NULL),
(67, 'Michael V.', 'Cotter', '', '', NULL, NULL, NULL),
(68, 'Darius', 'Coulibaly', '', '', NULL, NULL, NULL),
(69, 'Leah K.', 'Cox', '', '', NULL, NULL, NULL),
(70, 'Donald F.', 'Craib', '', '', NULL, NULL, NULL),
(71, 'William B.', 'Crawley', '', '', NULL, NULL, NULL),
(72, 'John R.', 'Crigler', '', '', NULL, NULL, NULL),
(73, 'Timothy A.', 'Crippen', '', '', NULL, NULL, NULL),
(74, 'K. Nicole', 'Crowder', '', '', NULL, NULL, NULL),
(75, 'Richard C.', 'Curley', '', '', NULL, NULL, NULL),
(76, 'Jean A.', 'Dabb', '', '', NULL, NULL, NULL),
(77, 'Jason W.', 'Davidson', '', '', NULL, NULL, NULL),
(78, 'Stephen C.', 'Davies', '', '', NULL, NULL, NULL),
(79, 'Brian D.', 'Davis', '', '', NULL, NULL, NULL),
(80, 'Janine S.', 'Davis', '', '', NULL, NULL, NULL),
(81, 'Alan J.', 'Dean', '', '', NULL, NULL, NULL),
(82, 'Patricia M.', 'Dean', '', '', NULL, NULL, NULL),
(83, 'Galen F.', 'deGraff', '', '', NULL, NULL, NULL),
(84, 'Antonia L.', 'Delgado-Poust', '', '', NULL, NULL, NULL),
(85, 'Brooke D.', 'Di Lauro', '', '', NULL, NULL, '2015'),
(86, 'Joseph C.', 'DiBella', '', '', NULL, NULL, NULL),
(87, 'Andrew S.', 'Dolby', '', '', NULL, NULL, NULL),
(88, 'Joseph G.', 'Dreiss', 'ARTH', '', NULL, NULL, NULL),
(89, 'Betty Ann', 'Durrer', '', '', NULL, NULL, NULL),
(90, 'Helena A.', 'Easter', '', '', NULL, NULL, NULL),
(91, 'Lindsey M.', 'Elliott', '', '', NULL, NULL, NULL),
(92, 'Claudia', 'Emerson', '', '', NULL, NULL, NULL),
(93, 'Beverly D.', 'Epps', '', '', NULL, NULL, NULL),
(94, 'Mindy J.', 'Erchull', '', '', NULL, NULL, NULL),
(95, 'Carol E.', 'Erion', '', '', NULL, NULL, NULL),
(96, 'Julius N.', 'Esunge', '', '', NULL, NULL, NULL),
(97, 'Elvira', 'Evangelauf', '', '', NULL, NULL, NULL),
(98, 'Edythe M.', 'Evans', '', '', NULL, NULL, NULL),
(99, 'Marcelo', 'Fajardo-Cardenas', 'MDFL', '', NULL, NULL, NULL),
(100, 'Paul D.', 'Fallon', 'ENLC', '', NULL, NULL, NULL),
(101, 'Stephen J.', 'Farnsworth', '', '', NULL, NULL, NULL),
(102, 'William H.', 'Farr', '', '', NULL, NULL, NULL),
(103, 'Patrick J.', 'Fell', '', '', NULL, NULL, NULL),
(104, 'Susan R.', 'Fernsebner', '', '', NULL, NULL, NULL),
(105, 'Claudine L.', 'Ferrell', '', '', NULL, NULL, NULL),
(106, 'Martha Van Zandt', 'Fickett', '', '', NULL, NULL, NULL),
(107, 'Emily A.', 'Filler', '', '', NULL, NULL, NULL),
(108, 'Caitlin C.', 'Finlayson', '', '', NULL, NULL, NULL),
(109, 'Ian', 'Finlayson', '', '', NULL, NULL, NULL),
(110, 'James A.', 'Ford', '', '', NULL, NULL, NULL),
(111, 'James L.', 'Forry', '', '', NULL, NULL, NULL),
(112, 'Christofer C.', 'Foss', '', '', NULL, NULL, NULL),
(113, 'Robert L.', 'Frackelton', '', '', NULL, NULL, NULL),
(114, 'Stephen W.', 'Fuller', '', '', NULL, NULL, NULL),
(115, 'Nancy E.', 'Furlow', '', '', NULL, NULL, NULL),
(116, 'Andrew T.', 'Fyfe', '', '', NULL, NULL, NULL),
(117, 'E. Eric', 'Gable', '', '', NULL, NULL, NULL),
(118, 'James F.', 'Gaines', '', '', NULL, NULL, NULL),
(119, 'Raffaella', 'Gaines', '', '', NULL, NULL, NULL),
(120, 'Jacqueline', 'Gallagher', '', '', NULL, NULL, NULL),
(121, 'Stephen G.', 'Gallik', '', '', NULL, NULL, NULL),
(122, 'Christopher J.', 'Garcia', '', '', NULL, NULL, NULL),
(123, 'Carole', 'Garmon', '', '', NULL, NULL, NULL),
(124, 'Douglas', 'Gately', '', '', NULL, NULL, NULL),
(125, 'Roberta A', 'Gentry', '', '', NULL, NULL, NULL),
(126, 'Leanna C.', 'Giancarlo', '', '', NULL, NULL, NULL),
(127, 'Carol', 'Gick', '', '', NULL, NULL, NULL),
(128, 'Kurt M.', 'Glaeser', '', '', NULL, NULL, NULL),
(129, 'James R.', 'Glenn', '', '', NULL, NULL, NULL),
(130, 'James E.', 'Goehring', '', '', NULL, NULL, NULL),
(131, 'Gladys M.', 'Gomez', '', '', NULL, NULL, '2013'),
(132, 'Eos Gonzalez', 'Sanchez', '', '', NULL, NULL, NULL),
(133, 'Cassandra A.', 'Good', '', '', NULL, NULL, NULL),
(134, 'Rachel L.', 'Graefe-Anderson', '', '', NULL, NULL, NULL),
(135, 'Theresa M.', 'Grana', 'BIOL', '', NULL, NULL, NULL),
(136, 'Roy F.', 'Gratz', '', '', NULL, NULL, NULL),
(137, 'April', 'Greenan', '', '', NULL, NULL, NULL),
(138, 'George R.', 'Greene', '', '', NULL, NULL, NULL),
(139, 'Steven A.', 'Greenlaw', '', '', NULL, NULL, NULL),
(140, 'Alan B.', 'Griffith', '', '', NULL, NULL, NULL),
(141, 'James', 'Groom', '', '', NULL, NULL, NULL),
(142, 'Christine U.', 'Grosse', '', '', NULL, NULL, NULL),
(143, 'Andrew R.', 'Guffey', '', '', NULL, NULL, NULL),
(144, 'Surupa', 'Gupta', 'PSIA', '', NULL, NULL, NULL),
(145, 'Nancy D.', 'Guth', '', '', NULL, NULL, NULL),
(146, 'Joseph E.', 'Guthrie', '', '', NULL, NULL, NULL),
(147, 'Amanda C.', 'Guyton', '', '', NULL, NULL, NULL),
(148, 'Gwendolyn N.', 'Hale', '', '', NULL, NULL, NULL),
(149, 'Dana S.', 'Hall', '', '', NULL, NULL, NULL),
(150, 'Steven T.', 'Hall', '', '', NULL, NULL, NULL),
(151, 'Steve R.', 'Hampton', 'PSYC', '', NULL, NULL, NULL),
(152, 'Julie S.', 'Handley', '', '', NULL, NULL, NULL),
(153, 'Kevin B.', 'Handley', '', '', NULL, NULL, NULL),
(154, 'Bradley A.', 'Hansen', 'ECON', '', NULL, NULL, NULL),
(155, 'Jennifer', 'Hansen-Glucklich', '', '', NULL, NULL, NULL),
(156, 'Shirley T.', 'Hanson', '', '', NULL, NULL, NULL),
(157, 'Allison L.', 'Hardy', '', '', NULL, NULL, NULL),
(158, 'Katharine E.', 'Harmon', '', '', NULL, NULL, NULL),
(159, 'Steven E.', 'Harris', '', '', NULL, NULL, NULL),
(160, 'Jodie L.', 'Hayob', '', '', NULL, NULL, NULL),
(161, 'Alan', 'Heffner', '', '', NULL, NULL, NULL),
(162, 'Elizabeth L.', 'Heimbach', '', '', NULL, NULL, NULL),
(163, 'J. Todd', 'Helbling', '', '', NULL, NULL, NULL),
(164, 'Randall D.', 'Helmstutler', 'MATH', '', NULL, NULL, NULL),
(165, 'David L.', 'Henderson', '', '', NULL, NULL, NULL),
(166, 'Elaine L.', 'Hendricks', '', '', NULL, NULL, NULL),
(167, 'Paul S.', 'Henry', '', '', NULL, NULL, NULL),
(168, 'William C.', 'Hewson', '', '', NULL, NULL, NULL),
(169, 'Kathryn D.', 'Hichborn', '', '', NULL, NULL, NULL),
(170, 'David E.', 'Hinds', '', '', NULL, NULL, NULL),
(171, 'Julie A.', 'Hodge', '', '', NULL, NULL, NULL),
(172, 'Adria R.', 'Hoffman', '', '', NULL, NULL, NULL),
(173, 'F. Douglas', 'Holcombe', '', '', NULL, NULL, NULL),
(174, 'Joseph R.', 'Holler', '', '', NULL, NULL, NULL),
(175, 'Norah S.', 'Hooper', '', '', NULL, NULL, NULL),
(176, 'Angela L.', 'Hoopes', 'MATH', '', NULL, NULL, NULL),
(177, 'Suzanne G.', 'Houff', '', '', NULL, NULL, NULL),
(178, 'Liane R.', 'Houghtalin', '', '', NULL, NULL, NULL),
(179, 'Helen M.', 'Housley', '', '', NULL, NULL, NULL),
(180, 'Heather D.', 'Howe', '', '', NULL, NULL, NULL),
(181, 'Daniel J.', 'Hubbard', '', '', NULL, NULL, NULL),
(182, 'Jane L.', 'Huffman', '', '', NULL, NULL, NULL),
(183, 'Janet E.', 'Hughes', '', '', NULL, NULL, NULL),
(184, 'W. Shawn', 'Humphrey', '', '', NULL, NULL, NULL),
(185, 'David E.', 'Hunt', '', '', NULL, NULL, NULL),
(186, 'Debra L.', 'Hydorn', '', '', NULL, NULL, NULL),
(187, 'Jaimie J.', 'Inman', '', '', NULL, NULL, NULL),
(188, 'Lauren A.', 'Jacobs', '', '', NULL, NULL, NULL),
(189, 'Jason C.', 'James', '', '', NULL, NULL, NULL),
(190, 'Roy W.', 'Jarnecke', '', '', NULL, NULL, NULL),
(191, 'David H.', 'Jennings', '', '', NULL, NULL, NULL),
(192, 'Rosemary K.', 'Jesionowski', '', '', NULL, NULL, NULL),
(193, 'John L.', 'Johnson', '', '', NULL, NULL, NULL),
(194, 'Lori D.', 'Johnson', '', '', NULL, NULL, NULL),
(195, 'Matthew J.', 'Johnson', '', '', NULL, NULL, NULL),
(196, 'Fernanda L.', 'Kain', '', '', NULL, NULL, NULL),
(197, 'Mary A.', 'Kayler', '', '', NULL, NULL, NULL),
(198, 'Evangeline F.', 'Keller', '', '', NULL, NULL, NULL),
(199, 'Teresa A.', 'Kennedy', '', '', NULL, NULL, NULL),
(200, 'Jason A.', 'Kilby', '', '', NULL, NULL, NULL),
(201, 'Joella C.', 'Killian', 'BIOL', '', NULL, NULL, NULL),
(202, 'Michael', 'Killian', '', '', NULL, NULL, NULL),
(203, 'Christopher', 'Kilmartin', '', '', NULL, NULL, NULL),
(204, 'Nora Hui-Jung', 'Kim', 'SOCG', '', NULL, NULL, NULL),
(205, 'George', 'King', '', '', NULL, NULL, NULL),
(206, 'Kimberley L.', 'Kinsley', '', '', NULL, NULL, NULL),
(207, 'Ben Odhiambo', 'Kisila', '', '', NULL, NULL, NULL),
(208, 'Mary Beth', 'Klinger', '', '', NULL, NULL, NULL),
(209, 'Michael K.', 'Kolakoski', '', '', NULL, NULL, NULL),
(210, 'David W.', 'Kolar', '', '', NULL, NULL, NULL),
(211, 'Janusz', 'Konieczny', '', '', NULL, NULL, NULL),
(212, 'Leonard R.', 'Koos', 'MDFL', '', NULL, NULL, NULL),
(213, 'Dena H.', 'Kota', '', '', NULL, NULL, NULL),
(214, 'John M.', 'Kramer', '', '', NULL, NULL, NULL),
(215, 'Barry M', 'Kur', '', '', NULL, NULL, NULL),
(216, 'Benjamin J.', 'LaBreche', '', '', NULL, NULL, NULL),
(217, 'Michael S.', 'Lapke', '', '', NULL, NULL, NULL),
(218, 'Shalyn M.', 'Lapke', '', '', NULL, NULL, NULL),
(219, 'Jeremy G.', 'Larochelle', 'MDFL', '', NULL, NULL, NULL),
(220, 'Elizabeth F.', 'Larus', 'PSCI', '', NULL, NULL, NULL),
(221, 'Megan K.', 'LeDoux', '', '', NULL, NULL, NULL),
(222, 'Jangwoon', 'Lee', 'MATH', '', NULL, NULL, NULL),
(223, 'Jung Eun', 'Lee', '', '', NULL, NULL, NULL),
(224, 'J. Larry', 'Lehman', 'MATH', '', NULL, NULL, NULL),
(225, 'Kristen A.', 'LePine', '', '', NULL, NULL, NULL),
(226, 'Emile J.', 'Lester', '', '', NULL, NULL, NULL),
(227, 'Alan H.', 'Levine', '', '', NULL, NULL, NULL),
(228, 'Elizabeth M.F.', 'Lewis', '', '', NULL, NULL, NULL),
(229, 'Lynn O.', 'Lewis', '', '', NULL, NULL, NULL),
(230, 'Li', 'Li', '', '', NULL, NULL, NULL),
(231, 'Miriam N.', 'Liss', 'PYSC', '', NULL, NULL, NULL),
(232, 'Chinthaka', 'Liyanage', '', '', NULL, NULL, NULL),
(233, 'Jessica C.', 'Locke', '', '', NULL, NULL, NULL),
(234, 'Kathryn E.', 'Loesser-Casey', 'BIOL', '', NULL, NULL, NULL),
(235, 'David J.', 'Long', '', '', NULL, NULL, NULL),
(236, 'Eric G.', 'Lorentzen', '', '', NULL, NULL, NULL),
(237, 'Michael S.', 'Lowry', '', '', NULL, NULL, NULL),
(238, 'Kenneth D.', 'Machande', '', '', NULL, NULL, NULL),
(239, 'Virginia H.', 'Mackintosh', '', '', NULL, NULL, NULL),
(240, 'Will B.', 'Mackintosh', '', '', NULL, NULL, NULL),
(241, 'John R.', 'Maddox', '', '', NULL, NULL, NULL),
(242, 'Jennifer R.', 'Mailloux', '', '', NULL, NULL, NULL),
(243, 'Robert W.', 'Major', '', '', NULL, NULL, NULL),
(244, 'Marshall E.', 'Maley', '', '', NULL, NULL, NULL),
(245, 'Wyatt A.', 'Mangum', '', '', NULL, NULL, NULL),
(246, 'Mario I.', 'Mantilla', '', '', NULL, NULL, NULL),
(247, 'Kristin L.', 'Marsh', '', '', NULL, NULL, NULL),
(248, 'Leslie E.', 'Martin', '', '', NULL, NULL, NULL),
(249, 'Louis A.', 'Martinette', '', '', NULL, NULL, NULL),
(250, 'Maria Isabel', 'Martinez-Mira', 'MDFL', '', NULL, NULL, NULL),
(251, 'Raymond', 'Mataloni', '', '', NULL, NULL, NULL),
(252, 'Mary Beth S.', 'Mathews', '', '', NULL, NULL, NULL),
(253, 'Maya', 'Mathur', 'ENLC', '', NULL, NULL, NULL),
(254, 'Raymond W.', 'Mattozzi', '', '', NULL, NULL, NULL),
(255, 'Susan C.', 'Matts', '', '', NULL, NULL, NULL),
(256, 'Jason P.', 'Matzke', '', '', NULL, NULL, NULL),
(257, 'Marie E.', 'McAllister', '', '', NULL, NULL, NULL),
(258, 'Christine A.', 'McBride', '', '', NULL, NULL, NULL),
(259, 'Venitta C.', 'McCall', '', '', NULL, NULL, NULL),
(260, 'John W.', 'McCarthy', '', '', NULL, NULL, NULL),
(261, 'John R.', 'McCarthy', '', '', NULL, NULL, NULL),
(262, 'Michael J.', 'McCarthy', '', '', NULL, NULL, NULL),
(263, 'Jeffrey W.', 'McClurken', '', '', NULL, NULL, NULL),
(264, 'Kevin J.', 'McCluskey', '', '', NULL, NULL, NULL),
(265, 'William F.', 'McCoy', '', '', NULL, NULL, NULL),
(266, 'Kenneth J.', 'McGrath', '', '', NULL, NULL, NULL),
(267, 'Jonathan F.', 'McMillan', '', '', NULL, NULL, NULL),
(268, 'Heather A.', 'McMurray', '', '', NULL, NULL, NULL),
(269, 'Pamela J.', 'McNab', '', '', NULL, NULL, NULL),
(270, 'George R.', 'Meadows', 'EDUC', '', NULL, NULL, '2014'),
(271, 'Keith E.', 'Mellinger', '', '', NULL, NULL, NULL),
(272, 'Alison J.', 'Melnick', '', '', NULL, NULL, NULL),
(273, 'Beverly B.', 'Mendez', '', '', NULL, NULL, NULL),
(274, 'Laura H.', 'Mentore', '', '', NULL, NULL, NULL),
(275, 'Margaret A.', 'Mi', '', '', NULL, NULL, NULL),
(276, 'Bruce H.', 'Middle', '', '', NULL, NULL, NULL),
(277, 'Nina V.', 'Mikhalevsky', '', '', NULL, NULL, NULL),
(278, 'J. Michael', 'Miller', '', '', NULL, NULL, NULL),
(279, 'Marcia L.', 'Miller', '', '', NULL, NULL, NULL),
(280, 'Frances J.', 'Minich', '', '', NULL, NULL, NULL),
(281, 'David R.', 'Mirra', '', '', NULL, NULL, NULL),
(282, 'Rebecca A.', 'Moffitt', '', '', NULL, NULL, NULL),
(283, 'Krystyn R.', 'Moon', '', '', NULL, NULL, NULL),
(284, 'Jessica E.', 'Moore', '', '', NULL, NULL, NULL),
(285, 'John T.', 'Morello', '', '', NULL, NULL, NULL),
(286, 'Milton', 'Muldrow', '', '', NULL, NULL, NULL),
(287, 'Charles M.', 'Murphy', '', '', NULL, NULL, NULL),
(288, 'H. Nicole', 'Myers', '', '', NULL, NULL, NULL),
(289, 'Gerald B.', 'Ndikintum', '', '', NULL, NULL, NULL),
(290, 'Robin R.', 'Nemeth', '', '', NULL, NULL, NULL),
(291, 'Darrel B.', 'Nerove', '', '', NULL, NULL, NULL),
(292, 'Kavatus R.', 'Newell', '', '', NULL, NULL, NULL),
(293, 'Hai T.', 'Nguyen', '', '', NULL, NULL, NULL),
(294, 'Joseph W.', 'Nicholas', '', '', NULL, NULL, NULL),
(295, 'Denis', 'Nissim-Sabat', '', '', NULL, NULL, NULL),
(296, 'Kristopher M.', 'Norris', '', '', NULL, NULL, NULL),
(297, 'Bruce R.', 'O''Brien', '', '', NULL, NULL, NULL),
(298, 'Edward J.', 'O''Callahan', '', '', NULL, NULL, NULL),
(299, 'Deborah A.', 'O''Dell', '', '', NULL, NULL, NULL),
(300, 'Timothy M.', 'O''Donnell', 'ELC', '', NULL, NULL, NULL),
(301, 'Marjorie A.', 'Och', '', '', NULL, NULL, NULL),
(302, 'M. Patricia', 'Orozco', '', '', NULL, NULL, NULL),
(303, 'Timothy R.', 'Owens', '', '', NULL, NULL, NULL),
(304, 'Smita Jain', 'Oxford', '', '', NULL, NULL, NULL),
(305, 'Carleitta L.', 'Paige-Anderson', '', '', NULL, NULL, NULL),
(306, 'Lillian H.', 'Pailen', '', '', NULL, NULL, NULL),
(307, 'Araceli', 'Palomino', '', '', NULL, NULL, NULL),
(308, 'Judith A.', 'Parker', '', '', NULL, NULL, NULL),
(309, 'Carolyn S.', 'Parsons', '', '', NULL, NULL, NULL),
(310, 'Richard B.', 'Pasto', '', '', NULL, NULL, NULL),
(311, 'Melina A.', 'Patterson', '', '', NULL, NULL, NULL),
(312, 'Joel D.', 'Peck', '', '', NULL, NULL, NULL),
(313, 'Larry W.', 'Penwell', '', '', NULL, NULL, NULL),
(314, 'Mathieu', 'Perrot', '', '', NULL, NULL, NULL),
(315, 'Tangela N.', 'Phillips', '', '', NULL, NULL, NULL),
(316, 'Allison Marie', 'Piccolo', '', '', NULL, NULL, NULL),
(317, 'Thomas W.', 'Pigg', '', '', NULL, NULL, NULL),
(318, 'Angela L.', 'Pitts', 'CLPR', '', NULL, NULL, NULL),
(319, 'Shelli M.', 'Poe', '', '', NULL, NULL, NULL),
(320, 'Jennifer A.', 'Polack-Wahl', '', '', NULL, NULL, NULL),
(321, 'Timur R.', 'Pollack-Lagushenko', '', '', NULL, NULL, NULL),
(322, 'Allyson M.', 'Poska', '', '', NULL, NULL, NULL),
(323, 'Eric D.', 'Powell', '', '', NULL, NULL, NULL),
(324, 'Scott M.', 'Powers', 'MDFL', '', NULL, NULL, NULL),
(325, 'Tamie L.', 'Pratt-Fartro', '', '', NULL, NULL, NULL),
(326, 'Diane P.', 'Pruner', '', '', NULL, NULL, NULL),
(327, 'Steve', 'Rabson', '', '', NULL, NULL, NULL),
(328, 'Colin T.', 'Rafferty', 'ENLC', '', NULL, NULL, NULL),
(329, 'Donald N.', 'Rallis', '', '', NULL, NULL, NULL),
(330, 'P. Anand', 'Rao', '', '', NULL, NULL, NULL),
(331, 'Margaret A.', 'Ray', 'ECON', '', NULL, NULL, NULL),
(332, 'Ashley O''Hara', 'Reed', '', '', NULL, NULL, NULL),
(333, 'David A.', 'Rettinger', '', '', NULL, NULL, NULL),
(334, 'Patricia E.', 'Reynolds', '', '', NULL, NULL, NULL),
(335, 'Gary N.', 'Richards', '', '', NULL, NULL, NULL),
(336, 'Lynne D.', 'Richardson', '', '', NULL, NULL, NULL),
(337, 'Jess M.', 'Rigelhaupt', '', '', NULL, NULL, NULL),
(338, 'Mary B.', 'Rigsby', '', '', NULL, NULL, NULL),
(339, 'Wayne', 'Riser', '', '', NULL, NULL, NULL),
(340, 'Brian R.', 'Rizzo', 'GEOG', '', NULL, NULL, NULL),
(341, 'Donna Kay', 'Roach', '', '', NULL, NULL, NULL),
(342, 'Guy B.', 'Roberts', '', '', NULL, NULL, NULL),
(343, 'Joanna M.', 'Robertson', '', '', NULL, NULL, NULL),
(344, 'Jeremy B.', 'Robinson', '', '', NULL, NULL, NULL),
(345, 'Warren G.', 'Rochelle', '', '', NULL, NULL, NULL),
(346, 'Joseph M.', 'Romero', 'CLPR', '', NULL, NULL, NULL),
(347, 'Terry L.', 'Rooker', '', '', NULL, NULL, NULL),
(348, 'Jeannine', 'Rosado', '', '', NULL, NULL, NULL),
(349, 'Marcel P.', 'Rotter', '', '', NULL, NULL, NULL),
(350, 'Farhang', 'Rouhani', '', '', NULL, NULL, NULL),
(351, 'Roxann M.', 'Rowley', '', '', NULL, NULL, NULL),
(352, 'Cedric B.', 'Rucker', '', '', NULL, NULL, NULL),
(353, 'Amanda B.', 'Rutstein', '', '', NULL, NULL, NULL),
(354, 'Robert S.', 'Rycroft', '', '', NULL, NULL, NULL),
(355, 'Jose A.', 'Sainz', '', '', NULL, NULL, NULL),
(356, 'Douglas W.', 'Sanford', '', '', NULL, NULL, NULL),
(357, 'Donald W.', 'Saunders', '', '', NULL, NULL, NULL),
(358, 'Mara N.', 'Scanlon', '', '', NULL, NULL, NULL),
(359, 'Mark E.', 'Scharf', '', '', NULL, NULL, NULL),
(360, 'Holly H.', 'Schiffrin', '', '', NULL, NULL, NULL),
(361, 'Timothy P.', 'Schilling', '', '', NULL, NULL, NULL),
(362, 'Debra J.', 'Schleef', '', '', NULL, NULL, NULL),
(363, 'Federico', 'Schneider', '', '', NULL, NULL, NULL),
(364, 'Donald R.', 'Schrader', '', '', NULL, NULL, NULL),
(365, 'Raymond B.', 'Scott', '', '', NULL, NULL, NULL),
(366, 'Sally S.', 'Scott', '', '', NULL, NULL, NULL),
(367, 'Douglas N.', 'Searcy', '', '', NULL, NULL, NULL),
(368, 'Allison N.', 'Seay', '', '', NULL, NULL, NULL),
(369, 'Teresa B.', 'Seay', '', '', NULL, NULL, NULL),
(370, 'Stephanie A.', 'Sebolt', '', '', NULL, NULL, NULL),
(371, 'Jason R.', 'Sellers', '', '', NULL, NULL, NULL),
(372, 'Justin R.', 'Shaffner', '', '', NULL, NULL, NULL),
(373, 'Charles M.', 'Sharpless', 'CHEM', '', NULL, NULL, NULL),
(374, 'Marie P.', 'Sheckels', '', '', NULL, NULL, NULL),
(375, 'David A.', 'Shields', '', '', NULL, NULL, NULL),
(376, 'Ranjit', 'Singh', '', '', NULL, NULL, NULL),
(377, 'Todd R.', 'Sipe', '', '', NULL, NULL, NULL),
(378, 'Kelli M.', 'Slunt', '', '', NULL, NULL, NULL),
(379, 'Andrea Livi', 'Smith', 'HISP', '', NULL, NULL, NULL),
(380, 'Constance F.', 'Smith', '', '', NULL, NULL, NULL),
(381, 'Sidney R.', 'Snitkin', '', '', NULL, NULL, NULL),
(382, 'Mark L.', 'Snyder', 'MUHL', '', NULL, NULL, NULL),
(383, 'Jeffrey L.', 'Solka', '', '', NULL, NULL, NULL),
(384, 'David S.', 'Soper', 'PHYD', '', NULL, NULL, NULL),
(385, 'Michael G.', 'Spencer', '', '', NULL, NULL, NULL),
(386, 'Mukesh', 'Srivastava', '', '', NULL, NULL, NULL),
(387, 'A.', 'Staff', '', '', NULL, NULL, NULL),
(388, 'Stephen P.', 'Stageberg', '', '', NULL, NULL, NULL),
(389, 'William', 'Stahlman', '', '', NULL, NULL, NULL),
(390, 'Gary W.', 'Stanton', '', '', NULL, NULL, NULL),
(391, 'Hilary E.', 'Stebbins', '', '', NULL, NULL, NULL),
(392, 'Debra C.', 'Steckler', '', '', NULL, NULL, NULL),
(393, 'Timothy J.', 'Stoffer', '', '', NULL, NULL, NULL),
(394, 'Ghislaine M. Storr', 'Burks', '', '', NULL, NULL, NULL),
(395, 'Robert J.', 'Strassheim', '', '', NULL, NULL, NULL),
(396, 'M. Gregg', 'Stull', '', '', NULL, NULL, NULL),
(397, 'Suzanne', 'Sumner', 'MATH', '', NULL, NULL, NULL),
(398, 'Lavona L.', 'Suppes', '', '', NULL, NULL, NULL),
(399, 'Thomas K.', 'Swift', '', '', NULL, NULL, NULL),
(400, 'Melanie D.', 'Szulczewski', '', '', NULL, NULL, NULL),
(401, 'Robert L.', 'Taft', '', '', NULL, NULL, NULL),
(402, 'Hongbo', 'Tang', '', '', NULL, NULL, NULL),
(403, 'Jane L.', 'Tavernier', '', '', NULL, NULL, NULL),
(404, 'Natalie M.', 'Tenner', '', '', NULL, NULL, NULL),
(405, 'Neil E.', 'Tibert', 'EESC', '', NULL, NULL, NULL),
(406, 'Margaret Anne', 'Timpano', '', '', NULL, NULL, NULL),
(407, 'Donald N.', 'Todaro', '', '', NULL, NULL, NULL),
(408, 'Abbie M.', 'Tomba', 'BIOL', '', NULL, NULL, NULL),
(409, 'David M.', 'Toth', '', '', NULL, NULL, NULL),
(410, 'Matthew K.', 'Troy', '', '', NULL, NULL, NULL),
(411, 'Cristina', 'Turdean', '', '', NULL, NULL, NULL),
(412, 'Clarence W.', 'Tweedy', '', '', NULL, NULL, NULL),
(413, 'Leslie J.', 'Tyler', '', '', NULL, NULL, NULL),
(414, 'Jacob E.', 'Urbanski', '', '', NULL, NULL, NULL),
(415, 'Craig R.', 'Vasey', '', '', NULL, NULL, NULL),
(416, 'Elizabeth W.', 'Wade', '', '', NULL, NULL, NULL),
(417, 'Catherine K.', 'Walker', '', '', NULL, NULL, NULL),
(418, 'Jeffrey P.', 'Walker', '', '', NULL, NULL, NULL),
(419, 'Lloyd Daniel', 'Walker', '', '', NULL, NULL, NULL),
(420, 'Edmund C.', 'Walsh', '', '', NULL, NULL, NULL),
(421, 'Catherine J.', 'Ward', '', '', NULL, NULL, NULL),
(422, 'Duncan R.', 'Warner', '', '', NULL, NULL, NULL),
(423, 'Dwana L.', 'Waugh', '', '', NULL, NULL, NULL),
(424, 'Marie A.', 'Wellington', 'MDFL', '', NULL, NULL, NULL),
(425, 'Zachary N.', 'Whalen', '', '', NULL, NULL, NULL),
(426, 'Charles E.', 'Whipkey', '', '', NULL, NULL, NULL),
(427, 'Judith B.', 'Whitmore', '', '', NULL, NULL, NULL),
(428, 'Werner', 'Wieland', '', '', NULL, NULL, NULL),
(429, 'Justin A.', 'Wilkes', '', '', NULL, NULL, NULL),
(430, 'Emily A.', 'Williams', '', '', NULL, NULL, NULL),
(431, 'Alpana', 'Wilson', '', '', NULL, NULL, NULL),
(432, 'Richard D.', 'Wilson', '', '', NULL, NULL, NULL),
(433, 'Christopher A.', 'Wingert', '', '', NULL, NULL, NULL),
(434, 'Lisa S.', 'Withers', '', '', NULL, NULL, NULL),
(435, 'Stephen M.', 'Wolkoff', '', '', NULL, NULL, NULL),
(436, 'Rodrick', 'Wood', '', '', NULL, NULL, NULL),
(437, 'Grant R.', 'Woodwell', 'EESC', '', NULL, NULL, NULL),
(438, 'Esther Lee', 'Yook', '', '', NULL, NULL, NULL),
(439, 'Jean R.', 'Young', '', '', NULL, NULL, NULL),
(440, 'Anne A. Serio', 'Younica', '', '', NULL, NULL, NULL),
(441, 'Christl E.', 'Zaccagnino', '', '', NULL, NULL, NULL),
(442, 'Ronald A.', 'Zacharski', 'CPSC', '', NULL, NULL, NULL),
(443, 'Xiaofeng', 'Zhao', '', '', NULL, NULL, NULL),
(444, 'Deborah L.', 'Zies', '', '', NULL, NULL, '2015'),
(445, 'David W.', 'Cain', 'CLPR', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE IF NOT EXISTS `positions` (
  `positionPK_id` int(11) NOT NULL AUTO_INCREMENT,
  `positionFK_id` int(11) DEFAULT NULL,
  `facultyFK_id` int(11) DEFAULT NULL,
  `posName` varchar(50) DEFAULT NULL,
  `posVacancy` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`positionPK_id`),
  KEY `positionFK_id` (`positionFK_id`),
  KEY `facultyFK_id` (`facultyFK_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=156 ;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`positionPK_id`, `positionFK_id`, `facultyFK_id`, `posName`, `posVacancy`) VALUES
(1, 1, 216, 'Chair', NULL),
(2, 1, 239, 'Secretary', NULL),
(3, 1, 124, 'member', NULL),
(4, 1, 337, 'member', NULL),
(5, 1, 445, 'member', NULL),
(6, 1, 287, 'member', NULL),
(7, 2, 234, 'Chair', NULL),
(8, 2, 55, 'member', NULL),
(9, 2, 99, 'member', NULL),
(10, 2, 144, 'member', NULL),
(11, 2, 151, 'member', NULL),
(12, 2, 382, 'member', NULL),
(14, 3, 154, 'Chair', NULL),
(15, 3, 9, 'member', NULL),
(16, 3, 250, 'member', NULL),
(17, 3, 222, 'Secretary', NULL),
(18, 3, 300, 'member', NULL),
(19, 3, 324, 'member', NULL),
(20, 4, 139, 'Chair', NULL),
(21, 4, 40, 'member', NULL),
(22, 4, 60, 'member', NULL),
(23, 4, 165, 'member', NULL),
(24, 4, 442, 'member', NULL),
(25, 5, 201, 'Chair', NULL),
(26, 5, 253, 'Secretary', NULL),
(27, 5, 135, 'member', NULL),
(28, 5, 212, 'member', NULL),
(29, 5, 220, 'member', NULL),
(30, 5, 411, 'member', NULL),
(31, 5, 437, 'member', NULL),
(32, 6, 444, 'Chair', '2015'),
(33, 6, 85, 'Secretary', '2015'),
(34, 6, 17, 'member', '2013'),
(35, 6, 131, 'member', '2013'),
(36, 6, 270, 'member', '2014'),
(38, 7, 318, 'President', NULL),
(39, 7, 331, 'President Elect', NULL),
(40, 7, 397, 'Secretary', NULL),
(41, 7, 224, 'Parlimentarian', NULL),
(42, 7, 100, 'Senator at Large', NULL),
(43, 7, 424, 'Senator at Large', NULL),
(44, 7, 88, 'Department Senator Art & Art History', NULL),
(45, 7, 384, 'Department Senator Athletics, Health & Physical Ed', NULL),
(46, 7, 408, 'Department Senator Biological Sciences', NULL),
(47, 7, 373, 'Department Senator Chemistry', NULL),
(48, 7, 346, 'Department Senator Classics, Philosophy, & Religio', NULL),
(49, 7, 13, 'Department Senator Computer Science', NULL),
(50, 7, 405, 'Department Senator Earth & Environmental Sciences', NULL),
(51, 7, 331, 'Department Senator Economics', NULL),
(52, 7, 328, 'Department Senator English, Linguistics, & Communi', NULL),
(53, 7, 340, 'Department Senator Geography', NULL),
(54, 7, 379, 'Department Senator Historic Preservation', NULL),
(55, 7, 104, 'Department Senator History & American Studies', NULL),
(56, 7, 224, 'Department Senator Mathematics', NULL),
(57, 7, 219, 'Department Senator Modern Foreign Languages', NULL),
(58, 7, 235, 'Department Senator Music', NULL),
(59, 7, NULL, 'Department Senator Physics', NULL),
(60, 7, 376, 'Department Senator Political Science & Internation', NULL),
(61, 7, 231, 'Department Senator Psychology', NULL),
(62, 7, 204, 'Department Senator Sociology & Anthropology', NULL),
(63, 7, 179, 'Department Senator Theater & Dance', NULL),
(65, 8, NULL, 'Chair', NULL),
(66, 8, NULL, 'Secretary', NULL),
(67, 8, NULL, 'member', NULL),
(68, 8, NULL, 'member', NULL),
(69, 8, NULL, 'member', NULL),
(70, 9, NULL, 'Director', NULL),
(71, 9, NULL, 'member', NULL),
(72, 9, NULL, 'member', NULL),
(73, 9, NULL, 'member', NULL),
(74, 9, NULL, 'member', NULL),
(75, 9, NULL, 'member', NULL),
(76, 10, NULL, '3 year member', NULL),
(77, 10, NULL, '3 year member', NULL),
(78, 10, NULL, '2 year member', NULL),
(79, 10, NULL, '2 year member', NULL),
(80, 10, NULL, '1 year member', NULL),
(81, 11, NULL, 'Chair', NULL),
(82, 11, NULL, 'member', NULL),
(83, 11, NULL, 'member', NULL),
(84, 11, NULL, 'member', NULL),
(85, 11, NULL, 'member', NULL),
(86, 11, NULL, 'member', NULL),
(87, 11, NULL, 'member', NULL),
(88, 11, NULL, 'member', NULL),
(89, 12, NULL, 'Chair', NULL),
(90, 12, NULL, 'External member', NULL),
(91, 12, NULL, 'member', NULL),
(92, 12, NULL, 'member', NULL),
(93, 12, NULL, 'member', NULL),
(94, 12, NULL, 'member', NULL),
(95, 12, NULL, 'member', NULL),
(96, 12, NULL, 'member', NULL),
(97, 13, NULL, '3 year member', NULL),
(98, 13, NULL, '3 year member', NULL),
(99, 13, NULL, '2 year member', NULL),
(100, 13, NULL, '2 year member', NULL),
(101, 13, NULL, '1 year member', NULL),
(102, 14, NULL, 'Chair', NULL),
(103, 14, NULL, 'member', NULL),
(104, 14, NULL, 'member', NULL),
(105, 14, NULL, 'member', NULL),
(106, 14, NULL, 'member', NULL),
(107, 14, NULL, 'member', NULL),
(108, 15, NULL, '3 year member', NULL),
(109, 15, NULL, '3 year member', NULL),
(110, 15, NULL, '2 year member', NULL),
(111, 15, NULL, '2 year member', NULL),
(112, 15, NULL, '1 year member', NULL),
(113, 16, NULL, '3 year member', NULL),
(114, 16, NULL, '3 year member', NULL),
(115, 16, NULL, '3 year member', NULL),
(116, 16, NULL, '2 year member', NULL),
(117, 16, NULL, '2 year member', NULL),
(118, 16, NULL, '2 year member', NULL),
(119, 16, NULL, '1 year member', NULL),
(120, 17, NULL, 'Chair', NULL),
(121, 17, NULL, 'Secretary', NULL),
(122, 17, NULL, 'member', NULL),
(123, 17, NULL, 'member', NULL),
(124, 17, NULL, 'member', NULL),
(125, 17, NULL, 'member', NULL),
(126, 18, NULL, '3 year member', NULL),
(127, 18, NULL, '3 year member', NULL),
(128, 18, NULL, '2 year member', NULL),
(129, 18, NULL, '2 year member', NULL),
(130, 18, NULL, '1 year member', NULL),
(131, 18, NULL, '1 year member', NULL),
(132, 19, NULL, '3 year member', NULL),
(133, 19, NULL, '2 year member', NULL),
(134, 19, NULL, '2 year member', NULL),
(135, 19, NULL, '1 year member', NULL),
(136, 19, NULL, '1 year member', NULL),
(137, 20, NULL, '3 year member', NULL),
(138, 20, NULL, '3 year member', NULL),
(139, 20, NULL, '2 year member', NULL),
(140, 20, NULL, '2 year member', NULL),
(141, 20, NULL, '1 year member', NULL),
(142, 21, NULL, '3 year member', NULL),
(143, 21, NULL, '2 year member', NULL),
(144, 21, NULL, '2 year member', NULL),
(145, 21, NULL, '1 year member', NULL),
(146, 21, NULL, '1 year member', NULL),
(147, 22, NULL, '1 year member', NULL),
(148, 22, NULL, '1 year member', NULL),
(149, 22, NULL, '1 year member', NULL),
(150, 22, NULL, 'member', NULL),
(151, 23, NULL, '3 year member', NULL),
(152, 23, NULL, '3 year member', NULL),
(153, 23, NULL, '2 year member', NULL),
(154, 23, NULL, '2 year member', NULL),
(155, 23, NULL, '1 year member', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `positions_ibfk_1` FOREIGN KEY (`positionFK_id`) REFERENCES `committees` (`id`),
  ADD CONSTRAINT `positions_ibfk_2` FOREIGN KEY (`facultyFK_id`) REFERENCES `members` (`memberPK_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
