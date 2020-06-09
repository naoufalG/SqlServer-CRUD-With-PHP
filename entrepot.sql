-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 04, 2018 at 12:42 PM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `entrepot`
--
Create database Entrepot
ON Primary
(name=F1_data, filename="C:\datafiles.mdf", size=100MB, maxsize=200MB, filegrowth=10%)
filegroup MyDataGroup
(name=F2_data, filename="C:\datafiles2.ndf", size=20MB, maxsize=50MB, filegrowth=10%)
Log ON
(name=F_log,filename="C:\logfiles.ldf",size=10MB,filegrowth=10%)


-- --------------------------------------------------------

use Entrepot
if exists(select name from sys.tables where name like 'Client')
Begin
Drop table Client
End
if exists(select name from sys.tables where name like 'Employe')
Begin
Drop table Employe
End
if exists(select name from sys.tables where name like 'Manutentionnaire')
Begin
Drop table Manutentionnaire
End
if exists(select name from sys.tables where name like ' Commercial ')
Begin
Drop table Commercial
End
if exists(select name from sys.tables where name like ' Entrepot ')
Begin
Drop table Entrepot
End
if exists(select name from sys.tables where name like ' Magasinier ')
Begin
Drop table Magasinier
End

--
-- Table structure for table `administrateur`
--

create table Administrateur (
 idEmploye int,
 nomAdmin varchar(254),
 prenomAdmin varchar(254),
 constraint PK_ADMINISTRATEUR primary key (idEmploye)
)


-- --------------------------------------------------------

--
-- Table structure for table `client`
--

create table Client (
 idClient int,
 nomClient varchar(254),
 prenomClient varchar(254)
)

-- --------------------------------------------------------

--
-- Table structure for table `Commercial`
--

create table Commercial (
 idEmploye int,
 nomCommercial varchar(254),
 prenomCommercial varchar(254),
 constraint PK_COMMERCIAL primary key (idEmploye)
)


-- --------------------------------------------------------

--
-- Table structure for table `Employe`
--

create table Employe (
 idEmploye int,
 Ent_idEntrepot int,
 nomEmploye varchar(254),
 prenomEmploye varchar(254),
 idEntrepot int,
 constraint PK_EMPLOYE primary key (idEmploye)
 constraint FK_EMPLOYE foreign key (idEntrepot)
)

-- --------------------------------------------------------

--
-- Table structure for table `entrepot`
--

create table Entrepot (
 idEntrepot int,
 nomEntrepot varchar(254),
 adresseEntrepot varchar(254) ,
 constraint PK_ENTREPOT primary key nonclustered (idEntrepot)
)


-- --------------------------------------------------------

--
-- Table structure for table `manutentionnaire`
--

create table Manutentionnaire (
 idEmploye int,
 nomManu varchar(254),
 prenomManu varchar(254),
 constraint PK_MANUTENTIONNAIRE primary key (idEmploye)
)

-- --------------------------------------------------------

--
-- Table structure for table `magasinier`
--
create table Magasinier (
 idEmploye int,
 nomMagasinier varchar(254),
 prenomMagasinier varchar(254),
 constraint PK_MAGASINIER primary key (idEmploye)
)
