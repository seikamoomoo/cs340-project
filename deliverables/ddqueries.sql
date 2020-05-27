CREATE TABLE `Users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Posts` (
  `postID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `timeCreated` datetime NOT NULL DEFAULT(sysdate()),
  `sound` nvarchar(260) NOT NULL,
  `graphic` nvarchar(260) NOT NULL,
  `tags` varchar(255),
  `embedPostID` int(11),
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`postID`),
  INDEX (`userID`),
  FOREIGN KEY (`userID`) REFERENCES `Users`(`userID`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`embedPostID`) REFERENCES `Posts`(`postID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Comments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `postID` int(11) NOT NULL,
  `userID` int(11),
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`commentID`),
  INDEX (`userID`),
  INDEX (`postID`),
  FOREIGN KEY (`userID`) REFERENCES `Users`(`userID`) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (`postID`) REFERENCES `Posts`(`postID`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `ContentFeeds` (
  `feedID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `interests` varchar(255),
  PRIMARY KEY (`feedID`),
  INDEX (`userID`),
  FOREIGN KEY (`userID`) REFERENCES `Users`(`userID`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Posts_Feeds` (
  `postID` int(11) NOT NULL,
  `feedID` int(11) NOT NULL,
  PRIMARY KEY (`postID`, `feedID`),
  FOREIGN KEY (`feedID`) REFERENCES `ContentFeeds`(`feedID`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`postID`) REFERENCES `Posts`(`postID`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO Users(username, password, email) VALUES
    ('Emma','12345','edgardo.greenfelder@kohler.com'),
    ('Olivia','123456','ibartell@hotmail.com'),
    ('Ava','123456789','max.walter@gutkowski.org'),
    ('Isabella','test1','sophia32@hotmail.com'),
    ('Sophia','password','osinski.sage@bahringer.com'),
    ('Charlotte','12345678','rosalia.gulgowski@ritchie.com'),
    ('Mia','zinch','zgottlieb@frami.com'),
    ('Amelia','g_czechout','hoeger.deanna@turner.biz'),
    ('Harper','asdf','afay@schamberger.org'),
    ('Evelyn','qwerty','brown.bell@hotmail.com'),
    ('Abigail','1234567890','fcassin@jacobi.com'),
    ('Emily','1234567','nicolas.jake@gmail.com'),
    ('Elizabeth','Aa123456.','kayden65@yahoo.com'),
    ('Mila','iloveyou','kathryne.klocko@reinger.com'),
    ('Ella','1234','edgar.donnelly@hotmail.com'),
    ('Avery','abc123','madisyn62@mills.com'),
    ('Sofia','111111','sally.spencer@gmail.com'),
    ('Camila','123123','monte25@feest.com'),
    ('Aria','dubsmash','celia.veum@nikolaus.biz'),
    ('Scarlett','test','rgoldner@schimmel.biz'),
    ('Victoria','princess','lbarrows@yahoo.com'),
    ('Madison','qwertyuiop','bill.bernier@ernser.com'),
    ('Luna','sunshine','lula41@gleason.com'),
    ('Grace','BvtTest123','benton28@gmail.com'),
    ('Chloe','11111','hill.vidal@metz.biz'),
    ('Penelope','ashley','tkilback@king.com'),
    ('Layla','00000','jerrod.greenfelder@yahoo.com'),
    ('Riley','000000','teagan21@hotmail.com'),
    ('Zoey','password1','hill.jo@yahoo.com'),
    ('Nora','monkey','lula41@balistreri.net'),
    ('Lily','livetest','dhudson@konopelski.info'),
    ('Eleanor','55555','brad.oreilly@crist.biz'),
    ('Hannah','soccer','terry.kendall@schmeler.com'),
    ('Lillian','charlie','labadie.jaime@shanahan.org'),
    ('Addison','asdfghjkl','hkrajcik@hotmail.com'),
    ('Aubrey','654321','philip67@gmail.com'),
    ('Ellie','family','korbin78@gmail.com'),
    ('Stella','michael','gkoch@cole.biz'),
    ('Natalie','123321','efrain05@bergnaum.info'),
    ('Zoe','football','fschmeler@spencer.org'),
    ('Leah','baseball','nwilderman@kautzer.com'),
    ('Hazel','q1w2e3r4t5y6','fkohler@borer.com'),
    ('Violet','nicole','hhayes@gmail.com'),
    ('Aurora','jessica','carter.rollin@yahoo.com'),
    ('Savannah','purple','rrolfson@mcclure.com'),
    ('Audrey','shadow','bartell.laron@daugherty.com'),
    ('Brooklyn','hannah','lquigley@runolfsdottir.com'),
    ('Bella','chocolate','will.claudie@keebler.com'),
    ('Claire','michelle','sabina28@hotmail.com'),
    ('Skylar','daniel','elna39@goyette.com'),
    ('Liam','maggie','frederique.hahn@hotmail.com'),
    ('Noah','qwerty123','bartell.teresa@kling.info'),
    ('William','hello','fletcher61@conn.com'),
    ('James','112233','medhurst.devin@gmail.com'),
    ('Oliver','jordan','ruthie.tromp@gmail.com'),
    ('Benjamin','tigger','pcremin@hotmail.com'),
    ('Elijah','666666','gerlach.darryl@gleason.info'),
    ('Lucas','987654321','hegmann.loraine@gislason.biz'),
    ('Mason','superman','jennings.ledner@champlin.net'),
    ('Logan','12345678910','bmurphy@hotmail.com'),
    ('Alexander','summer','mcdermott.odie@hotmail.com'),
    ('Ethan','1q2w3e4r5t','schmeler.louisa@hotmail.com'),
    ('Jacob','fitness','joseph.rosenbaum@dubuque.biz'),
    ('Michael','bailey','boberbrunner@sporer.com'),
    ('Daniel','zxcvbnm','renner.monique@stoltenberg.com'),
    ('Henry','fuckyou','marley.fisher@collier.com'),
    ('Jackson','121212','maybell.mitchell@block.com'),
    ('Sebastian','buster','hellen46@gmail.com'),
    ('Aiden','butterfly','jkemmer@hotmail.com'),
    ('Matthew','dragon','bednar.rachelle@nader.com'),
    ('Samuel','jennifer','melvin.hayes@gmail.com'),
    ('David','amanda','cary.block@hotmail.com'),
    ('Joseph','justin','swift.tomasa@hotmail.com'),
    ('Carter','cookie','kenneth88@williamson.com'),
    ('Owen','basketball','boehm.claudia@murray.biz'),
    ('Wyatt','shopping','xbradtke@hagenes.com'),
    ('John','pepper','zthompson@volkman.com'),
    ('Jack','joshua','bartoletti.jewel@bogisich.biz'),
    ('Luke','hunter','keon.ullrich@barton.com'),
    ('Jayden','ginger','lehner.reese@schumm.com'),
    ('Dylan','matthew','ljakubowski@hotmail.com'),
    ('Grayson','abcd1234','stamm.mavis@lesch.com'),
    ('Levi','taylor','gutkowski.zaria@yahoo.com'),
    ('Isaac','samantha','bins.kyle@corwin.com'),
    ('Gabriel','whatever','rowe.isidro@parisian.info'),
    ('Julian','andrew','dlind@gerhold.info'),
    ('Mateo','1qaz2wsx3edc','sarah61@gmail.com'),
    ('Anthony','thomas','cassin.tomasa@gmail.com'),
    ('Jaxon','jasmine','maribel.reynolds@hotmail.com'),
    ('Lincoln','animoto','pedro15@heathcote.info'),
    ('Joshua','madison','pauline.lang@yahoo.com'),
    ('Christopher','0987654321','royce.mann@yahoo.com'),
    ('Andrew','54321','gutmann.mallie@yahoo.com'),
    ('Theodore','flower','udoyle@mccullough.info'),
    ('Caleb','Password','rrau@yahoo.com'),
    ('Ryan','maria','bruen.bettye@halvorson.info'),
    ('Asher','babygirl','funk.clark@cole.com'),
    ('Nathan','lovely','linda.treutel@gmail.com'),
    ('Thomas','sophie','troy64@gmail.com'),
    ('Leo','Chegg123','durgan.barbara@hotmail.com');

INSERT INTO Posts(userID, sound, graphic, title) VALUES
    (44,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','1. Sugar, Sugar - The Archies'),
    (41,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','2. Aquarius / Let the Sunshine In - The Fifth Dimension'),
    (37,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','3. I Can''t Get Next to You - The Temptations'),
    (34,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','4. Honky Tonk Women - The Rolling Stones'),
    (65,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','5. Everyday People - Sly and The Family Stone'),
    (47,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','6. Dizzy - Tommy Roe'),
    (43,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','7. Hot Fun In the Summertime - Sly and The Family Stone'),
    (71,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','8. (It Looks Like) I''ll Never Fall In Love Again - Tom Jones'),
    (90,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','9. Build Me Up Buttercup - The Foundations'),
    (87,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','10. Crimson and Clover - Tommy James and The Shondells'),
    (71,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','11. One - Three Dog Night'),
    (68,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','12. Crystal Blue Persuasion - Tommy James and The Shondells'),
    (50,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','13. Hair - The Cowsills'),
    (9,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','14. Too Busy Thinking About My Baby - Marvin Gaye'),
    (69,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','15. Love Theme from "Romeo and Juliet" - Henry Mancini and His Orchestra'),
    (69,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','16. Get Together - The Youngbloods'),
    (89,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','17. Grazing In the Grass - The Friends Of Distinction'),
    (95,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','18. Suspicious Minds - Elvis Presley'),
    (95,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','19. Proud Mary - Creedence Clearwater Revival'),
    (35,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','20. What Does It Take (To Win Your Love) - Jr. Walker & The All Stars'),
    (95,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','21. It''s Your Thing - The Isley Brothers'),
    (86,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','22. Sweet Caroline - Neil Diamond'),
    (67,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','23. Jean - Oliver'),
    (38,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','24. Bad Moon Rising - Creedence Clearwater Revival'),
    (10,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','25. Get Back - The Beatles'),
    (24,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','26. In the Year 2525 (Exordium & Terminus) - Zager and Evans'),
    (67,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','27. Spinning Wheel - Blood, Sweat and Tears'),
    (61,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','28. Baby, I Love You - Andy Kim'),
    (85,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','29. Going In Circles - The Friends Of Distinction'),
    (23,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','30. Hurt So Bad - The Lettermen'),
    (65,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','31. Green River - Creedence Clearwater Revival'),
    (13,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','32. My Cherie Amour - Stevie Wonder'),
    (34,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','33. Easy to Be Hard - Three Dog Night'),
    (61,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','34. Baby It''s You - Smith'),
    (62,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','35. In the Ghetto - Elvis Presley'),
    (75,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','36. A Boy Named Sue - Johnny Cash'),
    (38,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','37. Baby, Baby Don''t Cry - Smokey Robinson and The Miracles'),
    (36,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','38. Only the Strong Survive - Jerry Butler'),
    (69,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','39. Time of the Season - The Zombies'),
    (9,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','40. Wedding Bell Blues - The Fifth Dimension'),
    (83,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','41. Little Woman - Bobby Sherman'),
    (66,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','42. Love Can Make You Happy - Mercy'),
    (91,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','43. Good Morning Starshine - Oliver'),
    (34,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','44. These Eyes - The Guess Who'),
    (8,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','45. You''ve Made Me So Very Happy - Blood, Sweat and Tears'),
    (85,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','46. Put a Little Love In Your Heart - Jackie DeShannon'),
    (82,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','47. Do Your Thing, The Watts 103rd Street Rhythm Band'),
    (33,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','48. I''d Wait a Million Years - The Grass Roots'),
    (28,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','49. Touch Me - The Doors'),
    (78,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','50. More Today Than Yesterday - The Spiral Starecase'),
    (49,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','51. I''ve Gotta Be Me - Sammy Davis Jr.'),
    (17,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','52. Lay, Lady, Lay - Bob Dylan'),
    (82,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','53. Atlantis - Donovan'),
    (24,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','54. Traces - Dennis Yost and The Classics IV'),
    (9,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','55. It''s Getting Better - Mama Cass Elliot'),
    (4,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','56. This Magic Moment - Jay and The Americans'),
    (77,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','57. Runaway Child, Running Wild - The Temptations'),
    (85,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','58. Hawaii Five-O - The Ventures'),
    (10,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','59. Galveston - Glen Campbell'),
    (15,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','60. I''m Gonna Make You Mine - Lou Christie'),
    (36,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','61. Gitarzan - Ray Stevens'),
    (34,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','62. Can I Change My Mind - Tyrone Davis'),
    (80,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','63. Time Is Tight - Booker T and The MG''s'),
    (68,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','64. This Girl''s In Love With You - Dionne Warwick'),
    (37,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','65. Color Him Father - The Winstons'),
    (59,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','66. Black Pearl - Sonny Charles and The Checkmates, Ltd.'),
    (35,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','67. Indian Giver - The 1910 Fruitgum Company'),
    (100,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','68. Mother Popcorn, Pt. 1 - James Brown'),
    (63,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','69. Twenty Five Miles - Edwin Starr'),
    (73,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','70. Things I''d Like To Say - New Colony Six'),
    (90,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','71. When I Die - Motherlode'),
    (73,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','72. That''s the Way Love Is - Marvin Gaye'),
    (44,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','73. Everybody''s Talkin'' (From "Midnight Cowboy") - Nilsson'),
    (100,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','74. Worst That Could Happen - The Brooklyn Bridge'),
    (65,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','75. The Chokin'' Kind - Joe Simon'),
    (45,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','76. Smile a Little Smile for Me - The Flying Machine'),
    (18,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','77. Polk Salad Annie - Tony Joe White'),
    (83,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','78. Ruby, Don''t Take Your Love to Town - Kenny Rogers and The First Edition'),
    (96,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','79. Games People Play - Joe South'),
    (21,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','80. You Showed Me - The Turtles'),
    (49,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','81. Tracy - The Cuff Links'),
    (53,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','82. Oh, What a Night - The Dells'),
    (3,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','83. Something - The Beatles'),
    (42,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','84. This Girl is a Woman Now - Gary Puckett and The Union Gap'),
    (22,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','85. Come Together - The Beatles'),
    (33,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','86. Ramblin'' Gamblin'' Man - The Bob Seger System'),
    (35,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','87. I''m Gonna Make You Love Me - Diana Ross and The Supremes'),
    (4,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','88. I Heard It Through the Grapevine - Marvin Gaye'),
    (6,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','89. Gimme Gimme Good Lovin'' - Crazy Elephant'),
    (80,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','90. Hang ''Em High - Booker T and The MG''s'),
    (8,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','91. Your Good Thing (Is About to End) - Lou Rawls'),
    (36,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','92. Baby, I''m for Real - The Originals'),
    (33,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','93. Oh Happy Day - Edwin Hawkins Singers'),
    (99,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','94. Love Me Tonight - Tom Jones'),
    (69,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','95. Mr. Sun, Mr. Moon - Paul Revere and The Raiders'),
    (34,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','96. Laughing - The Guess Who'),
    (59,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','97. My Whole World Ended (The Moment You Left Me) - David Ruffin'),
    (3,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','98. Soul Deep - The Box Tops'),
    (73,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','99. Hooked On a Feeling - B.J. Thomas'),
    (69,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','100. Sweet Cream Ladies, Forward March - The Box Tops');

INSERT INTO Comments(postID, userID, text) VALUES
    (107,87,'a'),
    (121,57,'about'),
    (169,30,'all'),
    (195,58,'also'),
    (131,39,'and'),
    (151,15,'as'),
    (153,92,'at'),
    (141,99,'be'),
    (144,50,'because'),
    (190,78,'but'),
    (146,46,'by'),
    (135,53,'can'),
    (106,55,'come'),
    (151,16,'could'),
    (187,85,'day'),
    (147,61,'do'),
    (142,93,'even'),
    (165,55,'find'),
    (189,96,'first'),
    (199,70,'for'),
    (106,76,'from'),
    (114,9,'get'),
    (149,70,'give'),
    (134,43,'go'),
    (125,21,'have'),
    (121,91,'he'),
    (174,21,'her'),
    (116,21,'here'),
    (163,89,'him'),
    (145,69,'his'),
    (170,30,'how'),
    (175,14,'I'),
    (185,3,'if'),
    (125,81,'in'),
    (184,62,'into'),
    (198,55,'it'),
    (103,42,'its'),
    (144,30,'just'),
    (104,3,'know'),
    (103,49,'like'),
    (135,44,'look'),
    (134,27,'make'),
    (149,6,'man'),
    (161,85,'many'),
    (123,57,'me'),
    (127,51,'more'),
    (117,66,'my'),
    (174,9,'new'),
    (177,13,'no'),
    (113,37,'not'),
    (161,52,'now'),
    (191,67,'of'),
    (135,31,'on'),
    (191,17,'one'),
    (109,54,'only'),
    (132,76,'or'),
    (174,69,'other'),
    (102,75,'our'),
    (155,49,'out'),
    (158,74,'people'),
    (105,66,'say'),
    (166,91,'see'),
    (192,72,'she'),
    (110,41,'so'),
    (130,64,'some'),
    (106,88,'take'),
    (157,54,'tell'),
    (186,34,'than'),
    (151,88,'that'),
    (190,90,'the'),
    (196,64,'their'),
    (146,42,'them'),
    (162,35,'then'),
    (140,83,'there'),
    (198,63,'these'),
    (160,59,'they'),
    (148,89,'thing'),
    (191,15,'think'),
    (134,66,'this'),
    (135,51,'those'),
    (199,67,'time'),
    (190,84,'to'),
    (104,57,'two'),
    (194,36,'up'),
    (184,64,'use'),
    (187,3,'very'),
    (185,13,'want'),
    (183,29,'way'),
    (163,57,'we'),
    (129,35,'well'),
    (131,27,'what'),
    (138,8,'when'),
    (125,73,'which'),
    (183,43,'who'),
    (154,37,'will'),
    (121,3,'with'),
    (176,41,'would'),
    (146,92,'year'),
    (107,10,'you'),
    (143,16,'your');

INSERT INTO ContentFeeds(userID, interests) VALUES
    (11,'day'),
    (53,'this'),
    (74,'also'),
    (81,'of'),
    (74,'your'),
    (55,'only'),
    (45,'she'),
    (99,'use'),
    (45,'its'),
    (40,'tell'),
    (83,'but'),
    (21,'their'),
    (30,'by'),
    (93,'come'),
    (11,'on'),
    (71,'as'),
    (60,'them'),
    (27,'he'),
    (30,'we'),
    (82,'would'),
    (89,'when'),
    (96,'out'),
    (47,'her'),
    (51,'man'),
    (25,'so'),
    (5,'first'),
    (2,'some'),
    (31,'see'),
    (25,'for'),
    (34,'a'),
    (50,'do'),
    (83,'want'),
    (83,'other'),
    (96,'about'),
    (11,'how'),
    (80,'and'),
    (47,'say'),
    (39,'it'),
    (30,'here'),
    (11,'way'),
    (38,'well'),
    (69,'look'),
    (84,'if'),
    (13,'people'),
    (9,'like'),
    (95,'could'),
    (39,'to'),
    (69,'what'),
    (42,'not'),
    (15,'me'),
    (36,'more'),
    (98,'one'),
    (30,'know'),
    (27,'give'),
    (88,'about'),
    (20,'how'),
    (69,'and'),
    (56,'say'),
    (54,'it'),
    (85,'here'),
    (80,'way'),
    (9,'well'),
    (68,'look'),
    (72,'if'),
    (55,'people'),
    (48,'him'),
    (8,'many'),
    (64,'two'),
    (91,'because'),
    (36,'at'),
    (7,'get'),
    (60,'all'),
    (44,'time'),
    (79,'about'),
    (59,'how'),
    (58,'and'),
    (69,'say'),
    (18,'it'),
    (46,'here'),
    (71,'way'),
    (77,'well'),
    (5,'look'),
    (24,'if'),
    (75,'people'),
    (37,'that'),
    (80,'very'),
    (20,'my'),
    (52,'can'),
    (14,'even'),
    (53,'no'),
    (21,'I'),
    (27,'now'),
    (20,'be'),
    (6,'who'),
    (56,'our'),
    (35,'year'),
    (59,'which'),
    (94,'find'),
    (8,'have'),
    (96,'new');

INSERT INTO Post_Feeds(postID, feedID) VALUES
    (133,213),
    (101,220),
    (172,247),
    (164,226),
    (156,273),
    (178,280),
    (170,269),
    (177,284),
    (146,242),
    (174,296),
    (141,258),
    (132,217),
    (120,241),
    (135,225),
    (158,230),
    (176,262),
    (185,255),
    (136,280),
    (178,257),
    (189,255),
    (196,274),
    (147,201),
    (154,264),
    (127,209),
    (162,270),
    (187,268),
    (174,242),
    (173,250),
    (191,286),
    (127,272),
    (164,274),
    (154,289),
    (184,230),
    (133,231),
    (173,264),
    (105,286),
    (109,266),
    (132,203),
    (137,263),
    (116,232),
    (181,206),
    (180,223),
    (189,240),
    (166,216),
    (117,261),
    (177,230),
    (116,247),
    (117,241),
    (200,232),
    (106,277),
    (128,248),
    (140,270),
    (178,247),
    (136,289),
    (132,271),
    (170,281),
    (187,230),
    (124,291),
    (117,257),
    (182,238),
    (119,234),
    (133,233),
    (198,217),
    (152,285),
    (183,215),
    (102,211),
    (151,250),
    (113,258),
    (114,233),
    (137,244),
    (169,249),
    (182,238),
    (187,215),
    (121,264),
    (189,263),
    (143,286),
    (119,204),
    (112,241),
    (161,263),
    (135,246),
    (167,231),
    (178,228),
    (162,236),
    (180,268),
    (190,248),
    (184,210),
    (168,219),
    (148,278),
    (125,209),
    (178,293),
    (181,251),
    (165,216),
    (152,210),
    (134,232),
    (121,266),
    (193,252),
    (143,220),
    (146,286),
    (158,213),
    (145,258);
