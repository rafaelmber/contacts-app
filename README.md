# contacts-app

This is a Contacts Web App, where a user can see their contact, edit that information, and add more contacts. Multiple users can store their contacts in this app. So they must have access to their contacts only and hide others user's contacts.

The Contacts App is composed by a web server and a frontend App. The Backend app will serve frontend content, an API, a datebase to store contacts, and user autentication.

## Development.

### Database.

The contacts must be stored in a database, for this application I choose a Relational database and as a database manager I choose MySQL.

The database is called "contacts_app"

```sql
CREATE DATABASE contacts_app;
USE contacts_app;
```

#### Users table.

If the app must be used for different users. those users should be stored in its own table. This table should have the following fields:

1. **user_id**: This is the primary key of the user.
2. **email**: This is the email of the user, it will be used to login, so it cannot be null and must be unique. its datatype is string.
3. **password**: The password that the user will use to login, the password should be encrypted for user security.

The SQL code to create this table is:

```sql
CREATE TABLE IF NOT EXISTS users(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(30) NOT NULL UNIQUE,
  password VARCHAR(64) NOT NULL
);
```

#### Groups table

The group table is where users can stored their groups that they use to sort their contacts, the group only needs to store the name of the group, but it also needs a unique identifier and needs to show the user that creates that group. groups is a reserved word in MySQL, so I will call this table groups_table

1. **group_id**: This is the primary key of the groups_table. It will be autoincremented when a new group is created.
2. **name**: This is the name of the group, the user can set this property and it cannot be null.
3. **user_id**: This is how the group refers to the user who created it. A user can create many groups but a group can be created for only one user. So their relationship is One-to-Many and the Foreign key will be this attribute.

```sql
CREATE TABLE IF NOT EXISTS groups_table (
  group_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);
```

#### Contacts table.

Contacts table is the most important of the app. This table represents all contact that are stored in the database, the contacts have:

1. **contact_id**: This is the primary key of the table. It will be autoincremented when a new contact is saved.
2. **name**: This is the name of the contact. This must be a string
3. **telephone_number**: This is the telephonic number of the contact, this field cannot be null and its data type should be string beacause telephonic numbers can use symbols as the plus symbol for international numbers.
4. **email**: This is the email of the contact, it is optional and must have string data type.
5. **user_id**: This is the id of the user that stored the contact, this field is an integer and it is a foreign key from users table it cannot be null. A user can have may contacts but a contact only belongs to One user, so their relationship is One-to-Many
6. **group_id**: The group_id is the id of the group where a contact belongs to. It can be null because a user could not have a specific group for some contacts. It is an INT and it is a foreign key that refers to group_id attribute from groups_table. Agroup can have many contacts but a contact only can have one group, so their relationship is One-to-Many.

The SQL code to create this table will be

```sql
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
```

#### Data

For testing, I use some data generated and store it into the database

##### Users

```sql
INSERT INTO users(user_id,email,password) values
  (1,"sbrewse0@histats.com","8dafb07cac5312ca99cd7c67bd1d0a35ec6de26a6dc22cae006514e5e8fa1cf5"),
  (2,"mduckers1@msu.edu","2c864aa79d176ef8d3edccf6b7093bfbdd8438b0a603654fd36474111db09296"),
  (3,"mkeach2@usatoday.com",984fb7d976685db3499af7733b867fec5c2fb488c8f1c79a4ce97bdaa7c54301"),
  (4,"lmaciver3@mediafire.com","0b5b868f04401faa636072a6cd460ceda42a6e024caba275840461962b2f062f"),
  (5,"jkelso4@ning.com","01221f2438bcaf16fa662a14b4d7998ee28c04381fa1d575284830966ca8ebb9");
```

##### Groups

```sql
INSERT INTO groups_table(group_id,name,user_id) VALUES
  (1,"Family",1),
  (2,"Friends",1),
  (3,"Work",1),
  (4,"Home",3),
  (5,"Partners",2),
  (6,"Family",2),
  (7,"The Group",5);
```

##### Contacts

```sql
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
```
