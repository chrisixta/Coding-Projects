/* MODIFY THE FOLLOWING COMMAND TO RUN ON YOUR OWN SYSTEM IF YOU USE THIS SCRIPT BY OPENING A NEW QUERY . MAKE ANY ADJUSTMENTS TO THE QUERY IF YOU ENCOUNTER ERRORS. SUBMIT SCREENSHOTS OF ATLEAST 5 QUERIES THAT YOU RUN BASED ON THE DATA YOU HAVE ENTERED. YOU MAY DECIDE THE CRITERIA FOR EACH QUERY. FOR EXAMPLE, YOU MAY EXTRACT ALL MEMBERS WHO ARE AT MEMBER_LEVEL "GOLD." IN ADDITION TO THESE RESPONSES, ANSWER THE FOLLOWING QUESTIONS. THIS PROJECT REPLACES THE FINAL EXAM FOR THE COURSE AND IS DUE BY SUNDAY MIDNIGHT.*/

CREATE DATABASE the_club;

create table MemberLevels (
 Levelnum int,
 LevelName char(12),
 Primary key (Levelnum)
);
create table Teams (
 Team char,
 TeamFocus char(30),
 Primary key (Team)
);
Create table ClubMembers (
  MemID int,
  Lname char (24),
  Fname char (24),
  Levelnum int,
  Team char,
  primary key (MemID),
  Foreign key (Levelnum) references MemberLevels (Levelnum),
  Foreign key (Team) references Teams (Team)
);
insert into MemberLevels values (1, 'Copper');
insert into MemberLevels values (2, 'Silver');
insert into MemberLevels values (3, 'Gold');
insert into MemberLevels values (4, 'Platinum');
insert into MemberLevels values (5, 'Diamond');
insert into Teams values ('A', 'Social planning');
insert into Teams values ('B', 'Budgeting');
insert into Teams values ('C', 'Development');
insert into Teams values ('D', 'Membership and recruiting');
insert into Teams values ('E', 'Strategy');
insert into ClubMembers values (134, 'Trudel', 'Rodney', 5, null);
insert into ClubMembers values (160, 'Humphrey', 'Trena', 3, 'E');
insert into ClubMembers values (165, 'Sherrell', 'Georgianna', 1, 'A');
insert into ClubMembers values (211, 'Freeney', 'Bonita', 1, 'B');
insert into ClubMembers values (453, 'Folger', 'Esmeralda', 3, 'A');
insert into ClubMembers values (562, 'Euell', 'Leota', 4, 'C');
insert into ClubMembers values (592, 'Jayne', 'Nigel', 3, 'A');
insert into ClubMembers values (713, 'Alberty', 'Cordelia', 5, 'A');
insert into ClubMembers values (721, 'Babb', 'Yolanda', 3, 'A');
insert into ClubMembers values (819, 'Mcclintic', 'Leesa', 4, 'E');
insert into ClubMembers values (998, 'Rotter', 'Jonell', 4, 'B');
insert into ClubMembers values (1001, 'Lansford', 'Brigette', 3, 'B');
insert into ClubMembers values (1066, 'Wertman', 'Leoma', 5, 'B');
insert into ClubMembers values (1227, 'Saucier', 'Nora', 5, 'C');
insert into ClubMembers values (1264, 'Donoho', 'Marisela', 3, 'D');
insert into ClubMembers values (1307, 'Marts', 'Elwanda', 2, null);
insert into ClubMembers values (1321, 'Mccutcheon', 'Exie', 2, 'E');
insert into ClubMembers values (1324, 'Badillo', 'Many', 3, 'B');
insert into ClubMembers values (1358, 'Strine', 'Josh', 2, 'A');
insert into ClubMembers values (1546, 'Lowery', 'Florentino', 5, 'D');
insert into ClubMembers values (1606, 'Cobbley', 'Ida', 4, null);
insert into ClubMembers values (1752, 'Shuman', 'Douglass', 2, 'D');
insert into ClubMembers values (1799, 'Smithers', 'Jeremy', 2, 'A');
insert into ClubMembers values (1811, 'Bono', 'Bruce', 3, null);
insert into ClubMembers values (1835, 'Kieffer', 'Arlyne', 2, 'E');
insert into ClubMembers values (1990, 'Young', 'Wendie', 1, 'B');
insert into ClubMembers values (2022, 'Mcamis', 'Celia', 4, 'E');
insert into ClubMembers values (2208, 'Rentz', 'Marleen', 3, null);
insert into ClubMembers values (2217, 'Hamner', 'Efrain', 5, 'E');
insert into ClubMembers values (2220, 'Kitzman', 'Petronila', 1, 'B');
insert into ClubMembers values (2224, 'Goulding', 'Marine', 2, 'D');
insert into ClubMembers values (2404, 'Reinert', 'Mariana', 3, 'A');
insert into ClubMembers values (2439, 'Rockwell', 'Tommye', 4, 'A');
insert into ClubMembers values (2450, 'Ollison', 'Treasa', 3, 'B');
insert into ClubMembers values (2491, 'Dennie', 'Latoyia', 2, 'A');
insert into ClubMembers values (2514, 'Raschke', 'Samira', 4, 'D');
insert into ClubMembers values (2520, 'Broad', 'Deanne', 4, 'A');
insert into ClubMembers values (2527, 'Brierly', 'Reid', 1, null);
insert into ClubMembers values (2559, 'Mahaffey', 'Tennie', 3, 'A');
insert into ClubMembers values (2590, 'Recore', 'Melodi', 1, 'B');
insert into ClubMembers values (2650, 'Dixion', 'Joi', 5, 'E');
insert into ClubMembers values (2662, 'Marse', 'Jenna', 4, 'D');
insert into ClubMembers values (2724, 'Buono', 'Ariana', 1, 'E');
insert into ClubMembers values (2741, 'Dibble', 'Annita', 1, 'D');
insert into ClubMembers values (2743, 'Pieper', 'Fannie', 4, null);
insert into ClubMembers values (2746, 'Millspaugh', 'Cliff', 3, 'D');
insert into ClubMembers values (2861, 'Jeffress', 'Cherri', 1, 'A');
insert into ClubMembers values (2910, 'Rahaim', 'Laura', 3, 'A');
insert into ClubMembers values (2961, 'Harrah', 'Jake', 5, 'A');
insert into ClubMembers values (2971, 'Urbanski', 'Kathlyn', 4, null);
insert into ClubMembers values (2981, 'Hambleton', 'Albertina', 4, 'D');