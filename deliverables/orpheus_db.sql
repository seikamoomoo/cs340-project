DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Posts`;
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

DROP TABLE IF EXISTS `Comments`;
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

DROP TABLE IF EXISTS `ContentFeeds`;
CREATE TABLE `ContentFeeds` (
  `feedID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `interests` varchar(255),
  PRIMARY KEY (`feedID`),
  INDEX (`userID`),
  FOREIGN KEY (`userID`) REFERENCES `Users`(`userID`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Posts_Feeds`;
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
    ('Ryan','maria','bruen.bettye@halvorson.info'),
    ('Asher','babygirl','funk.clark@cole.com'),
    ('Nathan','lovely','linda.treutel@gmail.com'),
    ('Thomas','sophie','troy64@gmail.com'),
    ('Leo','Chegg123','durgan.barbara@hotmail.com');

INSERT INTO Posts(userID, sound, graphic, title) VALUES
    (1,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','1. Sugar, Sugar - The Archies'),
    (9,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','2. Aquarius / Let the Sunshine In - The Fifth Dimension'),
    (2,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','3. I Can''t Get Next to You - The Temptations'),
    (2,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','4. Honky Tonk Women - The Rolling Stones'),
    (6,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','5. Everyday People - Sly and The Family Stone'),
    (4,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','6. Dizzy - Tommy Roe'),
    (4,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','7. Hot Fun In the Summertime - Sly and The Family Stone'),
    (7,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','8. (It Looks Like) I''ll Never Fall In Love Again - Tom Jones'),
    (9,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','9. Build Me Up Buttercup - The Foundations'),
    (8,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','10. Crimson and Clover - Tommy James and The Shondells'),
    (7,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','11. One - Three Dog Night'),
    (6,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','12. Crystal Blue Persuasion - Tommy James and The Shondells'),
    (5,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','13. Hair - The Cowsills'),
    (9,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','14. Too Busy Thinking About My Baby - Marvin Gaye'),
    (6,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','15. Love Theme from "Romeo and Juliet" - Henry Mancini and His Orchestra'),
    (6,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','16. Get Together - The Youngbloods'),
    (8,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','17. Grazing In the Grass - The Friends Of Distinction'),
    (9,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','18. Suspicious Minds - Elvis Presley'),
    (9,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','19. Proud Mary - Creedence Clearwater Revival'),
    (3,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','20. What Does It Take (To Win Your Love) - Jr. Walker & The All Stars'),
    (95,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','21. It''s Your Thing - The Isley Brothers'),
    (5,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','22. Sweet Caroline - Neil Diamond'),
    (6,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','23. Jean - Oliver'),
    (3,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','24. Bad Moon Rising - Creedence Clearwater Revival'),
    (1,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','25. Get Back - The Beatles'),
    (2,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','26. In the Year 2525 (Exordium & Terminus) - Zager and Evans'),
    (6,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','27. Spinning Wheel - Blood, Sweat and Tears'),
    (6,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','28. Baby, I Love You - Andy Kim'),
    (8,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','29. Going In Circles - The Friends Of Distinction'),
    (2,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','30. Hurt So Bad - The Lettermen'),
    (6,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','31. Green River - Creedence Clearwater Revival'),
    (1,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','32. My Cherie Amour - Stevie Wonder'),
    (3,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','33. Easy to Be Hard - Three Dog Night'),
    (6,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','34. Baby It''s You - Smith'),
    (6,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','35. In the Ghetto - Elvis Presley'),
    (7,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','36. A Boy Named Sue - Johnny Cash'),
    (3,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','37. Baby, Baby Don''t Cry - Smokey Robinson and The Miracles'),
    (3,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','38. Only the Strong Survive - Jerry Butler'),
    (6,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','39. Time of the Season - The Zombies'),
    (9,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','40. Wedding Bell Blues - The Fifth Dimension'),
    (8,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','41. Little Woman - Bobby Sherman'),
    (6,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','42. Love Can Make You Happy - Mercy'),
    (9,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','43. Good Morning Starshine - Oliver'),
    (3,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','44. These Eyes - The Guess Who'),
    (8,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','45. You''ve Made Me So Very Happy - Blood, Sweat and Tears'),
    (8,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','46. Put a Little Love In Your Heart - Jackie DeShannon'),
    (8,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','47. Do Your Thing, The Watts 103rd Street Rhythm Band'),
    (3,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','48. I''d Wait a Million Years - The Grass Roots'),
    (2,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','49. Touch Me - The Doors'),
    (7,'https://www.computerhope.com/jargon/m/example.mp3','https://cdn.mos.cms.futurecdn.net/rqoDpnCCrdpGFHM6qky3rS-970-80.jpg','50. More Today Than Yesterday - The Spiral Starecase');

INSERT INTO Comments(postID, userID, text) VALUES
    (10,8,'a'),
    (12,5,'about'),
    (16,3,'all'),
    (19,8,'also'),
    (31,9,'and'),
    (15,5,'as'),
    (13,2,'at'),
    (14,9,'be'),
    (44,5,'because'),
    (19,8,'but'),
    (27,1,'more'),
    (17,6,'my'),
    (17,9,'new'),
    (14,6,'up'),
    (18,6,'use'),
    (17,3,'very'),
    (15,3,'want'),
    (13,9,'way'),
    (16,7,'we'),
    (29,5,'well'),
    (31,7,'what'),
    (38,8,'when'),
    (25,3,'which'),
    (13,3,'who'),
    (14,7,'will'),
    (21,3,'with'),
    (16,1,'would'),
    (14,2,'year'),
    (17,0,'you'),
    (43,6,'your');

INSERT INTO ContentFeeds(userID, interests) VALUES
    (1,'day'),
    (2,'this'),
    (3,'also'),
    (4,'of'),
    (5,'your'),
    (6,'only'),
    (7,'she'),
    (8,'use'),
    (9,'its'),
    (10,'tell');

INSERT INTO Post_Feeds(postID, feedID) VALUES
    (13,1),
    (11,2),
    (17,3),
    (16,4),
    (16,5),
    (8,6),
    (17,7),
    (17,8),
    (46,9),
    (14,10);
