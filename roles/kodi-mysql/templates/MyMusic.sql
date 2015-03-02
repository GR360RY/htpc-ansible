-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: MyMusic46
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `idAlbum` int(11) NOT NULL AUTO_INCREMENT,
  `strAlbum` varchar(256) DEFAULT NULL,
  `strMusicBrainzAlbumID` text,
  `strArtists` text,
  `strGenres` text,
  `iYear` int(11) DEFAULT NULL,
  `idThumb` int(11) DEFAULT NULL,
  `bCompilation` int(11) NOT NULL DEFAULT '0',
  `strMoods` text,
  `strStyles` text,
  `strThemes` text,
  `strReview` text,
  `strImage` text,
  `strLabel` text,
  `strType` text,
  `iRating` int(11) DEFAULT NULL,
  `lastScraped` varchar(20) DEFAULT NULL,
  `dateAdded` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idAlbum`),
  UNIQUE KEY `idxAlbum_2` (`strMusicBrainzAlbumID`(36)),
  KEY `idxAlbum` (`strAlbum`(255)),
  KEY `idxAlbum_1` (`bCompilation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`xbmc`@`localhost`*/ /*!50003 TRIGGER tgrDeleteAlbum AFTER delete ON album FOR EACH ROW BEGIN  DELETE FROM song WHERE song.idAlbum = old.idAlbum;  DELETE FROM album_artist WHERE album_artist.idAlbum = old.idAlbum;  DELETE FROM album_genre WHERE album_genre.idAlbum = old.idAlbum;  DELETE FROM albuminfosong WHERE albuminfosong.idAlbumInfo=old.idAlbum;  DELETE FROM art WHERE media_id=old.idAlbum AND media_type='album'; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `album_artist`
--

DROP TABLE IF EXISTS `album_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_artist` (
  `idArtist` int(11) DEFAULT NULL,
  `idAlbum` int(11) DEFAULT NULL,
  `strJoinPhrase` text,
  `boolFeatured` int(11) DEFAULT NULL,
  `iOrder` int(11) DEFAULT NULL,
  `strArtist` text,
  UNIQUE KEY `idxAlbumArtist_1` (`idAlbum`,`idArtist`),
  UNIQUE KEY `idxAlbumArtist_2` (`idArtist`,`idAlbum`),
  KEY `idxAlbumArtist_3` (`boolFeatured`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_artist`
--

LOCK TABLES `album_artist` WRITE;
/*!40000 ALTER TABLE `album_artist` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_genre`
--

DROP TABLE IF EXISTS `album_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_genre` (
  `idGenre` int(11) DEFAULT NULL,
  `idAlbum` int(11) DEFAULT NULL,
  `iOrder` int(11) DEFAULT NULL,
  UNIQUE KEY `idxAlbumGenre_1` (`idAlbum`,`idGenre`),
  UNIQUE KEY `idxAlbumGenre_2` (`idGenre`,`idAlbum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_genre`
--

LOCK TABLES `album_genre` WRITE;
/*!40000 ALTER TABLE `album_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `albumartistview`
--

DROP TABLE IF EXISTS `albumartistview`;
/*!50001 DROP VIEW IF EXISTS `albumartistview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `albumartistview` (
  `idAlbum` tinyint NOT NULL,
  `idArtist` tinyint NOT NULL,
  `strArtist` tinyint NOT NULL,
  `strMusicBrainzArtistID` tinyint NOT NULL,
  `boolFeatured` tinyint NOT NULL,
  `strJoinPhrase` tinyint NOT NULL,
  `iOrder` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `albuminfosong`
--

DROP TABLE IF EXISTS `albuminfosong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albuminfosong` (
  `idAlbumInfoSong` int(11) NOT NULL AUTO_INCREMENT,
  `idAlbumInfo` int(11) DEFAULT NULL,
  `iTrack` int(11) DEFAULT NULL,
  `strTitle` text,
  `iDuration` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAlbumInfoSong`),
  KEY `idxAlbumInfoSong_1` (`idAlbumInfo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albuminfosong`
--

LOCK TABLES `albuminfosong` WRITE;
/*!40000 ALTER TABLE `albuminfosong` DISABLE KEYS */;
/*!40000 ALTER TABLE `albuminfosong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `albumview`
--

DROP TABLE IF EXISTS `albumview`;
/*!50001 DROP VIEW IF EXISTS `albumview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `albumview` (
  `idAlbum` tinyint NOT NULL,
  `strAlbum` tinyint NOT NULL,
  `strMusicBrainzAlbumID` tinyint NOT NULL,
  `strArtists` tinyint NOT NULL,
  `strGenres` tinyint NOT NULL,
  `iYear` tinyint NOT NULL,
  `strMoods` tinyint NOT NULL,
  `strStyles` tinyint NOT NULL,
  `strThemes` tinyint NOT NULL,
  `strReview` tinyint NOT NULL,
  `strLabel` tinyint NOT NULL,
  `strType` tinyint NOT NULL,
  `strImage` tinyint NOT NULL,
  `iRating` tinyint NOT NULL,
  `bCompilation` tinyint NOT NULL,
  `iTimesPlayed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `art`
--

DROP TABLE IF EXISTS `art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `art` (
  `art_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) DEFAULT NULL,
  `media_type` text,
  `type` text,
  `url` text,
  PRIMARY KEY (`art_id`),
  KEY `ix_art` (`media_id`,`media_type`(20),`type`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art`
--

LOCK TABLES `art` WRITE;
/*!40000 ALTER TABLE `art` DISABLE KEYS */;
/*!40000 ALTER TABLE `art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist` (
  `idArtist` int(11) NOT NULL AUTO_INCREMENT,
  `strArtist` varchar(256) DEFAULT NULL,
  `strMusicBrainzArtistID` text,
  `strBorn` text,
  `strFormed` text,
  `strGenres` text,
  `strMoods` text,
  `strStyles` text,
  `strInstruments` text,
  `strBiography` text,
  `strDied` text,
  `strDisbanded` text,
  `strYearsActive` text,
  `strImage` text,
  `strFanart` text,
  `lastScraped` varchar(20) DEFAULT NULL,
  `dateAdded` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idArtist`),
  UNIQUE KEY `idxArtist1` (`strMusicBrainzArtistID`(36)),
  KEY `idxArtist` (`strArtist`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`xbmc`@`localhost`*/ /*!50003 TRIGGER tgrDeleteArtist AFTER delete ON artist FOR EACH ROW BEGIN  DELETE FROM album_artist WHERE album_artist.idArtist = old.idArtist;  DELETE FROM song_artist WHERE song_artist.idArtist = old.idArtist;  DELETE FROM discography WHERE discography.idArtist = old.idArtist;  DELETE FROM art WHERE media_id=old.idArtist AND media_type='artist'; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `artistview`
--

DROP TABLE IF EXISTS `artistview`;
/*!50001 DROP VIEW IF EXISTS `artistview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `artistview` (
  `idArtist` tinyint NOT NULL,
  `strArtist` tinyint NOT NULL,
  `strMusicBrainzArtistID` tinyint NOT NULL,
  `strBorn` tinyint NOT NULL,
  `strFormed` tinyint NOT NULL,
  `strGenres` tinyint NOT NULL,
  `strMoods` tinyint NOT NULL,
  `strStyles` tinyint NOT NULL,
  `strInstruments` tinyint NOT NULL,
  `strBiography` tinyint NOT NULL,
  `strDied` tinyint NOT NULL,
  `strDisbanded` tinyint NOT NULL,
  `strYearsActive` tinyint NOT NULL,
  `strImage` tinyint NOT NULL,
  `strFanart` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `strPath` text,
  `strScraperPath` text,
  `strContent` text,
  `strSettings` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discography`
--

DROP TABLE IF EXISTS `discography`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discography` (
  `idArtist` int(11) DEFAULT NULL,
  `strAlbum` text,
  `strYear` text,
  KEY `idxDiscography_1` (`idArtist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discography`
--

LOCK TABLES `discography` WRITE;
/*!40000 ALTER TABLE `discography` DISABLE KEYS */;
/*!40000 ALTER TABLE `discography` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `idGenre` int(11) NOT NULL AUTO_INCREMENT,
  `strGenre` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`idGenre`),
  KEY `idxGenre` (`strGenre`(255))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Karaoke');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karaokedata`
--

DROP TABLE IF EXISTS `karaokedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `karaokedata` (
  `iKaraNumber` int(11) DEFAULT NULL,
  `idSong` int(11) DEFAULT NULL,
  `iKaraDelay` int(11) DEFAULT NULL,
  `strKaraEncoding` text,
  `strKaralyrics` text,
  `strKaraLyrFileCRC` text,
  KEY `idxKaraNumber` (`iKaraNumber`),
  KEY `idxKarSong` (`idSong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karaokedata`
--

LOCK TABLES `karaokedata` WRITE;
/*!40000 ALTER TABLE `karaokedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `karaokedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `path`
--

DROP TABLE IF EXISTS `path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `path` (
  `idPath` int(11) NOT NULL AUTO_INCREMENT,
  `strPath` varchar(512) DEFAULT NULL,
  `strHash` text,
  PRIMARY KEY (`idPath`),
  KEY `idxPath` (`strPath`(255))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `path`
--

LOCK TABLES `path` WRITE;
/*!40000 ALTER TABLE `path` DISABLE KEYS */;
INSERT INTO `path` VALUES (1,'{{ media_path }}/{{ music_folder }}/','');
/*!40000 ALTER TABLE `path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `idSong` int(11) NOT NULL AUTO_INCREMENT,
  `idAlbum` int(11) DEFAULT NULL,
  `idPath` int(11) DEFAULT NULL,
  `strArtists` text,
  `strGenres` text,
  `strTitle` varchar(512) DEFAULT NULL,
  `iTrack` int(11) DEFAULT NULL,
  `iDuration` int(11) DEFAULT NULL,
  `iYear` int(11) DEFAULT NULL,
  `dwFileNameCRC` text,
  `strFileName` text,
  `strMusicBrainzTrackID` text,
  `iTimesPlayed` int(11) DEFAULT NULL,
  `iStartOffset` int(11) DEFAULT NULL,
  `iEndOffset` int(11) DEFAULT NULL,
  `idThumb` int(11) DEFAULT NULL,
  `lastplayed` varchar(20) DEFAULT NULL,
  `rating` char(1) DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`idSong`),
  UNIQUE KEY `idxSong7` (`idAlbum`,`strMusicBrainzTrackID`(36)),
  KEY `idxSong` (`strTitle`(255)),
  KEY `idxSong1` (`iTimesPlayed`),
  KEY `idxSong2` (`lastplayed`),
  KEY `idxSong3` (`idAlbum`),
  KEY `idxSong6` (`idPath`,`strFileName`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`xbmc`@`localhost`*/ /*!50003 TRIGGER tgrDeleteSong AFTER delete ON song FOR EACH ROW BEGIN  DELETE FROM song_artist WHERE song_artist.idSong = old.idSong;  DELETE FROM song_genre WHERE song_genre.idSong = old.idSong;  DELETE FROM karaokedata WHERE karaokedata.idSong = old.idSong;  DELETE FROM art WHERE media_id=old.idSong AND media_type='song'; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `song_artist`
--

DROP TABLE IF EXISTS `song_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song_artist` (
  `idArtist` int(11) DEFAULT NULL,
  `idSong` int(11) DEFAULT NULL,
  `strJoinPhrase` text,
  `boolFeatured` int(11) DEFAULT NULL,
  `iOrder` int(11) DEFAULT NULL,
  `strArtist` text,
  UNIQUE KEY `idxSongArtist_1` (`idSong`,`idArtist`),
  UNIQUE KEY `idxSongArtist_2` (`idArtist`,`idSong`),
  KEY `idxSongArtist_3` (`boolFeatured`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_artist`
--

LOCK TABLES `song_artist` WRITE;
/*!40000 ALTER TABLE `song_artist` DISABLE KEYS */;
/*!40000 ALTER TABLE `song_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_genre`
--

DROP TABLE IF EXISTS `song_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song_genre` (
  `idGenre` int(11) DEFAULT NULL,
  `idSong` int(11) DEFAULT NULL,
  `iOrder` int(11) DEFAULT NULL,
  UNIQUE KEY `idxSongGenre_1` (`idSong`,`idGenre`),
  UNIQUE KEY `idxSongGenre_2` (`idGenre`,`idSong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_genre`
--

LOCK TABLES `song_genre` WRITE;
/*!40000 ALTER TABLE `song_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `song_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `songartistview`
--

DROP TABLE IF EXISTS `songartistview`;
/*!50001 DROP VIEW IF EXISTS `songartistview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `songartistview` (
  `idSong` tinyint NOT NULL,
  `idArtist` tinyint NOT NULL,
  `strArtist` tinyint NOT NULL,
  `strMusicBrainzArtistID` tinyint NOT NULL,
  `boolFeatured` tinyint NOT NULL,
  `strJoinPhrase` tinyint NOT NULL,
  `iOrder` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `songview`
--

DROP TABLE IF EXISTS `songview`;
/*!50001 DROP VIEW IF EXISTS `songview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `songview` (
  `idSong` tinyint NOT NULL,
  `strArtists` tinyint NOT NULL,
  `strGenres` tinyint NOT NULL,
  `strTitle` tinyint NOT NULL,
  `iTrack` tinyint NOT NULL,
  `iDuration` tinyint NOT NULL,
  `iYear` tinyint NOT NULL,
  `dwFileNameCRC` tinyint NOT NULL,
  `strFileName` tinyint NOT NULL,
  `strMusicBrainzTrackID` tinyint NOT NULL,
  `iTimesPlayed` tinyint NOT NULL,
  `iStartOffset` tinyint NOT NULL,
  `iEndOffset` tinyint NOT NULL,
  `lastplayed` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `comment` tinyint NOT NULL,
  `idAlbum` tinyint NOT NULL,
  `strAlbum` tinyint NOT NULL,
  `strPath` tinyint NOT NULL,
  `iKaraNumber` tinyint NOT NULL,
  `iKaraDelay` tinyint NOT NULL,
  `strKaraEncoding` tinyint NOT NULL,
  `bCompilation` tinyint NOT NULL,
  `strAlbumArtists` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `idVersion` int(11) DEFAULT NULL,
  `iCompressCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (46,0);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `albumartistview`
--

/*!50001 DROP TABLE IF EXISTS `albumartistview`*/;
/*!50001 DROP VIEW IF EXISTS `albumartistview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`xbmc`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `albumartistview` AS select `album_artist`.`idAlbum` AS `idAlbum`,`album_artist`.`idArtist` AS `idArtist`,`artist`.`strArtist` AS `strArtist`,`artist`.`strMusicBrainzArtistID` AS `strMusicBrainzArtistID`,`album_artist`.`boolFeatured` AS `boolFeatured`,`album_artist`.`strJoinPhrase` AS `strJoinPhrase`,`album_artist`.`iOrder` AS `iOrder` from (`album_artist` join `artist` on((`album_artist`.`idArtist` = `artist`.`idArtist`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `albumview`
--

/*!50001 DROP TABLE IF EXISTS `albumview`*/;
/*!50001 DROP VIEW IF EXISTS `albumview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`xbmc`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `albumview` AS select `album`.`idAlbum` AS `idAlbum`,`album`.`strAlbum` AS `strAlbum`,`album`.`strMusicBrainzAlbumID` AS `strMusicBrainzAlbumID`,`album`.`strArtists` AS `strArtists`,`album`.`strGenres` AS `strGenres`,`album`.`iYear` AS `iYear`,`album`.`strMoods` AS `strMoods`,`album`.`strStyles` AS `strStyles`,`album`.`strThemes` AS `strThemes`,`album`.`strReview` AS `strReview`,`album`.`strLabel` AS `strLabel`,`album`.`strType` AS `strType`,`album`.`strImage` AS `strImage`,`album`.`iRating` AS `iRating`,`album`.`bCompilation` AS `bCompilation`,min(`song`.`iTimesPlayed`) AS `iTimesPlayed` from (`album` left join `song` on((`album`.`idAlbum` = `song`.`idAlbum`))) group by `album`.`idAlbum` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `artistview`
--

/*!50001 DROP TABLE IF EXISTS `artistview`*/;
/*!50001 DROP VIEW IF EXISTS `artistview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`xbmc`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `artistview` AS select `artist`.`idArtist` AS `idArtist`,`artist`.`strArtist` AS `strArtist`,`artist`.`strMusicBrainzArtistID` AS `strMusicBrainzArtistID`,`artist`.`strBorn` AS `strBorn`,`artist`.`strFormed` AS `strFormed`,`artist`.`strGenres` AS `strGenres`,`artist`.`strMoods` AS `strMoods`,`artist`.`strStyles` AS `strStyles`,`artist`.`strInstruments` AS `strInstruments`,`artist`.`strBiography` AS `strBiography`,`artist`.`strDied` AS `strDied`,`artist`.`strDisbanded` AS `strDisbanded`,`artist`.`strYearsActive` AS `strYearsActive`,`artist`.`strImage` AS `strImage`,`artist`.`strFanart` AS `strFanart` from `artist` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `songartistview`
--

/*!50001 DROP TABLE IF EXISTS `songartistview`*/;
/*!50001 DROP VIEW IF EXISTS `songartistview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`xbmc`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `songartistview` AS select `song_artist`.`idSong` AS `idSong`,`song_artist`.`idArtist` AS `idArtist`,`artist`.`strArtist` AS `strArtist`,`artist`.`strMusicBrainzArtistID` AS `strMusicBrainzArtistID`,`song_artist`.`boolFeatured` AS `boolFeatured`,`song_artist`.`strJoinPhrase` AS `strJoinPhrase`,`song_artist`.`iOrder` AS `iOrder` from (`song_artist` join `artist` on((`song_artist`.`idArtist` = `artist`.`idArtist`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `songview`
--

/*!50001 DROP TABLE IF EXISTS `songview`*/;
/*!50001 DROP VIEW IF EXISTS `songview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`xbmc`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `songview` AS select `song`.`idSong` AS `idSong`,`song`.`strArtists` AS `strArtists`,`song`.`strGenres` AS `strGenres`,`song`.`strTitle` AS `strTitle`,`song`.`iTrack` AS `iTrack`,`song`.`iDuration` AS `iDuration`,`song`.`iYear` AS `iYear`,`song`.`dwFileNameCRC` AS `dwFileNameCRC`,`song`.`strFileName` AS `strFileName`,`song`.`strMusicBrainzTrackID` AS `strMusicBrainzTrackID`,`song`.`iTimesPlayed` AS `iTimesPlayed`,`song`.`iStartOffset` AS `iStartOffset`,`song`.`iEndOffset` AS `iEndOffset`,`song`.`lastplayed` AS `lastplayed`,`song`.`rating` AS `rating`,`song`.`comment` AS `comment`,`song`.`idAlbum` AS `idAlbum`,`album`.`strAlbum` AS `strAlbum`,`path`.`strPath` AS `strPath`,`karaokedata`.`iKaraNumber` AS `iKaraNumber`,`karaokedata`.`iKaraDelay` AS `iKaraDelay`,`karaokedata`.`strKaraEncoding` AS `strKaraEncoding`,`album`.`bCompilation` AS `bCompilation`,`album`.`strArtists` AS `strAlbumArtists` from (((`song` join `album` on((`song`.`idAlbum` = `album`.`idAlbum`))) join `path` on((`song`.`idPath` = `path`.`idPath`))) left join `karaokedata` on((`song`.`idSong` = `karaokedata`.`idSong`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-21  2:06:11
