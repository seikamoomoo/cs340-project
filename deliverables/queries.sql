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
  `sound` nvarchar(260),
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
  FOREIGN KEY (`postID`) REFERENCES Posts(`postID`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
