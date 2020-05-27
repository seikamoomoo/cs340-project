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
