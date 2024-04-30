-- 1. Match table
CREATE TABLE Match (
    match_id INTEGER PRIMARY KEY,
    date DATE NOT NULL,
    opponent VARCHAR(50) NOT NULL
);

-- 2. Player table
CREATE TABLE Player (
    player_id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    position VARCHAR(20)
);

-- 3. Match_Participation table
CREATE TABLE Match_Participation (
    match_id INTEGER NOT NULL,
    player_id INTEGER NOT NULL,
    minutes_played INTEGER,
    goals INTEGER,
    assists INTEGER,
    /* Add columns for other statistics as needed */
    PRIMARY KEY (match_id, player_id),
    CONSTRAINT _match_participation_match FOREIGN KEY (match_id) REFERENCES Match(match_id),
    CONSTRAINT _match_participation_player FOREIGN KEY (player_id) REFERENCES Player(player_id)
);
