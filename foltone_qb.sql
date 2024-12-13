CREATE TABLE `apartments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
);

--
-- Table structure for table `bank_accounts`
--
CREATE TABLE `bank_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_balance` int NOT NULL DEFAULT '0',
  `account_type` enum('shared','job','gang') COLLATE utf8mb4_unicode_ci NOT NULL,
  `users` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '[]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_name` (`account_name`)
);

--
-- Table structure for table `bank_statements`
--
CREATE TABLE `bank_statements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'checking',
  `amount` int DEFAULT NULL,
  `reason` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statement_type` enum('deposit','withdraw') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `citizenid` (`citizenid`)
);


--
-- Table structure for table `bans`
--
CREATE TABLE `bans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text,
  `expire` int DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
);


--
-- Table structure for table `houselocations`
--
CREATE TABLE `houselocations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text,
  `owned` tinyint DEFAULT NULL,
  `price` int DEFAULT NULL,
  `tier` tinyint DEFAULT NULL,
  `garage` varchar(255) NOT NULL DEFAULT '{"y":0,"x":0,"w":0,"z":0}',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
);

--
-- Table structure for table `inventories`
--
CREATE TABLE `inventories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`identifier`),
  KEY `id` (`id`),
  CONSTRAINT `inventories_chk_1` CHECK (json_valid(`items`))
);


--
-- Table structure for table `player_contacts`
--

CREATE TABLE `player_contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
);


--
-- Table structure for table `player_houses`
--

CREATE TABLE `player_houses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text,
  `decorations` text,
  `stash` text,
  `outfit` text,
  `logout` text,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
);


--
-- Table structure for table `player_outfits`
--
CREATE TABLE `player_outfits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
);


--
-- Table structure for table `players`
--
CREATE TABLE `players` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text,
  `job` text NOT NULL,
  `gang` text,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
);


--
-- Table structure for table `playerskins`
--

CREATE TABLE `playerskins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
);


--
-- Table structure for table `sp_votes`
--
CREATE TABLE `sp_votes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `voted_at` bigint DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
);
