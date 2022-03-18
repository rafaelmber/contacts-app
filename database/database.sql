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