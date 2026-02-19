-- Top 10 source IPs
DROP VIEW IF EXISTS TopSourceIPs;
CREATE VIEW TopSourceIPs AS
SELECT
    Source_IP_Address,
    COUNT(*) AS AttackCount
FROM attacks_data
GROUP BY Source_IP_Address
ORDER BY AttackCount DESC
LIMIT 10;


-- Attack type distribution
DROP VIEW IF EXISTS AttackTypeSummary;
CREATE VIEW AttackTypeSummary AS
SELECT
    Attack_Type,
    COUNT(*) AS TotalAttacks
FROM attacks_data
GROUP BY Attack_Type
ORDER BY TotalAttacks DESC;


-- Severity level distribution
DROP VIEW IF EXISTS SeveritySummary;
CREATE VIEW SeveritySummary AS
SELECT
    Severity_Level,
    COUNT(*) AS TotalAttacks
FROM attacks_data
GROUP BY Severity_Level
ORDER BY TotalAttacks DESC;


-- Alerts vs actions
DROP VIEW IF EXISTS AlertActionSummary;
CREATE VIEW AlertActionSummary AS
SELECT
    Alerts_Warnings,
    Action_Taken,
    COUNT(*) AS AlertCount
FROM attacks_data
GROUP BY Alerts_Warnings, Action_Taken
ORDER BY AlertCount DESC;


-- Most targeted ports
DROP VIEW IF EXISTS TopTargetPorts;
CREATE VIEW TopTargetPorts AS
SELECT
    Destination_Port,
    COUNT(*) AS AttackCount
FROM attacks_data
GROUP BY Destination_Port
ORDER BY AttackCount DESC
LIMIT 10;


-- Attacks over time
DROP VIEW IF EXISTS AttacksByDate;
CREATE VIEW AttacksByDate AS
SELECT
    DATE(Timestamp) AS AttackDate,
    COUNT(*) AS TotalAttacks
FROM attacks_data
GROUP BY DATE(Timestamp)
ORDER BY AttackDate;


-- Geographic distribution
DROP VIEW IF EXISTS AttacksByLocation;
CREATE VIEW AttacksByLocation AS
SELECT
    Geo_Location,
    COUNT(*) AS TotalAttacks
FROM attacks_data
GROUP BY Geo_Location
ORDER BY TotalAttacks DESC;


-- Risk intelligence
DROP VIEW IF EXISTS SeverityRiskScore;
CREATE VIEW SeverityRiskScore AS
SELECT
    Severity_Level,
    COUNT(*) AS TotalAttacks,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM attacks_data),
        2
    ) AS PercentOfTotal
FROM attacks_data
GROUP BY Severity_Level;


-- Defense effectiveness
DROP VIEW IF EXISTS DetectionEffectiveness;
CREATE VIEW DetectionEffectiveness AS
SELECT
    Attack_Type,
    COUNT(*) AS TotalAttacks,
    SUM(CASE
        WHEN Action_Taken = 'Blocked' THEN 1
        ELSE 0
    END) AS BlockedAttacks,
    ROUND(
        SUM(CASE WHEN Action_Taken='Blocked' THEN 1 ELSE 0 END)
        *100.0 / COUNT(*),
        2
    ) AS BlockRatePercent
FROM attacks_data
GROUP BY Attack_Type;
