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
 prenomClient varchar(254),
 constraint PK_CLEINT primary key (idClient)
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
