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
  FOREIGN KEY (`userID`) REFERENCES Users(`userID`),
  FOREIGN KEY (`embedPostID`) REFERENCES Posts(`postID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Comments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `postID` varchar(255) NOT NULL,
  `userID` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`commentID`)
  FOREIGN KEY (`userID`) REFERENCES Users(`userID`),
  FOREIGN KEY (`postID`) REFERENCES Posts(`postID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `ContentFeeds` (
  `feedID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(255) NOT NULL,
  `interests` varchar(255),
  PRIMARY KEY (`feedID`)
  FOREIGN KEY (`userID`) REFERENCES Users(`userID`),
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Posts_Feeds` (
  `postID` varchar(255) NOT NULL,
  `feedID` varchar(255) NOT NULL,
  PRIMARY KEY (`postID`, `feedID`)
  FOREIGN KEY (`feedID`) REFERENCES ContentFeeds(`feedID`),
  FOREIGN KEY (`postID`) REFERENCES Posts(`postID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
