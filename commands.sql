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
  ("https://www.youtube.com", 1234, "greenwick"),
  ("https://www.blackboard.hartford.edu", 5678, "jdoe"),
  ("https://www.wikipedia.com", 9012, "janesmith"),
  ("https://www.github.com", 3456, "octocat"),
  ("https://www.facebook.com", 7890, "fb_user123"),
  ("https://www.twitter.com", 2345, "bird"),
  ("https://www.linkedin.com", 6789, "pro_networker"),
  ("https://www.instagram.com", 1122, "jdog"),
  ("https://www.reddit.com", 3344, "redditor_expert"),
  ("https://www.netflix.com", 5566, "binge_watcher");

INSERT INTO password
VALUES
  ("https://www.youtube.com", 1234, AES_ENCRYPT('door5497', @key_str, @init_vector), 328.12),
  ("https://www.blackboard.hartford.edu", 5678, AES_ENCRYPT('classroom99', @key_str, @init_vector), 450.65),
  ("https://www.wikipedia.com", 9012, AES_ENCRYPT('g62^43pl', @key_str, @init_vector), 512.00),
  ("https://www.github.com", 3456, AES_ENCRYPT('james007', @key_str, @init_vector), 760.30),
  ("https://www.facebook.com", 7890, AES_ENCRYPT('fbuser987', @key_str, @init_vector), 105.50),
  ("https://www.twitter.com", 2345, AES_ENCRYPT('tw33t890', @key_str, @init_vector), 220.40),
  ("https://www.linkedin.com", 6789, AES_ENCRYPT('lulo0909', @key_str, @init_vector), 340.75),
  ("https://www.instagram.com", 1122, AES_ENCRYPT('sol20$f', @key_str, @init_vector), 150.80),
  ("https://www.reddit.com", 3344, AES_ENCRYPT('losttime2', @key_str, @init_vector), 190.20),
  ("https://www.netflix.com", 5566, AES_ENCRYPT('strangerthings', @key_str, @init_vector), 450.90);
