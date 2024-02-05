-- Creating the User table
Create Database lab08;

use lab08
CREATE TABLE User1 (
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  username VARCHAR(50) NOT NULL,
  DOB INT
);
ALTER TABLE User1
ADD CONSTRAINT chk_id_less_than_10 CHECK (id < 10);


CREATE TABLE Post (
  id INT NOT NULL PRIMARY KEY,
  description VARCHAR(500) NOT NULL,
  date INT,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES User1(id) ON DELETE CASCADE
);

CREATE TABLE Comment (
  id INT NOT NULL PRIMARY KEY,
  description VARCHAR(500) NOT NULL,
  date INT,
  post_id INT NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (post_id) REFERENCES Post(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES User1(id) ON DELETE no action
);


INSERT INTO User1 (id, name, username, DOB) VALUES
  (1, 'Hassan Abbas', 'hssn08', 1609459200), -- DOB is 01/01/2021
  (2, 'Ali Shahbaz', 'alishah', NULL),
  (3, 'Ahmed Farhan', 'ahmed11', 1567296000); -- DOB is 09/01/2019


INSERT INTO Post (id, description, date, user_id) VALUES
  (1, 'My first post', 1640985600, 1), -- Date is 01/01/2022
  (2, 'Hello world', 1643644800, 2), -- Date is 02/01/2022
  (3, 'Hello Pakistan', 1638355200, 3); -- Date is 01/12/2021

INSERT INTO Comment (id, description, date, post_id, user_id) VALUES
  (1, 'Nice', 1641072000, 1, 2), -- Date is 02/01/2022
  (2, 'Hello Dear', 1643731200, 2, 3), -- Date is 03/01/2022
  (3, 'Very Beautiful', 1638441600, 3, 1); -- Date is 02/12/2021

-- Query 1 to Get the total number of posts made by each user
SELECT u.id, u.name, COUNT(p.id) AS num_posts
FROM User1 u
LEFT JOIN Post p ON u.id = p.user_id
GROUP BY u.id, u.name;

-- Query 2 to Get the most recent comment for each post
SELECT p.id, p.description, c.description AS last_comment, 
       CONVERT(varchar, DATEADD(second, c.date, '19700101'), 120) AS last_comment_date
FROM Post p
LEFT JOIN (
  SELECT post_id, description, date, ROW_NUMBER() OVER (PARTITION BY post_id ORDER BY date DESC) AS rn
  FROM Comment
) c ON p.id = c.post_id AND c.rn = 1;

DELETE FROM Post WHERE id = 2;
select* from Comment
