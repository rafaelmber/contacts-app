DROP DATABASE IF EXISTS contacts_app;

CREATE DATABASE IF NOT EXISTS contacts_app;
USE contacts_app;

CREATE TABLE IF NOT EXISTS users(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(30) NOT NULL UNIQUE,
  password VARCHAR(64) NOT NULL
);

CREATE TABLE IF NOT EXISTS groups_table (
  group_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS contacts(
  contact_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  telephonic_number VARCHAR(20) NOT NULL,
  email VARCHAR(30),
  user_id INT NOT NULL,
  group_id INT,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (group_id) REFERENCES groups_table(group_id)
);

INSERT INTO users(user_id,email,password) VALUES
  (1,"sbrewse0@histats.com","8dafb07cac5312ca99cd7c67bd1d0a35ec6de26a6dc22cae006514e5e8fa1cf5"),
  (2,"mduckers1@msu.edu","2c864aa79d176ef8d3edccf6b7093bfbdd8438b0a603654fd36474111db09296"),
  (3,"mkeach2@usatoday.com","984fb7d976685db3499af7733b867fec5c2fb488c8f1c79a4ce97bdaa7c54301"),
  (4,"lmaciver3@mediafire.com","0b5b868f04401faa636072a6cd460ceda42a6e024caba275840461962b2f062f"),
  (5,"jkelso4@ning.com","01221f2438bcaf16fa662a14b4d7998ee28c04381fa1d575284830966ca8ebb9");

INSERT INTO groups_table(group_id,name,user_id) VALUES
  (1,"Family",1),
  (2,"Friends",1),
  (3,"Work",1),
  (4,"Home",3),
  (5,"Partners",2),
  (6,"Family",2),
  (7,"The Group",5);

INSERT INTO contacts(name,telephonic_number,email,user_id,group_id) VALUES
  (NULL, "+380 (777) 250-7579",NULL, 1, NULL),
  ("Gwenny Giberd","+62 (397) 345-9344","ggiberd1j@merriam-webster.com",4, NULL),
  ("Nilson Dumper","+62 (676) 999-3543", NULL, 4, NULL),
  ("Zahara Dudny","+86 (394) 842-0949","zdudny2l@gravatar.com",3, 4),
  ("Quillan Clabburn", "+504 (317) 861-1697",NULL, 5, 7),
  ("Alvan Decker", "+7 (306) 508-1011", NULL, 5, 7),
  (NULL, "+1 (801) 791-8609", NULL, 5, NULL),
  ("Richmond Duffree", "+81 (420) 244-5599", NULL, 1, 2),
  ("Xylia Drennan", "+1 (638) 552-2989", "xdrennand3@squidoo.com", 4, NULL),
  ("Matty Lucy", "+47 (633) 611-1423", NULL, 3, 4),
  ("Laird Warin", "+351 (763) 558-8955", NULL, 3, NULL),
  ("Astrid Coyish", "+63 (684) 209-8332", "acoyishdz@etsy.com", 2, 5);
