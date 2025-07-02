
-- View 1: Total Votes by District
CREATE VIEW DistrictVoteCount AS
SELECT 
    r.DistrictID,
    a.City,
    a.State,
    SUM(r.Vote_Count) AS TotalVotes
FROM Result r
JOIN Address a ON r.DistrictID = a.DistrictID
GROUP BY r.DistrictID, a.City, a.State;
GO

-- View 2: Total Votes by Party (Nationwide)
CREATE VIEW PartyVoteCount AS
SELECT 
    r.PartyID,
    p.PartyName,
    SUM(r.Vote_Count) AS TotalVotes
FROM Result r
JOIN Party_Table p ON r.PartyID = p.PartyID
GROUP BY r.PartyID, p.PartyName
ORDER BY TotalVotes DESC;
GO

-- View 3: Total Votes by Candidate
CREATE VIEW CandidateVoteCount AS
SELECT 
    r.CandidateID,
    v.FirstName,
    v.Lastname,
    SUM(r.Vote_Count) AS TotalVotes
FROM Result r
JOIN Candidate_Table c ON r.CandidateID = c.CandidateID
JOIN Voter_Table v ON c.CNIC = v.CNIC
GROUP BY r.CandidateID, v.FirstName, v.Lastname
ORDER BY TotalVotes DESC;
GO

-- View 4: Votes by Election Type
CREATE VIEW ElectionTypeVoteCount AS
SELECT 
    e.ElectionType,
    SUM(r.Vote_Count) AS TotalVotes
FROM Result r
JOIN Candidate_Table c ON r.CandidateID = c.CandidateID
JOIN Election_Table e ON c.ElectionID = e.ElectionID
GROUP BY e.ElectionType;
GO

-- View 5: Votes by Candidate Type
CREATE VIEW CandidateTypeVoteCount AS
SELECT 
    ct.CandidateType,
    SUM(r.Vote_Count) AS TotalVotes
FROM Result r
JOIN Candidate_Table c ON r.CandidateID = c.CandidateID
JOIN Candidate_Type ct ON c.CandidateTypeID = ct.CandidateTypeID
GROUP BY ct.CandidateType;
GO

-- View 6: Total Votes by City
CREATE VIEW CityVoteCount AS
SELECT 
    a.City,
    SUM(r.Vote_Count) AS TotalVotes
FROM Result r
JOIN Address a ON r.DistrictID = a.DistrictID
GROUP BY a.City;
GO

-- View 7: Top Candidate per District
CREATE VIEW TopCandidatePerDistrict AS
SELECT 
    r.DistrictID,
    c.CandidateID,
    v.FirstName,
    v.Lastname,
    r.Vote_Count
FROM Result r
JOIN Candidate_Table c ON r.CandidateID = c.CandidateID
JOIN Voter_Table v ON c.CNIC = v.CNIC
WHERE r.Vote_Count = (
    SELECT MAX(Vote_Count)
    FROM Result r2
    WHERE r2.DistrictID = r.DistrictID
);
GO

-- View 8: Vote Share per Party
CREATE VIEW PartyVoteShare AS
SELECT 
    p.PartyName,
    CAST(SUM(r.Vote_Count) * 100.0 / (SELECT SUM(Vote_Count) FROM Result) AS DECIMAL(5,2)) AS VoteSharePercent
FROM Result r
JOIN Party_Table p ON r.PartyID = p.PartyID
GROUP BY p.PartyName
ORDER BY VoteSharePercent DESC;
GO
