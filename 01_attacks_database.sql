CREATE DATABASE IF NOT EXISTS attacks;
USE attacks;

DROP TABLE IF EXISTS attacks_data;

CREATE TABLE attacks_data (
    Attack_ID INT AUTO_INCREMENT PRIMARY KEY,
    Timestamp DATETIME,
    Source_IP_Address VARCHAR(50),
    Destination_IP_Address VARCHAR(50),
    Source_Port INT,
    Destination_Port INT,
    Protocol VARCHAR(20),
    Packet_Length INT,
    Packet_Type VARCHAR(50),
    Traffic_Type VARCHAR(50),
    Payload_Data TEXT,
    Malware_Indicators VARCHAR(100),
    Anomaly_Score FLOAT,
    Alerts_Warnings VARCHAR(100),
    Attack_Type VARCHAR(100),
    Attack_Signature VARCHAR(150),
    Action_Taken VARCHAR(50),
    Severity_Level VARCHAR(50),
    User_Information VARCHAR(150),
    Device_Information VARCHAR(255),
    Network_Segment VARCHAR(100),
    Geo_Location VARCHAR(150),
    Proxy_Information VARCHAR(100),
    Firewall_Logs VARCHAR(100),
    IDS_IPS_Alerts VARCHAR(100),
    Log_Source VARCHAR(100)
);
