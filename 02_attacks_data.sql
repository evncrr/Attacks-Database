LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.3/Uploads/cybersecurity_attacks.csv'
INTO TABLE attacks_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    Timestamp,
    Source_IP_Address,
    Destination_IP_Address,
    Source_Port,
    Destination_Port,
    Protocol,
    Packet_Length,
    Packet_Type,
    Traffic_Type,
    Payload_Data,
    Malware_Indicators,
    Anomaly_Score,
    Alerts_Warnings,
    Attack_Type,
    Attack_Signature,
    Action_Taken,
    Severity_Level,
    User_Information,
    Device_Information,
    Network_Segment,
    Geo_Location,
    Proxy_Information,
    Firewall_Logs,
    IDS_IPS_Alerts,
    Log_Source
);
