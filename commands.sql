SET @key_str = UNHEX(SHA2('hubbabubba', 512));
SET @init_vector = RANDOM_BYTES(16);

INSERT INTO website
VALUES
  ("Youtube", "https://www.youtube.com"),
  ("Blackboard", "https://www.blackboard.hartford.edu"),
  ("Wikipedia", "https://www.wikipedi.com"),
  ("GitHub", "https://www.github.com"),
  ("Facebook", "https://www.facebook.com"),
  ("Twitter", "https://www.twitter.com"),
  ("LinkedIn", "https://www.linkedin.com"),
  ("Instagram", "https://www.instagram.com"),
  ("Reddit", "https://www.reddit.com"),
  ("Netflix", "https://www.netflix.com");

INSERT INTO user
VALUES
  ("https://www.youtube.com", "graywick", "Gray", "Wick", "graywick@example.com"),
  ("https://www.blackboard.hartford.edu", "jdoe", "John", "Doe", "jdoe@hartford.edu"),
  ("https://www.wikipedia.com", "janesmith", "Jane", "Smith", "janesmith@example.com"),
  ("https://www.github.com", "octocat", "Owen", "Coud", "octocat@github.com"),
  ("https://www.facebook.com", "fb_user123", "Frank", "Uso", "fb_user123@facebook.com"),
  ("https://www.twitter.com", "bird", "Joe", "Bird", "bird@twitter.com"),
  ("https://www.linkedin.com", "pro_networker", "Mike", "Evan", "pro_networker@linkedin.com"),
  ("https://www.instagram.com", "jdog", "J", "Dog", "jdog@instagram.com"),
  ("https://www.reddit.com", "redditor_expert", "Reddit", "Expert", "redditor_expert@reddit.com"),
  ("https://www.netflix.com", "binge_watcher", "Binge", "Watcher", "binge_watcher@netflix.com");

INSERT INTO password
VALUES
  ("https://www.youtube.com", "graywick", AES_ENCRYPT('door5497', @key_str, @init_vector), '2024-10-03 12:43:03'),
  ("https://www.blackboard.hartford.edu", "jdoe", AES_ENCRYPT('classroom99', @key_str, @init_vector), '2024-10-03 18:23:53'),
  ("https://www.wikipedia.com", "janesmith", AES_ENCRYPT('g62^43pl', @key_str, @init_vector), '2024-10-05 7:22:18'),
  ("https://www.github.com", "octocat", AES_ENCRYPT('james007', @key_str, @init_vector), '2024-10-06 12:53:10'),
  ("https://www.facebook.com", "fb_user123", AES_ENCRYPT('fbuser987', @key_str, @init_vector), '2024-10-08 14:12:33'),
  ("https://www.twitter.com", "bird", AES_ENCRYPT('tw33t890', @key_str, @init_vector), '2024-10-10 14:30:34'),
  ("https://www.linkedin.com", "pro_networker", AES_ENCRYPT('lulo0909', @key_str, @init_vector), '2024-10-11 12:00:58'),
  ("https://www.instagram.com", "jdog", AES_ENCRYPT('sol20$f', @key_str, @init_vector), '2024-10-11 13:03:10'),
  ("https://www.reddit.com", "redditor_expert", AES_ENCRYPT('losttime2', @key_str, @init_vector), '2024-10-12 06:21:24'),
  ("https://www.netflix.com", "binge_watcher", AES_ENCRYPT('strangerthings', @key_str, @init_vector), '2024-10-12 16:43:46');


INSERT INTO website VALUES ("Walmart", "https://www.walmart.com");
INSERT INTO user VALUES ("https://www.walmart.com", "doorman", "Ben", "Andrews", "bandrews@mail.com");
INSERT INTO password
VALUES ("https://www.walmart.com", "doorman", AES_ENCRYPT('concate85%^8', @key_str, @init_vector), '2024-10-14 10:01:23');


select CONVERT(AES_DECRYPT(password, @key_str, @init_vector) USING 'utf8') AS plain_text_password
from password
WHERE website_url = "https://www.twitter.com";


SELECT website_url, user_name, CONVERT(AES_DECRYPT(password, @key_str, @init_vector) USING 'utf8') AS plain_text_password,
timestamp FROM password WHERE website_url LIKE '%https%';


UPDATE password SET website_url = "https://www.x.com" WHERE website_url = "https://www.twitter.com";


UPDATE password SET password = AES_ENCRYPT('newPaSsWoRd', @key_str, @init_vector)
WHERE password = AES_ENCRYPT('g62^43pl', @key_str, @init_vector);


DELETE FROM password WHERE website_url = "https://www.github.com";
DELETE FROM user WHERE website_url = "https://www.github.com";
DELETE FROM website WHERE website_url = "https://www.github.com";


SELECT website_url FROM password WHERE password = AES_ENCRYPT('door5497', @key_str, @init_vector);
DELETE FROM password WHERE password = AES_ENCRYPT('door5497', @key_str, @init_vector);
DELETE FROM user WHERE website_url = "https://www.youtube.com";
DELETE FROM website WHERE website_url = "https://www.youtube.com";
