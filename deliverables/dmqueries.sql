-- get feed for a user
SELECT feedID, userID, interests FROM ContentFeeds
WHERE userID = :currentUser

-- get posts for feed
SELECT post.postID, post.userID, username, graphic, sound, title, description, embedPostID, timeCreated, tags FROM Posts
INNER JOIN Users ON Posts.userID = Users.userID
LEFT JOIN Posts_Feeds ON Posts.postID = Posts_Feeds.postID
WHERE feedID = :userFeed

-- get comments for a post
SELECT commentID, postID, Users.userID, username, text FROM Comments
LEFT JOIN Users ON Comments.userID = Users.userID
WHERE postID = :post_displayed

-- get user profile
SELECT userID, username FROM Users WHERE userID = :userID_input

-- get posts by a user
SELECT postID, post.userID, username, graphic, sound, title, description, embedPostID, timeCreated, tags FROM Posts
INNER JOIN Users ON Posts.userID = Users.userID
WHERE post.userID = :userID_input

-- create new user
INSERT INTO Users(username, password, email)
VALUES(:username, :password, :email);

-- login
SELECT password FROM Users WHERE username = :username;

-- new user
INSERT INTO Users(username, password, email)
Values(:username, :password, :email);

-- new post
INSERT INTO Posts(userID, sound, graphic, title)
Values(:userID, :sound, :graphic, :title);

-- new comment
INSERT INTO Comments(postID, userID, text)
Values(:postID, :userID, :text);

-- new ContentFeed
INSERT INTO ContentFeeds(userID, interests)
Values(:userID, :interests);

-- new Post_Feeds
INSERT INTO Post_Feeds(postID, feedID)
Values(:postID, :feedID);
