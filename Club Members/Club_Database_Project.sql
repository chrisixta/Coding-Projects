/* Takes names that start with A */
SELECT Lname, Fname
FROM ClubMembers 
WHERE Lname LIKE 'A%' 
OR Fname LIKE 'A%';
GO

/* Selects members by member ID from greatest to least */
SELECT MemID, Lname, Fname
FROM ClubMembers
ORDER BY MemID DESC;
GO

/*Selects highest member level */
SELECT MAX(MemID) AS HighestLevel 
FROM ClubMembers;
GO

/* Displays information of level number and team */
SELECT ClubMembers.Fname, ClubMembers.Lname, Teams.TeamFocus, MemberLevels.LevelName
FROM ClubMembers 
JOIN Teams 
    ON ClubMembers.Team = Teams.Team
JOIN MemberLevels  
    ON ClubMembers.Levelnum = MemberLevels.Levelnum
GO

/*Counts members that are budgeting */
SELECT COUNT(*) AS BudgetingCount
FROM ClubMembers
JOIN Teams 
    ON ClubMembers.Team = Teams.Team
WHERE Teams.TeamFocus = 'Budgeting';
GO

