-- MySQL dump 10.13  Distrib 5.6.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: fondation_norsys
-- ------------------------------------------------------
-- Server version	5.6.33-0ubuntu0.14.04.1

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
-- Table structure for table `ACTIVITE`
--

DROP TABLE IF EXISTS `ACTIVITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACTIVITE` (
  `ID_ACTIVITE` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_ACTIVITE` date DEFAULT NULL,
  `DATE_FIN` date DEFAULT NULL,
  `ETAT` varchar(255) DEFAULT NULL,
  `INTITULE` varchar(255) DEFAULT NULL,
  `LIEU` varchar(255) DEFAULT NULL,
  `ID_ANIMATEUR` int(11) DEFAULT NULL,
  `ID_COMPOSANTE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ACTIVITE`),
  KEY `FKCBF1E2FB896D0094` (`ID_ANIMATEUR`),
  KEY `FKCBF1E2FB1EF7EC2B` (`ID_COMPOSANTE`),
  CONSTRAINT `FKCBF1E2FB1EF7EC2B` FOREIGN KEY (`ID_COMPOSANTE`) REFERENCES `COMPOSANTE` (`ID_COMPOSANTE`),
  CONSTRAINT `FKCBF1E2FB896D0094` FOREIGN KEY (`ID_ANIMATEUR`) REFERENCES `COLLABORATEUR` (`ID_COLLABORATEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTIVITE`
--

LOCK TABLES `ACTIVITE` WRITE;
/*!40000 ALTER TABLE `ACTIVITE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACTIVITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BENIFICIAIRE`
--

DROP TABLE IF EXISTS `BENIFICIAIRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BENIFICIAIRE` (
  `ID_BENIFICIAIRE` int(11) NOT NULL AUTO_INCREMENT,
  `CIN` varchar(255) DEFAULT NULL,
  `ADRESSE` varchar(255) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `NUMERO_TELEPHONE` varchar(255) DEFAULT NULL,
  `PAYS` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `VILLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_BENIFICIAIRE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BENIFICIAIRE`
--

LOCK TABLES `BENIFICIAIRE` WRITE;
/*!40000 ALTER TABLE `BENIFICIAIRE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BENIFICIAIRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BENIFICIAIRE_ACTIVITE`
--

DROP TABLE IF EXISTS `BENIFICIAIRE_ACTIVITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BENIFICIAIRE_ACTIVITE` (
  `ID_BENIFICIAIRE` int(11) NOT NULL,
  `ID_ACTIVITE` int(11) NOT NULL,
  KEY `FKCE983F188E0F723F` (`ID_ACTIVITE`),
  KEY `FKCE983F18F2A4BECD` (`ID_BENIFICIAIRE`),
  CONSTRAINT `FKCE983F188E0F723F` FOREIGN KEY (`ID_ACTIVITE`) REFERENCES `ACTIVITE` (`ID_ACTIVITE`),
  CONSTRAINT `FKCE983F18F2A4BECD` FOREIGN KEY (`ID_BENIFICIAIRE`) REFERENCES `BENIFICIAIRE` (`ID_BENIFICIAIRE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BENIFICIAIRE_ACTIVITE`
--

LOCK TABLES `BENIFICIAIRE_ACTIVITE` WRITE;
/*!40000 ALTER TABLE `BENIFICIAIRE_ACTIVITE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BENIFICIAIRE_ACTIVITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BILAN`
--

DROP TABLE IF EXISTS `BILAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BILAN` (
  `ID_BILAN` int(11) NOT NULL AUTO_INCREMENT,
  `FICHIER_BILAN` varchar(255) DEFAULT NULL,
  `INTITULE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ID_PROJET` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_BILAN`),
  KEY `FK3C463D27282A421` (`ID_PROJET`),
  CONSTRAINT `FK3C463D27282A421` FOREIGN KEY (`ID_PROJET`) REFERENCES `PROJET` (`ID_PROJET`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BILAN`
--

LOCK TABLES `BILAN` WRITE;
/*!40000 ALTER TABLE `BILAN` DISABLE KEYS */;
/*!40000 ALTER TABLE `BILAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COLLABORATEUR`
--

DROP TABLE IF EXISTS `COLLABORATEUR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COLLABORATEUR` (
  `TYPE_COLLABORATEUR` varchar(31) NOT NULL,
  `ID_COLLABORATEUR` int(11) NOT NULL AUTO_INCREMENT,
  `CIN` varchar(255) DEFAULT NULL,
  `ADRESSE` varchar(255) DEFAULT NULL,
  `DATE_NAISSANCE` date DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `LIEU_NAISSANCE` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `NUMERO_TELEPHONE` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PHOTO` longblob,
  `PRENOM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_COLLABORATEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLLABORATEUR`
--

LOCK TABLES `COLLABORATEUR` WRITE;
/*!40000 ALTER TABLE `COLLABORATEUR` DISABLE KEYS */;
INSERT INTO `COLLABORATEUR` VALUES ('Administrateur',1,'A1111','Daoudiate imm3 Marrakech','1975-05-12','Messadi@norsys.fr','Marrakech','Messadi','0666297841','admin','ÿØÿà\0JFIF\0\0H\0H\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0€\0€\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\07\0\0\0\0\0\0\0!\"1AQaq#2‘BR¡ÁÑ$3±áðñÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0#\0\0\0\0\0\0\0\0\0\0!1A\"Q2qÿÚ\0\0\0?\0ª-öüãjk·[3Žšõ²ÝœmNVËgnšmÞ‘?’®\"’¶hñëMpmxa½´÷÷¨j´º/ö÷\"§êjÃ£ÁO½XQ-àcjŠòÆ („ÔFÏt¡#$ÒÕÚé%ötÆÖÒÁ\rŽ£òi“ŠÂ\rDia)IÔ¿ö~)Nàê#·¡.rÚÆ3äñG‰/ìÏZÓÒ8Œ¾€\n¾ã«R…˜´:”¸Ü¥†³Õ‘“ñEQ%.¥A¦õ46ÂÇsC¤Ú–µ•ò’6ÅR¯°?\Z¹ùy\nÒ§Ou8ø¬D˜ô7„¨òËA\n\ZK ÿ\0zœ»BÕœ²¯êPÍAzÖë_U²7ß™É5¦gÂ²qôY’Dk m’¢^IéÉí‘âœ¤[¤ê Œ‚*‚m’œ$©=#rjáþÝWs‚å²j³\"8²£’¤ÿ\0â¦Ë…%ÊCšÛâÏLµÔ•~µ†ÞŒŒeÍð*Ú™mÆp¥«…°(œŒãµ*Ó’J¾ãlÆziRáoÆv«Nã][šP¸ÂPÏúª¡ìJ­\rÖ›Ûµ:Ûmý¶¨˜C§js·Ã\0\rª,¶SŠ?`öZK7æÒBFZÈ&Š9{‹Ý.Gn@Á÷>1Pnp‘\'ˆã²¥èO «#Ú—g—?-}§´à?–Èò;ŸÞ“¤ÑBíëÐ.ásrAWÕ	Zº—äj¾[ÉÐ ²Oc[5n”ò‰`mõw4Q¾œãz¶J±ß5BiÅ°¼èjZ‚›í¥)ÜÔYj‚Y>øìE0/†æ%$ê>µÞ\'\n+ ¬à¨õVòG¸1J+òÕô‡NÝÀß÷¡rY”·”‚â—žûU¤›xÈ:S¿šõ’é:qñZ¬ßÆÊÍîde§§\0n}iŸƒ®†Ù™šŽP°NN2“ÜW{Õ‘¢Ö´Kñd&#èºOþŠj®KB®uÙô°åIa ‚…¤)$y„OƒßjÇOEÃ†£-\'%¼¶J2ëaÄ‘Š“ZzÒ¤Whí02êÒ€v\ZŽ)BçH\ZdâÖã]/Ãx¯“¢r”’9‡·íA¡‘>ÈÂÿ\09B¾FÕ\\-$ÉrâÒÙaÚ¢€µ5Äh${Š¯­\\SeYh&cÊÖtôƒÓóéS/¼yÓôà•>þœ•Ò*\'6ëIM®&xîbaÏhZ”€:Nzp—Í±BqwRp<Žª/‰ÛâÖÜI†pB\0o«¤Š•-õÉ³Ä%¤²ë+Ð¦ÑØzQ8r’h,MrëôµGCP›È}Í\" Ã?òí÷Ý ÔÄ§5žÊ}6\"´Î+b@•€â1šÝE}\'I&…<Þç\0“Fy89 \n*|6NVêsìkt{h=IJ†W·f\Zf ‚v4ýpºFt¯O¹4¹vŠdEÖéÞ›BoL~þ\Z\\Ø‰Ã’‹î\0R¾fY8Ç¥?D˜ÌØÈy¥t¬dÜUaL†óì¸¶Û!-òOµ:Ø/s›¾[â¾RÓKh©Á§¿µ.õÛµZô9¹i·”Ò7uek\'|“IrmQ`ªG%JHyedxúSûÓâˆ®<§‘Ë@Ü“ÚªŽ ãø+SìÛc©çQž²:~hñ7^gi={+˜W\nR\\mÂFqéS%N2uiQ:óPƒm’¹M¶Ûj*Y\0`gÎ*Ì‘üøt»íOi ¤ŸLÕ•S½¶šô%Yå¸‹ìE¸¸‘V+2Ü˜»‹¡¡´%Yòô—oàÛÅ»ˆ‚g°[äz³¯ƒM–Hî·yqEôr_AJ{“àæ‘›ìô‹>>*©æÒË¡‹{/+íå‚½D—~”Ë<Æâ-cØv©N!Çm,†Q­Ihö¥i{äõ­S\'®nÁ¶0UúŸõSJOÈêlÕ|y(<P«rÀìu+ö¦tÅ]\"ó›I\0w¤Æ¸F*eilÉyÂF\\Zº‰§«DDÀaÆÒ9î=ñE\\};~D®,ºÈqjŠÓÊh62²ƒK°Þ™aÃl‘5Å\0RV½€>qŒ\n|\\&¹¼¥!*Â†w©\"Ñ!¢yAA\'àŠ9¤4›9×	Ïž´­¼ÿ\0GWÿ\0(ŠÙS1Kn7£)ÀI9\"›Zµ.3KSŠÉQÉÚ€]°ŒczÍížãÑ¯	…\"BVÞ5yÏm¨§\\…²Óø‡“…ƒ†ÖŽú¨%¥¨²Øy©RÌT6T´­\'‘àW’í7+kÑe^¦¼Ö PUtcþôs‚n¹´OŸ;_OB…ÇˆfÌkBup}DëØš%Â‘6ÐdÔ€·òÒ¤âÛRi—ãI8JÔ0OéL¼våJ‘HO1<Í~N<S\\ñ©6\Zå‘UVy¶ØHgžÊšK‡J¡’@óì)Ùí7ñL¯˜Ø8ïTÍóˆ¤9uBËŒ´Œ\r\nN*Ç±!.p$e$Ô½üoHsXõEíFTåöfíé;‚­°UƒûÔ…º*+Œ¥¥Á¸ä\Z­ÿ\03®*Cê%*:@9ÇíF$qÄ/Á4µ¹!)ÀAI\0Ÿšê~¥³‡æ|jaîwà±,syÐQžýÍ1ÛxeCoÕqÀœBåÉ‡Û|¤:Òµ\0¶4õù’B{ø®EÇ\nhìrY>Óà˜Z%xBOõ\Z°¢žÇÖ—¤ÜUq¸&2Tymõ/Úº½Å1cIS.Ž^Ù]tˆ’Ô¶\'l’rrhõ¾è‡[Ò AìAþõ^^¸¸»qOà›Kš{’p*d;ž¨¡O=¥Õd§°¢rfÇiÓ“¡A\'oZG¼KJœ)&º&ñÏR™Ô\nñGóP	Ë%×5(‚?µl®Ì¦¸!ðË2	_,¸ ŒŠká™e›Zm à\nÒ¶ÜÁÏÅwµž—\n[í™\nQ(B¶Áðk<1rŒ›o)Ç\ZC¼Å,\rUØÀ¥âã^šþbs-^ÛÚð/q¤7ul!JmÄ…	Ù5\'‚¸>UñõÌ2•\Z#GIqrÏ ©[œÆg9:›q·ºRB³Ÿ«bXøv,ÛHKmXò£¹?½#*Q={*Ä«K’ÑXq$¸2˜1ed¶zT‘ºOÏø Òø–Y·³2\nc2)e½‡ê|ÒÏ<—’Nýë:°1Nˆ™Zò:SÙ%rzÊG¸TW•`\0OŠÁ_B«‘WÑø4mì#\nÝÍ®ðÉ*Ãn\nÏ½ZÈ<öÖ¦Ôp¡*‡Jˆ\r¬·qV/	q3“LwOÕhn©?î¹ÿ\0+ß$[ñí%Å„R¹ä=Ò²2JÊFk‚’ÍÉÂón)ÌŒ+&š™S2!XP×žŽÓosš*iÃüÍ9ý;\ZŽ^ü–_ðÿ\0-¿§\ZJÖ„åc’@½u‰ŽIcFÓ¾\nÔ­=éî]áÕ´´¹)Õ¨$l2(“\'`“€„ø£èÆµåœ­ö´Âq+qeJ@$çÈÅ-Þ¥¡´ºµàumL7iæ:–’zÖ\0øªþõ!RqDô¥@sš,sÉö*ëHãÅ×T¢s½x(ë€­É®œô´@ûfÁJ+è$\Z#ótŠ\Z¹Ëm>‰yX¡ÀiN<žõª•©]ö_è/³p¾³ï]ö#õ¨š»Jë«$P¦Gr®•V‡þ‰­utŸzòÏÒã\rÁú?S†e×øJYÃjs–¿…mþE\n«ØŠÃkS/%CºT>A¬¥µ£SÓÙv²¯Ë^R]*Â{çÈ£n°ÌÈaÆÝ8ÙB‡Ç\\{õ•‰m(ã`äx>EfØÞq·ˆRšäÔötbº&¿mp-@¿”z½f3qa6]w%ÄŒçÅvþÂÒœHJNvÍ¼_ËˆSÎ¢¡CÅjM„é/ÅÍSî+\rSœšxk‘nJ<•ÑKd$s\\ùù¡\\I!%h`wÎ¯Ò¨Æ¾É\"|êÀ)­Ç|úV™\0cÉ¯Õq!²•¿À®z°+\n;šÐë5#[WT¯aQB« WŠA´HÕµlµt\ná«&·QÎ‘DGr­ÓY;œ\\T®±[)]h‡ñoä’9Š&§sß–¯_Š´$²ÄæâT•%C)ZNr+çÒwS7ñŒ›*„wŠ†OÚw(ø©³aåöŸ#ñä×Lq¸ðñZò” ûâ ³aCJÔ¾¥Q¥q%½ØÉ|Ée(WbUŠSâ1\rG·”©Ã÷:7	øõ4‰Š}\rt‘ÒûubÖÙe)â6HñóHŽ:·S®­GsZ©kyÂãª*ZŽIQÉ5©=Xô«\"!\\ŽÄšÆ­«;ŠÓ4{#*5¡5å\ZæUBØIÿÙ','Ahmed'),('Responsable',2,'R1111','Saada App 4 Imm 34 Marrakech','1978-04-10','Elkhaily@norsys.fr','Marrakech','Elkhaily','0666148596','responsable1','ÿØÿà\0JFIF\0\0H\0H\0\0ÿÛ\0C\0ÿÛ\0CÿÀ\0\0€\0€\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0	\n\0ÿÄ\0C\0\0\0!\01\"	AQ2aq‘#$\n%\'¡±ð&3BRbÁá4CEeÑÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿÄ\0F\0	\0\0\0\0!1A\"Qa2q‘ð¡ÁÑ#%B±²Òá$35Rbr’³ñC‚¢4cÂÿÚ\0\0\0?\0ê·\\u³UíV½èT+æ«J¤SjŒ3v)3¥Ò©Ï©´Õ¬‚ó®«Ü¢rçÛªÃ:ÎsZ|Ö²+^¢{*€¶õTõSýìnàŸŸSÜNµ$§v¤×ÔHVà¨Ô£>\n£yðBWˆó¦ÕúEÁÁ:sýAó×<hv\'PÛççËžàõÅEE­F¯,$“‘‡ÀÏƒŠ><gõã¯~Pç|¾²s$þiÙ6‘¦Ýí÷æ?ç\Zõw®ÊtcR«ž–ïxùZO\'9´p~½mùCœ‘ý¢÷äû“çö¤ìçÇïöaWúÅëŽí©Ô:ÖÃÁZ£Ð÷GOáƒ¿ç=xquËë$y\'ðc`§P[û}žì(Âk‚ˆÎ£ÖÀ\'¨_¯ÿ\0§óÇXEœôÌàŸÁðÂÂ•É\"ÞßŸç…¸miÇ:‹[$c8‹Därÿ\0‰ûƒÖÍŸgÛf/þK~çÙŒªD5k]×Ïùãè÷­%	#Q+CžËQ2Nqõ¤ýÇZž!Ï5[ë÷þÇ\nvP˜»@,=~ùOpZÔ¬ÿ\0¼jçàF¢qœù\"‘ãÇ^<Eþ°‚2±Bà€/n·ùî[•¨Õµ}‡ËPÉ)4Ÿ¹~Ýjx‹:<³Ðƒÿ\0Æ< EV,šˆóÆÜ.·žF£ÖŠxðÅçè|R>ý)õþw§ûIÁIünÈ¤Ù6¿ßŒ£¸-pÚ¥+Q«@çòÔAú})¯ü:Óò‹:¸ý\"ööGüUi{‡Y±çßŒC¸]q$ÿ\0¼Zæ1žcPÀ>8â“ç9þÝgò‡;$Û2{$÷~¦¬d“à<±“ýaµ§b±¨õâ±ÿ\0–5§v.M\'ÇüºÔñxÙ‹Û¥Â*E¤Ì±s„‹î3\\Çó¸••`–¡‘Ž3À¤ò@ÿ\0ã=xñx»}bæþI·þŸ>8òÅ3~lm¼?ço´?\\ufæÕ«\Zƒ]¾*Õ*=J­\"<ø¤¶Ì¶‘H©HJ\\SÔ, <ÓDmZU–ÇÓ‚S%ÎójœÚ†	ëšXerl¶#Cˆ0<k,qª5”½n\r;Œ8ÖÍD*<~1<„þ	Jääx>>ƒž†ñöÖc¹ñû‘ánÌ!°7öü0rIBR„)k$’”‘„Œ¦<ßúqÐPE½ÏŽ3#êT;^žü|µ1i\'ÝƒÂp	ÆÎéç¬é\'°?>8O´.ylývÇŠ‘ê¸TWù\nJpB€ð?\\Ž½§qq¹Ç—H7#º`ûñ³o\nÂ‚\nT± ’F1ŒñÖÅÉ\'T“P[–é·ÙŒå\'Á<Ÿ¹9¾çÖ€n?æy}¸pYŠ©ÒCCÌzßéêyb*ë7{ý¬h\rUËWRµz…ø\r¶â4öÚ…V¾µÂëÉa\r¢Ñ³ ÍšÓ¤¬)	y¶Š•/\0“ùgS	ªXVš‰&yäH\"\0O~VU6¶ö½¼IÃ*9Û0›è™M\rNuY!¶ŠHšP¤›\0ÒXF¦ã‘kÛ|\0j_Ö¨‹ŽÝZÒîjg¢žÌé´êŒxÛßŽdÇ–ðv—óÆv8+gtQÔãm©J‹*¥¨b`âL²VEÔB×BG\Z¯¤‘c{5†Þ6&~¡ãh‚Fü™ö¤ÙQ£ƒY&Ä(ŒJ\\–iîî7¿<H­ïwµãf?IÒ]fµª×Dy	‹&Ä¯\n…•¨¾c‰)A²o(pjRSè((8ÌwZ#ÂÏ“¥fE›RB•/MôŠG\Z„Ð²Í[ÚâHË\'?=¬AÛg®J*EšSM‘×3iìk#0°oîÜ÷uV$oaÔbUºÎ¤€¤œœr†8>ÓÈäxÏ<ô–äØ½?ž°Ytôb|­ÎànG†þøKiö\'!+ÉN’ |ÔçŸç¬’O3|$b\0)QÞRÃNÂ\n” `HH8ÎŸ¯ïžqÖC\0-¦øÀF7ÔÅGÝ„OºB’G¹CfãÁ\\gž½ëfúNÁýØñ™¨l~Nè\0Î8Éþüþ½b×ÀãeØ;a[>RB’•/9)8È ú‘ãŽ¼obO?>ün¤ sn[íø`¿Û¦Q­úp…((šô¢IANWøc‘œã)ŒŸ~Œðîùæ_â$?¸øo?ªûã/qËWó»P€Oã‘ÐHÆhT£•nÇ×h8ýÿ\0C·læ>n?r<4±pEÈìÀ=ÆÊ²âN2v``€8Ý€<gŸ§ACXawNÌj×ãÝíÂgâ£ó¤«\'‚IWßçƒät o`ya&²nFÇÂ‹é¯ÄFIüÀG‘÷ÿ\0‡Xvå÷cT³º€·¹÷8Ö¸ÑT©/·†P§]yÕ!\r6ÙRÖJ¸(NIð2HëQ©®¾6±;\\’:øsçÌ‹=“²{G6&ãÈ®<E¹ÚÛZø¥ÝuïCQ»™ÔõvëÙó—5;L¢U\\¤êïrÖ„	“¦Íj*\\üNÕÑªŒf^n3«>”YWX“è=\'Ð¥%rAÙLÂ«+àì¶ZüÖH\'Ï$MTô’¸´z¯¦J”ýv[Ž-¶€le<À•üqW\reU<´Ü*\rI®6«Ñs\"ö„§c	 #–$Ü[ž$ßnÿ\0\rš­J I³;z¬B«VÚfEr¿zÓên]uÚ¹}3¼/kÂµ-2ªW\ZW!¥%é2œSíüËryÂ†š¢sŽ&â^#«ës)ëÃÜ­»±\"ÙWLQÙD„\rÕ@¼7é\Zh¸c†éV’‰¨òzzAd‚ —²›…*ºÝÜŸYÙ‹_‘ÞØ˜g²}AhÌ©OÒ‘\"X‰*#¦WáÔ¦¥\r­Qé•\"\n±qÊ¬x´4µ>âQÒÐkbv$´™ƒ+(§vF¹±\0¨Þö\Zm{õ\0Øó |(¼[‘+©Lí#f#½\"H„l..ÈVÇpZ@Å[wŸð¸›«•&ë5M‘M¸ÞªÃfñH§Ê³¯z$¦CÓ—qµw[/­3Z–6%3ŸAVÆ˜Å™ñösÁ²°Jê˜hb_êXv±6²vG»fÒ {–6]ÍÓÎ²Îã\Z)`v¢­‹Ir…È\0épãK9Rl]Î e›ñïßáýWƒewEfT;¦Ñ8Òe@¦\\¯‰TuµiQê§F²E=o7‹	ò\Zª!©/¹)-9W/%M§¡²ŠŽ\nãø¹té‘gH¡¤@Ga#‘w)õ({Ì¼û€ŽiâoG9ÿ\0É#åò—ËÈ`©³\0ï\ZÇPT%ëR¤\r¹ž„;kî{D;¹Ó(\Zµ¡7kW5¸ûªW¦NŽª]ÝfW\ZA\\›rô¶ÜY~Ý¯¶Yw)uµ%èî<ÊÒ³Íò\\Ç$ªµð„f£©ÕŠ94oÉ¯ÈŠCX‹b-KWô––)!zJš}\"X¤tb·ƒ-Ã© Ž[íƒdÙ(FR”¥*u*ÂP»Ü\0ÇãŽ…õßf±F»q>õ)RNs’\0‘ôuîž~¥)ocRƒ(ÜRI ¤ÜeGíÿ\0Ç[G=ÔaMA•l@8øm‚É\n+Z·”ãò‚On°Z÷éóûqà¤mp·øøàëÛ²ÖÝ4P>kÒBÒs?‡ëG\'‘àý<tg‡¶òïóŸößœ~m›žwÈs[5##ñÈÇO·?R|gÏçú½ÄGôÞb/ÉÇî&Žp¬\Z×\0âÒÛ 6>¾à¥`ä«\0ù<êz½oµ¹c5¡\0î7ëîÆFò ŒùN\0\'€çŒu°RÛß	ÄÀ¸i¥[íÐ|ÿ\0Î2Gÿ\0h	÷ò~ßl“ôëb¶\0^äœd\\1Ñ`X›\\_lAÍeq÷SÜ±½?¹gZÖ=>‘M¾»µ¾h®.=^§s¤2i:?nUc`Ó®+š:DÉ)Z^ƒNsÛ…HI8Í3xxG%ÁE“7Ìâ V\Z•\n©U¸m`Ì)º´„ê¶%ÜÃ-ÅŒÕYŠxg$\neK¨5D–Ž˜Û¼\"¸LAÆ¥G­qwú9¤ÚO¢¶*ÏÒ{\Z×²mÊ<& S Q)±c)¨È)p¥ÙHG©!Å,nQR²Uƒô£^³éšª™>•Tå‹I\'}‰oXÝ¯¹;íìå¶.jùk*ÝRiÅ\néH–é\Z\04…HÖÈª\0°°é½Îø7Åªl¬q€$ðHÏý~½+av`,Ÿ-¶ç°Ûâ1¨ T:ÊlmÔßn_m¾e` ¡Ä„ù$’H’?oùôéªd&áÍúüŒ1ú2rd%Ï^¶¿+ïÿ\0òEM¨í<ò±´á9$gÈÆ	ÀúþÝ7štE¼–¹ß—=ïò|6ÆÐ%P©Þñåñµ¶ÄZ×ÞÝôw^¬êü+¾Î£¹=p•*=q4ªq©Å•OKÒ£)&LU´ód—Ò¿Qµ²Z\n]!`X”Fí[—±¢¨ˆlëué°\0-î¹êN%™vc™åÒEE<í˜P;4òÑ¡Ìj½˜lVÜˆÇzËn¿ðÙî9ÎèK\"Â~¹ƒ¬ºeH	¦Ù÷î•Tªn6r3¯-Ç/i”|ÝAis$²ëåÇšˆðewß£ž.~)¤~Ï¥dFjj–,ÏHQ¦Àì í.ö\r¤(Ü¶\0zNàx%¥A”ÁÙf´c\\j,© *CA 1¿u/ýYk‚-ŽáÖ)w‹tPêª´K‚™N¯Q*‘C‘jz¼6gÓ¦GuiÈrXúáÐ9éYRHe’)KÆYXìTØíåŠYeÅ«`GPHÝHòå~¶ÆÑM)QÒî9X!9Ç<ø<·ôé3¾i\";ó[t°•–“êz†Os€8ñ“žzÍÍ­Ó	*Ù†µ}˜ôœ:‚Â3Î8ääý?±ëÖ6¿A…\rƒsÜý¸8vìIÖ­7\0šì’®M\n°¡·ê:3Ã¿ÛywùÏûof?™}º}ã\nuùÄ/[5% áM×ØJòA¡Q•>žzÏõÞeäã÷\ZRµá#‘VÛöü>ü\nS‚T¤“Ï8ùóúý:	…öÀk”=ùÀ\0òO<9ãxý:P0Ña†»[H¿Ç“4Gq*p¶w{pÚyRÒ	^?/Yàç¯\"oÞÛž\Z4…ÝÂŸw…¾oŠšø#]•MO¯÷Õ¬w\rQúµÍwwvArdPÈ4ºev·ƒ•$!ˆŒÒ©ì5¤’PÓHB‚@Fb>BÒñG–DPÑetåí¨½Ç+±¹n¬w7ÇJz*£8,ž1ÿ\0Í©¨y\r†îª “Ôžð8èšÒ¸*r\"<ÃÉkzP¥l ©%8FqÆyê§ª‘¤ÓÉ[o`û¿àâk˜ÑS †}ß;àÇR›qµ\'rPBr\n\\*Â‡ ò@ƒàyèÄbErË½íãïÄbaÆÊ@\'{òñÃ¾r7#Ý¸ûÒIÈ$œ”îWŒŽ1Ïôè­:JÀ6A¾îŸn\0T¼H{ÂÄo?o³Í‰#åkÝÆà“ÆGé‚1õó×¤ªá“e\'ÈôÆÔÕýÁå×\rZÔ°Ìèy\"¾ÒU°()Å´°•”+‡åÁðqÏB**5(Ã@åaðó¾\nSÓ‡xÞ7/¬ßÙì=,>Ür5ñA E¸,ûáæçÕ*tv£ºcÔ]§F‹ø|ÂÄ·æ¥J–ËtùQã³‡œv´C	K}×KOÑ†Q\"Êîé\rªñ“¥5lå\\ú–#•ñaqv]äŠÓ‚€ :Ã•+r1\0^NgoúbÅ{¹*eý¹U¦æl¦ôæ™H‘3,„Iì¹ÔF$%¬‚ÊàÀŠPÜBIêíÌÇôú†=Ó.™7¾§PX_‘ëÌcŽ§¼R×Åš\ZiçÛªJê·ùXûñ*„âNóŽJSœŸëýúbTóé†â¨´aÞKò‹yóÇæZCŠPÂÎìœðF„àxúã¬ç–Bn	H\r°›y/²6î*Z2Î@#ñŽ·\"Ë¶ÀãPÄÈ¯~¸}¼!CZtçIBk’°”¬¨\Z[Ï´Ÿ\'ÆFq“ž:/Ã¶úï.uŸößTìd¹é÷Œ{Ü*Îµj8N7®µÓ•d)F‡IãAO?lgˆ¿¶³!þ1ö¤xoª#Uê¸ºúAÁà‘œŒç\0qý~‚€O,bgmºòkÛÏþ1©zAÚáŠp@Üœ<äþàô¢ [mc×\ry±¹ñù¶sd¸¤©-8–ÜJweH\n	 ++#øç¥P]…Á³=Û‚}ØU&˜ÜÇ³Y¯ËŸ\\BO„®“ÕtŽÜM%ú[pÜº{Â×—˜(ŠãK—Jbëÿ\0aËR\n À‡-Òƒ‚¡$ ƒÕSé§49‡Ó¤ne1e¹rÌjìK2­¿»­Mº5ïŽ¶ôPTú%áÙ§Q„Ô¶¯ï^wBIñ4ï¶œ]|ýdÐ}8[Qî-aÓ\ZuAIX\\I÷½¯Kke~“ûÑ\"¦\nv¾’“ÿ\0©*u¥Èk}ªPÍ;_D29ä”6¾3%sÖ»†\"‰.êŠurÝ™yƒqn›ãk¹m8¨¶Òèõú5]—’RéuSã¬¸„8ØièÎ©!hRv¨å$ç¦U‚C\'bÑ”hî †[s\rˆ>LÁ:n¯c›umØ0êTb+î0ÎÔó´ÏGèUË²ô¬7M¶mÚTÚÝf¢Þé*§Ó©ÑÜ—.Iaœ©ð†\ZZ°ØR‰ö„¨œuµk4Õtô”±´õR,Q ýfs¤ínñ\0_mùáØôY]IÙ•dK*…PMÉ&Ü<¹@k/ý ŽÒuŠéjÉíÓOuß¹™ÙDùM8Óš´XÑœqöØ*R¹X\Z)õ¯QÇR‚\ZW ã6¶gÂ™ÎAOÄéK’ÂéuUCÚ9è©eå\'¥ôØž½1ËxF£;\'(šI ¦b$›°–:uÒt·ô™Dql/uV.Uq?ÑÜÊ+#\Z£š“¤t·ä@\Zä¸ S+46Ÿšë5\Z½*Ý•#ð¦L‡ÛOÌ¨éä¸¶Àªó6¢¬WN¨]X\\^àïnvØžÉè¸J¿/Uš“2¥ÍYUËC¥dï]µ‹tø\r±W¿\nŽÿ\0oZ­–U\"”ŠÕ*Í®Ònè³#%QþUå@’ÍzõLJ›oÒÊV ¤¡òãjVå%\nøx âœ’–RÝ]TJÖæ‰n¶ekn	½eE^A™PLÂYhái©˜÷‹D¬XIç¤-˜mpÃ|h>³Ú¨ü>;Y¨¥Û]WL!TÜf*ÒXK³ªuGÔ¶€uxZ”½ØÞ¢ž|õÒœO¦Ïó(.Úa¢êæTn½%°÷cbž\n¦6ÅžiÉÒn	2°<¿|M¤BHHu*)Z°AJˆÁJr	ç¯@¯°ÆÉNŠC*Ø¯ßŒAµ<VÈ^G$ŸOœã¯\0!i,ÄcÆá­…²Ô•Ž|ìJqíJþ¯íÖornm»6V\0ŒHß³é²ŽB¿–vãÏû\n°7ppG<ãÇ×¢ü;o¯2ÑkZCþÛãz‘xø¼cUÜ’•üëÔ2‘•µ[ŒBö(¥T*A-î-œ§$œ}Î3ŽÜ@?Mf$ì‹¡>~º¨aÏÃ\0¶¤ïÜ²¯Ì8J’Ón\0ÏßíÛ ÁH¸¾1ëÕ~QíìñÂIi!@¸G¹`¨(+œm>3’>ýl.Fãž5r¬\'IÚöðû¯òpÝ•\">HRÒT…•,Œà’9@ÊRãŸéhã$¯–þCÛó´j˜€–7å¿óðñÄoî~ÒÓ{c·*çó\"µ{ÚúoT¹ªš‡¨ÊÚÍ^ß¸.*3/H¸§Ð\'Wm—P‹I¨;\Z	¨\"\ZÛ~KqŒE:Úu+¢sÜò®ŸÒ%e^Usf›£€ÌˆÊ’vqÂ¥·‹PmÕÜ2¥¯kã·½ðÛæœd•0#CO;©r#Ñ,Ï/EÝÔ\\–wfºØ®Øãç».â>W…ší~Æøqßôf«qUm+{V«7õÑG”õÉM‰¦í1º}FTÕ´ú)Ò¡ÊLw\n¦¤­(%^ªQÓÜ%Á¾—¦&oJÔ”³Å\ZO-*¤Uj#rvb*Ü‚«\"ÙƒfgÜiè‹/v¤Í=Õñ$scDrÅi#pÆ{“6ã¨·ga§¼mb_Æû„Ôã4ó¶ç¬ëÚÍÓ‹9R—Z‰p¢DÈ”\n<ªt›ŠšbVS!LËk.¥ÓRÔÒ€Š¿Mi-ŠwÓ>C’Š˜³X³šl×;â)’íJUKˆÈŠWxÆëê‘Ê×%ºâíá~%ÈÓÑÇæT¼=]Ã´9:ˆ©ënUä™Å<®¥³‘rš\nÆýüX»$ÔúÞœÐ•¡;ª•U\"j*ôÙ¨&ÈÂ2éHRt’¢’P6)Â°r)ÅŠ›†3úÌ»I²ù\Z“š17ÚÖ$í¸º‹yí‡^ƒ}!d™“gqgðÆ¯#wI$ØnGtlM‰Ûž9u±ô¯âß¤DÄÐú•Ÿ¦W…^î¨Æ¯éòeÚtW`Q~RôÛ¦eïª–ª/;)Ù1¤S·	>U/mq·Hjý— \Zú§“ˆ$­ÌÄPG¢­MMÙ—UéÒ6\0N–M´¾ä°t¸Ñý:f±ÓÏÂù6GI”M+ƒÇˆ¶¨¦mCH`ebHäHÇI?ÎÞ>(ñçI¯wÞ—ê~ž\\úÓµÚÕ:½ÕnŒ6ëU(×“_ŒÔ°èq+‚dLgÒ()u+ÈïÖp>n)áà†«\'¨Im5MGl²Æx@²8°ÐT·xñ©Í¾¤¦¯ƒŽ`ƒ2ÍQµ,¹eË–\Z´‰1iI¨»Öd‚&ê¹Hµ>éôŠ&¤vóªú-xJ˜)\Z…¦÷-¡P«SÊ\ZœÃSi.³ø”žAªlê°²•:„å% §¨µm^GšeõÀ=±OÆ¥-«\0ÀsÝáÔ\\^Ø†e“RænÒ$vYIW@ÅN‰.Ž À*@¸åÏ˜Ä<µ-ú^‹×¡v©léô->ÓÑ\r!©ö÷><ÇçT5E•Û&¡qÞRa\0_ìßTynÍSGbâ\\ÜZ—‹§†8›6Ï³\ZÉ³™³g+%R3(\rxÜê*A6ŽT‘YP‹!áIÄ_Ò—¢ŽË½p¿¥>¯=>s]‘gÔ¨‹tÚc«£Š;ÓÀhÙ@šOÎ4Âbä›\\‘\"¢¦›Þ79„!d)Äû@¨œqÆO=N	½Å­óðÇ6M35•HÜ¾#—–Ç|`iù-)j)>Š²°³ŽØ«Ê¼~¶*‘ÜcÑ#Õ©HÕowŸÃŸã…ÍÍõ•!Ä’’A`,çÈûäþ‡Ž“ ŽbØv²n=¿ãþÞBõ—M½ÊÜªä¿b\0(¡UòJŠ¸öúŒtg‡·2ï\rg÷T00¸ëüñ îYõ7­úŽ5n(Ÿhü\n‘’~ã9NsŽzWˆó¬Âç“ƒÿ\0¢`9b:mÓÚ|¿ž#ºjikS…µ(ê(\r¾äîJRÐIÈ?¯ïÐ½…±¹==¸n³„kì¥¹ý¸kÔgúî,¥õ$•û°RIúìÏ·‚<c§I€lmãü°ÖYîä©ÚûýàcAóåRXÚêÖJÎS„( 6vœäœýŽ1ÇKˆý` ao{ß*&VŽErBÁ­¹µ+õ^z#jÛ×‰«‚\ZŠj-†£ÍŠÌÆRÄ©F;èZV¢³È §\':æ®%§I¸³?]€©{u\0Û˜¹×°±pqØ/_YIÂ\\ ô•2FÑÑ@u*æé¨­¬Eì<¹“€æ«|7´ÛR.®\Z¨¤B‰ôHÿ\0#lQZ”C$)´üÃŒ(J‚r‘œcÐ±EšÒ	Z\ZÙ!ŠK‚™EŽæà5;ØŽd“åld~—§ §Ž’JÌj…ˆjƒÛn…KÞÄtð<°`íËLì;2÷©ÂÓÚDf¡Ù‹oÕªÇkóSÚ%ˆË$Ÿ\\Fq§]m;R˜IÙîÏM²\Z\\ðWi3,Vv±È·;nIßÝÏ|\nãÌ÷5®È¡9ÅK,¹±icŠÚP¢Ü	l	BÚ´’MÍ÷Äé½©RªÛ‘;2Š‚ÒÂV—2RA<r1ã‚AúÔËŠ2Éj¡†Zu2X¸:®ö …ßÛ¹Øâ‘áÌÂ\nJ‡§žCN¤ßW ?Ÿ³~žx‰ñ)Ú}ÝÓè—†Ÿ[)½íéi2-ÃoSÍN;‰J\\eæ¤?2c8ÊÛSN¤”©*ç=Bi~«–¨ÐÖÓ5-D,-bÃ¦öävé‹z¢^4Ér˜³=š|šµIV‚g1¸åm Ü2›‚b§Ã¶N·(TÔG¢Â§ÂŽ†Àm˜lGa´66„´ÊRx\0gÿ\0iü™u-6ªtAuØíÛîÅE[Q›fE«æ’Y.IÔKÿ\0‘\'ÝU‘OªQž†ò’\\\n8ìY( ùÁ¤§<¥G¨&}$3K_YZß»ÝlNxfž¢–Y%µ£tßïoÀßÈ‹›ŒAc¢.iÎžÀ®½sÝj(!Ë&Â©]µIµºýOëÕJmÃT³¥Vj*S•ªe2í¦íƒ!J+DiMÇ9[NM=ÒJ¹«UK)xÙ\'-¬áX¶ÃP6¨ Øá÷§^?›>àÜÓ*¤Ê©r‰3\nŠ\n¼Ö*5H©¦­§w§‚»±@¢)ê©Y\Z v‘®À´%]Ê–	 äá$ç\0ø9ÇýqÕÕsrO?†9\Z\0A¸6·Ý¿Çe-(l4vcÜ’¢O·Â¸µ\'U°é˜ÛI7ùétR…IK`TàYÆp8@>˜<u’l	Æ#ÞPªmû/øâGvâ}=kÓv¿1þ\"™‘ÆRA¬¬9ç9Â@ñ“»ôè§çYqÿ\0ÿ\0mÎœ„ˆ©7\'l6;—”¯ç¶¨#Ê[¸™Fž	 PÉö¤œ/j¾¸#Ïƒž—Ï…óªÿ\0c§øðn#æFí¦^‹Ë~^­ÿ\0iÄ^ªºâHÃ°I*@²|œò~4‰l;ÿ\0<0˜°buõÛ\r	ÂJ–VÃÅÀ*I8	8# ¡óûôõmmÖàya¬­fç¿3ä<q –ëŒ¥¦½E)n-Çˆá)ö\0ö¤(äçŒýzÊYä\0w@·Âãñùç†•,{«y[b.<|q6ô?U [4hÉ«èÌÇØÒÔ=@ÛÍ4¤(#>\n\\J‰Æ0^¹_ˆ«/gí±J}ö·¬G/f;Ç…ò³á	¢Fl²–ç¨a\nóÛofš¯j~šå*ÝP›VšÌhñT—ÜqN0€8\0y\'«ŽƒæyÛÏÑâî»õ½ºZçùõÄƒ$àÈ`”UÖ ŽnK7ˆ¹ë~g¥¯áŠ.îÇ½/‰wošénX\ZÛu½xhUg\\ÖÌ¿ÂïŠ£PJ¥VdU&N–#¦¼‰Šx©.Çq/„ 	hANÙŸe\\!]Õ6oÅ³ðþwJäA€5<‘²‚¯1U29Õq©\\“r68áÜ¢¹ò¬Êºþ\näeÌMMYŠ¢”ÆÁ\"Š†2ÂŽÚu)÷E‹`\\îâéÝ3iÚ#pTûeºmš£²jU»ª$YUjƒßn-6Ø‘\n¥=-¢TÉo¶ëÎ¬¡¸¨\r…º¥2ÁÁÙ>f³qMGÄr\Zi¤†Î÷‘™Z6v\'Of‡eï3ØØb[žpÓe»°È–¹g¨¤†¶`Ñ€úëÎÎC\\X:ÖÚ\Zu­ŸÉ»F¿Ü«Sn®ã)4ˆî-A¦BE\n•Z—\r•*$)[e€Ëe‡sÑg.ÉiHGUövÂ¦º®¶2é;D­Ò+þn6aýaU°ÔMØZæøû†)³‰r¾É\'\n2èûI\n…šuµôö²‡F¤„@6Çj÷cZ£K“j^iv™\\†=/A÷‚›\n‹Ñ¤ m”Ê´ÿ\0æ\0Ž˜GœUGDÌ@ñü/Ë³/G”‘Ç™eAjhääTn¤ïgpE÷ï×{W¸(zpU¢Ã’ÚÜ¥Ì0g³ê—.´D€Ú€YJ\\J†N@<ŸÊž˜š™^@zöµö¾ãqåìÃLÓƒ¤Èh©åxìµ­J‹›[Û¹Á~³uÑkº=qRÛ¯³6«L¾˜ˆª[rÛ}Úhˆ\Z¨¦;‘R²¸áÈ³Ö÷ zˆY% ®/FL³VJT™%Ú×UÂ(K±:]¯ŽlôÁG%Oõ4†’ÕaÈRÂ¢NÞò\0ÀZNÉc7±:@¶×7ŒÛÝŒ®BŽTH<“ÎùuuX3ž{ùrf9æÒ·æ\ZÖø|ü1²n:dwî,œ+òàñÿ\0\0s¿ZE¶ìÃàˆà‹ÛîÂˆ\r¡2Â’2”ó¸ŒÍ÷$c\'!ÚÄrÇ e¸\Zˆ>ìHÞ\\ß®šf0•â	|Á@¦YYý³úsÑŽ?¦²áË¾Û|f¥ƒƒ½ÍïÏÎå_Œæ¾jÂZS¨,ÜÑÙ§Yr:KæÝ¡-^ªë·±Hÿ\0;’¢)#§œB‡ëZæÿ\0Ûý#¹4¦Øßý˜Œµ2¸$¼ðB²8V} y>?|ôÒ;i#Ã—·\re(MµnõïåfÕœãë”à“ÿ\0ó¥“PÇ_›aœéf;é\n9ßÇçðÃZxXÈõŠÔéôÒ?Ã\nRv¤¥kZp9ú((ŸG\0­Ðmù±»mêî,O‘ðÃ\n‘#ÀT)7õl.oàA+¹xl_÷¤ê…m»Š”¥âji²à!Ô(Fø±\"ÅCÊl¤4ó‘…ãýì¢<“Æ¹mf[ÄÙ¥=k’YZTaÉ’[²`¾×åå©þ†s\\—‰x\"¬Ë£Ðšx¡È¡^) ^Ât*¢Tm,¾°±¾øh^Ï7Ûm—ZÕK†,úÒcÓÝ1Ñ8šûh%´H,´V78w dƒ“&Ë§Íó*z\Z}UTÅWY\n¡‡+±ÙAñÄó6É†kLÔôÈÉ=ÙÕvfP\Zö·_fûl	¶t‰¹î\rê´¾Óõ+¸;”Ó!Êªê.¦|¶…èmc¨K¥]×ò¡»_–ÊÐ„46Ê•íeç1¼ÙŸ–©<IžQe2Êä4LµuD\rÁìà,±\rÃ;‹v±¶ |=’SWÉW=]meG’dŠŽ`X^åTÊªòÉ„0Í ‹ßH&Pî?ˆRfO®ÂÓß‡7n÷å[å\"UïŠ¶²½~5P£7ê*=-vå	š«ŽT½e¶T[i!{N_ÉOI¾GÂ´Ó†9»ÉN ÷€’-`IM¯vÑX²QpFV)æ âÞ!Zgg‚›èòAN­²´†¥ ¦š‚£ªzkûˆ¼þ/)Ñæ“UÓ>Í52¨SfYÚƒ¥\Z¨vUË*S)>‚Ób\\œ¦ª²œH>™L¨-!A;ÖqÓjŠoGrÔPšÜë1¦§3!›M,\nPÚÒ9#* XÍ“kØ3Xb¸¤Ë²8›‡#:‡–¾¦P©&ÝœrJ +rM˜«:ê±k®¢b·hz£xê¾œÇ¬kÌ	´L Ån=^;…”Jn¡am1äEh,¶ò\Zõ¢•P»Œ\00˜/\ZPeT9ýd-P®Êƒªng‘$óßkžŸmà´Y[–¼´«OQRšë,NW¼P¬vÖ1‰Ûýf=“QÔ\n£Î,T/òàº].-kôÙ¨ËôâÂeÕz,F€Ô6±Â}GÏAff¨js\ZÌÄ‘¨˜Q¹;zÌnOSa„xºŒÖRe°©-,	±ŸZÿ\0Iëµ±6ôþÔŠŸÄnÉ­vMr¯:HŠÓ*i¦{±ÂU8³Mf;,­Ýä2„¤:£„é\"Ëxk)§HU*d€<’ß´,öfævmÁ>ì|Âô•›æIÆ¹ÒÔfsÖd™5KÃ—@Ò9‚˜F¢:ƒLtDÒË­ä*	}DêÜÜ6šu¥+\0„pqœ“Ž|’?¿Gˆ#~ž‡µ0\Z4‹*üí„â\Zc…’W…î þ™Ïýgx±n\\†0€I;cÄ¼ÀmAµ¨h÷$•dnäqúÿ\0ï×Ž¡Þñûñ 6Ö²ž§Ç§á‚ïl¡Åk–˜­juD\\3Ó•+Ú¬Ðk\nà¶áÇ~Žpñý5—ËYýÇÃFfnAì{°ÖîŸju÷UÜB“qDÞ	X	Ã´0‚œûI#ìsÎ8è†p¥³Šà¼ÃÝTk1êìÓˆÛ!ò•äcr’”ŒÙü¼Û¦EØ… ¯??f[X“}°ÍŸ-^¢‚R”’Js…ƒ€9<ð|p:^4¼AO+ßçùáœŒ!$j¿OÃÙ÷á™:c©X*^Ä àý3· qãõéXÓIb½ò÷o³Ë(\'KYWöâk6¬9¥·ä5Ô©6-ýOv”ŠŠ*K4ÍA¢CWFDg0§eÌ¶Ä¶ÊAB—F”UÀ¬½)ðd¹•=yJ„ÕSªE2€N¨µ±ŠWa²…,ñ‘k›­Ï\\v/ý&qý=>Á5’.šj…®§bÀ°íSLñ€mù°Ñ‰ZÜŒ„sÆ®›|ÄÕ¨T™jÓu&…A‚”»óPP´=è¨,‚ÚHðN\nIöð:çZª9(gï«ºžFãk‹õ°ß–>†eÓ@´óWQYå(EÉÝXƒnw\0ÜÜ_ß‹[¢QÜ¼mÆí+$\Z<EÓ#ÂDfiñ$BŒÒcá¸ñÚy\nJkÙöIäí82í*²Er×\'cro¿´_lTSK_V•Ù¬òÌÈìÅ–FVkÎÄ¬GìÀªØì\nà k5.ºM\r6íNÞqRÛ‹:¦@ºbÔÑ1ÄÇYVøÎÁ}Ô”¶Ûq±íp€L™‘idˆ™ûF`÷$veH	äoîÁšïIÔÕy]@3É*€‹Èì†;zÃ¼µ°6\'\\¶§QmZ…²û0eÓ¤ÓÕ)Ç\\’ÿ\0¦ûjmÕ²ó‡sh	$að\0Ç@æWt1¿áoºÖÅgIWOQZµÈJÙZÊ\0¹\r°6°7å~|ïŠ8Ô=#¤÷5r¨*±âA\n^\\¥%–$%²\\C’Âëÿ\0IÆFJ|’q×©\\Ô„§1—a° ^Ë{9töã¦©xš›7ËcfP’\r\"÷½¹}‡§–#“ê³\ZÙ®–‘P*Õ)®ÖdÍ¸ÚŽ£ý—LŸ=Y…¼ÓJô¨¨ŽÛ¡[Kkw(ÒrWhå\\\rX\Z’jŠuX§x£V7½ž3! ™Ûm z¢ã{ÜU<}é—\"áÌ÷1QsANýšƒÝ25£ŒÜr¼Œ-æ|AÇB‚{Qa2ÌT%¨°Ã˜g•è2ÊO»\nÃA$c§Ž<^=\n‘¨îÆ¡@þè^í½ö¾Øù“%|ò™¤~ôŽìÇkîÌI7ó¾Û[ÌòR ­¹Ê@‚}¤¯\0·ü:ðÚö>xÂÕÌPIóÇ‚b]eAX$,‚Ôü$÷#ôë%Hùüp¨™]{Ã~½p˜!++NÂ”;´…§j¶ç(8<>‡ž°I°¹ÜcM\n]™–à°\\í±²Æ½i«[BGñÕcÜUŸÀ+)$ŸØþãëžŽðé¾s—x—?¸øm2”:Iº“¨~}˜hwWëÿ\0>õI.$,*äŠ¦‚JGø?ÃÔ!ï\nüÇ!X?Lýz\'~o6­qúÎ/þˆí]Äòø~‰õI™)!(ô÷é‚AöeK\'ŒŽÜ“öI\n¹à|ŽÈ®NÀ|-Ïâ|0É›-Ðî¸\'’°Þâ$§œe9Æ|‘ç¥Ñ.6ž\\þÍAÔ±ßblGÏ•ðÆ’Õv·S¥Pmè®O¬ÜsãÒhð‘Ã’*—èÇokƒÚ¡¹JV\nq@%ôå1£Í)Ó\\Ï0G†Ý|¯íÃ\0µUUTôt©ª¢µÄQƒ{jpÖ7ÞÀZ÷\0Ø›mz©øÔ[Úõd]zÚwmº_TÕº¥ÂÝïÕÉV}¬ÅÏz×ua5:l½7f×­ÏiOÚÔDSÍÀ´@¥!—¤Å¥¼íYãn†äù.oOÔq\rZÓ\0\Z*tf¦\'R$fŒìÌ.¨Y¶,l£]ñ}d¹Cð7ÕY†C——ÌYuUT*’ÎÑ›,ÇxîµšÃP…šoÝýoA5\ZðÑ~å-)úY«ÚmpÊ _ZË\rÇ¥ÊŸLžÄÜ§ÉjcércrÔ–å¡·BNæÜSn(¾2ô=Q\\±fü/P¹¶WR\\\"«jž&PuG( rÒLm`Yl,:ö×ú\\ Ñ&[œF2¹„qÈuß²©Ž]=œÐµí½À‘.J7R7\0èÿ\0|\Zo`Ú0îtÕi.Ä–Âe¼¤Tba.8†”RÔ²—Rw6@ÈxJˆçªd9œ}„”’vÈH+Ù¹°=ÝÁï×–øœæ¹}7…‘+Q\"`4›‚\0 6çq¸µñ®£üjômûæ|I·Je\r[ðS>[ªy¶¤¡?*ãÏ´ÊË2ªŠã4]pà¥Ñ¹•oYx‹V(æ\\¶VYµ\nÎ‹µ¶&Û	#ìÄj<†¦§’\n|Ý$¨¦Ô$$YU\0‚zXó¸î	ÁCS¾/ý´[Ö½Vã¨¶¶Öb:ŠrÓV…5S*\0-Óiðá¼·*RU!·¤µÿ\0wé8TIA\0-qvu[ô\Z<‚¤Ô9\Z¯¨DÝÙ€U[u¿+Øa	r|“$†*¬Ë>¥‚ŽC°IAv<¬\0¹bÂÊN¡µÅÎ(+_ûÊÔÎæêM]P¢Ô,ËK¨;EDõ´Ó\n©³\"TDÎ™\ZC{ëÇ‡-§XŠ¦TÄY2§Ö§Ð[E—ðFWÃ’KMXë˜æÖ^Ñc¹(­Þ\n¤X%Ù@i.$‘Cyž\\Éä¢¤–ˆ=5,Æ0öWv\0Æ’8\"çºÌBZ×`ä\ZvR»,Ñ;ã½zåU#CÔ}\"°}9Î».mF©šJ~ÜJ˜òŠ‘VfÕb¬¨a²”…¶\nÇ¦­Ê&—‰¸û áªiˆ0ÕNÀÑ©_³@ýPÌ55r·\\V>’`ŽOGÙÛTÉ³††(ÅÍ™ä«Cøê2([í|tÛF«A®RáÖèòX¨Òª¢Ui³#+Õbe6¥©ôùÌ¸	IiØ2£¸ªüŽ¤=IÈ+mÖn\Zûn	þF8‰cž’zši—¿Lä8 ìVÞWµ†±1k}.)\nCjVÓ¹`áA	ÏéÉñöúõ’¢Çmñ¬R™*.Ê;3¸#‘·ÏQ…“¤¶•”¥.)[–\0$\'’<sŸÛ¬-ì6ü~wÂ³I\ZúœÍ¶ùöáSršn*\\wÛ„•“‚@\' ”œpyç­{ÀwÏã‡(àÅ¬ì¤œûjx;¯Úl ¡î¯Ë%ó‹z°PA ûOìwts‡…³œ»üç÷Ù‹Î{÷{|û}˜e÷g1¤kö© ­±²àˆ•ðµ\0‡h˜ÞSùW…Óúô_;ß3«°ÛXýÁ€uì½¼½áeØùñçˆÓZºf=\Zæ@¦C~]JGfEN¥:5:(³*rnDÇ\'JŠÒZijZW%´¨%N!*b8€ÖÝåæ\0,G¼\\¦í`<z—+ÌsDš:J¨HG|‹*®×– |/~[`£§¨Üº Ç2÷µ)62eLŒÅÓhÖâÞ¼)³Ÿ§T\\¶äRdK†‰Ñ¤G2dÈõ£¸Ó¡#¯>b´ÀªÄZ[î®¬ºO¼~¾¶ûáõ?f53Þº SSìu%ÚGR–!P]ûò½Ž%.›èîX—¥r%³lÈ™pZpi+ÕÊûõ;…ÉÕ˜2ß‘øZ_RX¤4)‹gÿ\0¤ŠÆææ„¥Ç\\Èªªêª¦GÓsU\ZFÞ\\ý»ßìÄÿ\0)á<—&Hªé)Õ’Gm#&ä?X’ªMÊ²ª€.mËŽ- P>\'Ö<ê³EÊ²hÃÑ­÷Ýe‡#7¨Ú[:Oâ1ÚWE›&Ã)x¥ñM-‚‚Rô½œ´Ñ…ÞJi™žäÿ\0Vê¡\r®-¦@XXs‰mDå2j…¼Ûí™u±æ¾<÷ñÇ4Ÿ®Úbë¯s½ÀêîžÂ‰W«CÔºÝ>ù±e°Ã¬Ö¥ÑSLÕiOÄKkfR©î zŒz.KaæÜVóïT‡½ ?q>m‘gihs	EE5R¶ð	É\Z0ÒP¼wkßIcccaÒœ9ÁÜsè»„ó:$Zº¼®˜ÒTÀÈ¬\'’ši\0Ü\"H)VQ¸$_áÜ´Ú:,«Z\rÝyZJŒâ ½nÔ§Ëz›;>®bz[w8´•©	sÚ¢ÙôÜ9÷uÐY}]íe.[M™¤£´íãEÔÌM‹/•¶+¸qŠï8áêš8ß.ƒ8®Èªâae+³D¨\0-·\'¢· »@–[«òû?‹åzR\Z	”äe¸[…(ngæÌaiÉ;N|“—9œ” #ÕÃ¦’\0Ò|vòå€”<VÑ*~SJ±Ô¡×¡˜V×Þí¾Æþ¶ÇkaÝgR¬ë~­eZ<«ž£æÝŠ*[†Óˆ[…-Å„’@/,(••\'q%I\'pXŒÞ«6®¥–:y,¦pÁ„CK²±—c¹ð¶Ø‘äY7eµIX“çyý¹%Ò#ÿ\0Õ:T’7b[~CU 6F¢wzRiÎ—Y¢ÂDO–ê>˜‘à»))Ù¶ÙØÊsìBQ…3¹d#$Ð|c›ä¼–ÏôqÚ×T±Ýl]˜lI7± “{)°×îMæã¬õw§¡‡³{òÒœÈm\'cÝ±µ±hŸ‹V‹§¿5Ñ\n}AØ÷%Ñ­z2,ÓˆNŸÀ®Üu:dˆÏÉBÄs©ööz¤.šÛ;ÚÜZ ¿ôý4¹‡¤¬Ë6š>Ö:\\¶­õÙý\"Há\r{M¢ÛwnÆÖL¨%Éii`=…,Ù†_Våiåj†+}•ŠÆÎFå‰Üm‹úøréƒšƒØÇoÓ¦3Q ß4øBk¼ûK™\nØ˜û5J|Œ²ì¨öÌÊ;¢}%)0±»	À²+æþŸ]fGÛIb9ÃÈµÍº_©Æy\rVuWSo¢TÔibËàÈ\r˜rÜ‹ÚÃîÁÂã°n«\"=J©V€ã±)‘¤Oœºd)•Iß!d–)”ö^zz›A\nSqPûêHËm,¨$¢’+º\"Ø<†À\0¿µˆ\0êq\09ivˆÇ4k¹Ð	vHK?TO!¹[mÿ\0¥Ê¹-:¤k–ß„ûÈ¸hKUF€Û²œÔT?VŠ‚Äi²1õ5-¢ÂÑ\";.¥hªi¦¤(“\'dï«fãeÕqâ,AÛõN¡qkƒ©Ž®7s$¡ms§`<ÍÈ]¹†±½Å®I‘è%‚–ð¤•µíÞ<ó…6œŒƒ´¾\Z¢Þ\nv>Vý¸À¨‡fv7øt7ð>Øs_tµ{²Á7\n÷[µ–ÈRweyôã£¹ý1—Xlÿ\0¶øÒ.é]®of\nÄYt(\ZÓ}ÜVçoZÅÜÕûY­FŠ¨Ûº=¡t9-Ñé3éÔ»Ú¢Ïãì%,2ì¤Ò WVÒ´.	S{)š´/™×}\"¹)cG\0wÉ\0$7r‘ÞÀ¸\'(x~×Ëhó\r}÷\nŠƒ»mj7RC]º‹`Isö­ªÂQdÉî÷S-›2Ä‹oO·(:Ù¤{I-º]\Zªú>v•{käÙ-ÞÚ‹ØŒ¡™)?Á”I	uß›¦ÎÞHiÎ)¨œI•Rè•Ž®Ú§L²r°Ñ»8ÀçÞ32±=ûJ¡¢T	;I°Ð½Ä·Ú¹XÛMÇ5JÝ5³­;Ú·-›Z‘hØ–Í*Ø´­jDF)våHŠbÀH£Ae˜°¢3¨ÍÆm¶€i\rTæårI$ï$³9’Y¢Ä’YŽå‰\'ry“‚“J¨@üÀ \0[t\\Ÿ1m)P#LÕ+¢³1ÀôíT¯0ÂÁ~CTvÚµâDŒƒÉo4É yo­[Š¼zGRÃ`£ÙwÇdW\rJ6¤ûMÏ/3¹Ä_îÆ¾+–å#Qt½¿­š¨”ýYÒèáD.´í¹)5ŠÞž¬§×­ŸÅèrÊ\0®®!BÔ3Šz‚d[Ã*”qÖÎF–=›\0þÀGë:eŠX^™Õ‚Î¨	°au&þtñ\0ó¤Oˆk°tÛ¸Oõ„°g97D;³ôÿ\0Q¡ÍAZ…MÔŠ•mñ+óyÓåf·eÝ0žKrhS¨öÀô~J±‚zDáóü¢ÊÌyŽ\\]–Aº¼cw„žEƒê’\'\n#d\"KcrÓ—Ogu\\™ÌLUò3Ó­ÉÓ:†w;Üx•N’oªäßVÕÃ¬Z¥zÙ\ruY–ìGªRZB…V””Æ¨…)I2šlÁ³µà¡Î·ÏU/\nñpŒÂ\nzæHTß²“SÅbn·µíÌrëÏ—™ð—ñm\"\ZÚ‘e{\r`“ªú¹>6yâ¾nnÃ¥Ç–M¯r´¶}R‘ª…1ã‰B}B‚[uayÜRqãož®ÊM¥“ô†^ZOÆµ>ÃëaÅeYè;+íÌ”5rÁ&ËbEù·å¶\Zðü¢®¢ÜÍE­7!\r­4Ús¹+Þu²£ž2Qµ##\n8\'¨‡úk®š&§Éá4ÚÜwç·!äq\'È=äù:Šš¥5s÷Jß±ð¾.ãJmÍ6ÑŠ4¨Ô–!°ØG«%Öšù¥zÚ•`ðRœã„ð\\ë™fYŽwU$µr™®I$Úç™û=·ßž&ut$E-%*¬1B¶\n’y^öõ¹uåˆgÜÌj×q]Îvá¹HrEL¸.öÓ.5:krî7)ñ˜¨Jbµ&¡\Z=-ôÀZö¿6ê‰’$ú=	èF‰ò¾ãÚ2UªãŠH°Ðº™£FkÆB­pN‘{Ù@8æ/MUÙt5Ü#Ã‘ÔÇ,ôµ³„$”eNÌºÁ´)Ü’J‹u!ðåÖíÔÍ=Õ/Ò\Z…n¥Rí+[î=Õª•^™Ÿv¦R¡³>µ:Ü“¢ú*ô\"ÛÊŠ‡ÖÜGCÔ§™\\T¥´8äë0Êk2ÈòÙ«‘cúÖ©ˆIìÜó7\0‚AV6¸ßÁå|Ï54Ìó	#r{)\n‚	°ÉðÜ boßïÈ¤Ã]Ã$½Dv-AÖT¦åÓ”¤E©ÆpîJ¢,(qí[WÐt2Mšë±hð>_†5£ID-ÿ\0pPÖ:H=\rùŸ\r°Åº»hÒ‹Žs÷Ý¤Š®‹ê-Uøoµ«:0õ.Ì»æ7-¥©×¼Ò¤Ñ5nÚqÇAr—vÒ«Q—–“e ¬¥D,i«¤?öeÑu^ý™õ¢ßs €[rMÌäÈ-*ÚìTØ–6ÔNÄN×½®Ë“·ûÖ\n–»t\Z£±Z§µCMíi´*TÔ¡‚ñ•¨Ú!\Z§Q~Öu[JSP²äUà,•*E¿GBwåzWÖÐ7`Å‰ì˜–\0~ä›3•ÔXm©·\";[’‰µ<,e\Z¶ê6Øõb<VÌw\'­ÑöõH¨Û}Äé4\n»Q¨Vj’é5HR\"Ô(µÊzh•–Ú©Q*±V¦ê0Š›PÞÚ·$å·Ó©[i\'Ùóœ¼«n®n<;Ž6=q’)i&óÄÈäÝO5#Äž@ÿ\0‡˜ñÅ”^ëCW-td4ëÒrÎU…:S>õ6“ù€JˆQç¤ø‚ÿ\0\\æ r.•ô\'Û‰Æ[½Þªóÿ\0Ìÿ\0?“€~£Î[Ña ¨;-ä6”\'’¢HQ8ú§*ñýúÇº<NQ&©	\"áw8]FCiN]v2CŠQ$¨ÂSÇ„þß~¼NÁG\\&îæÇaŸ,,ÖaÅ5V^A^êýv¨–‰;ƒ³æüÊÝô—$¯|¥†” ’O9S¾žL?aùÛçbJ2]ròÅ¤“Ý­wµÎÃivÖ™ê3Úw­]ÄjU&Ë¡±D›&™|ÊÒ\Zd*­gTeÑ¦Èn]úã[4©Ó‘éúìWŸ§²àqç‚,oFÙ\Zg÷kSOÛÒQÆÌ{¡”K¨W\n’T1\nz€n\ZÇ¬ö¶JZ#/¦IYEÅÁ°ïµˆóÇ p?Ñ]m³> =®é¥jŒÔK&Ö«_ºy7N}AÐI¯ÎlwEÚN±[o²Ÿã­ÜF™Å[Ðb\\ÔÉMãå£¿5Äô5Ù\rEn]\Z¥Mmù‡:V²\"„Åg[”vRÊ¯s¢`NÈX4ã‡$¦¬ª¦Ìª£’,»1Š#4´îx$Fad,\rûzyz+é–\"Ñ¾“kGI\ZÅ\Z·T¡O‹üœÔ’º­N—¦UõTê6õÙBƒçåUôÂú‘P-ñŠ³í´©)®SbS6U ú¸’÷=gYæÝ½g“_ý&†_ÌæRr(Ñ;]Ði*\0{–K¥Ž;ƒ½)M’\n\n7Ex	XâÎ©W´£y¡ªÒ£èsªm `#ÕúÂâîè½§j•ÑHzÊ’µ¿ê$LŒÂg\r/Ò%·Õ°)ŸP”¥xÁªÔÌÚ–gD4fÌŒ¬¥M\nêÀÀöÛÌÜ]Ã1F’ŒÞ\'‰†¡b\rÕ¬Aî’.o¹½ŽÖäpï¡öe«vÊT{mhHAyÌ:´©Õ$$z™JJþà§ŒgŽ›VfmQ~Ü`íøoæ||0ÐñßIù¸³\0{·°ä,<yoÈ_Ëº—j•xTØ³õ\"²)ÐÒä9!‰-SÚ)Tª‚Ã¥>ŠAR[kj0§FWÑ¾É*ø2Š’ÄT‘ŸÏÊAÙ9ª!¶ò0ðPCÆÕ¯zVÊrŠ:é¨#Ôi+,¹Zö¸¶êž³ƒu XsÅ{|A;¢ŸÙ‹‹D´Þ¡QîJà²jÖÎŠÜµkfC¶lÚiØ¯j%Úÿ\0µšÁ2ev©o¸…E… ™Ïz®Ç}‡»Ñÿ\0ÒgºyR‹\"Ë3Ã¬*Ü­–+/(û½ópÅN›ná.1Ïs5^g4­Uœf—!Ø]cUk»o¨±Øúª:)×¿Ñ­±4ÂÞøTØW¾žÜ¨»ï­_ÔýR¼»ƒ¬¹4Ô*ðµ‚5j]=¯szò–ý>¡È§Ú2P];¦7q¦¤ÿ\0<\\é?JUrñSSM§£ †éPZÝ“ gea³ƒ.µ\'£)\'ŽHÍ”°yç‘ÙØ’X›€5u7›øùâú®È©­Yu\'ª6ì ±ÅF ç$B¼}Sã¨	\0t¶ÇîÁúG1V@Çq‹ïÔá5›.MSNiÀ….[tˆ\nSeGÔÜÚR…(ýÒ’>Äõíô‹s¶3R«tÑžLHéã‚¯^f±4ÆÎÙ¸3Pï[[j%%xBÑ~çƒÉëe7µúmóîÃI\"hŽ“}\'qïüpç´í;eëÞYM.\n*mT…N<öãFSº ÍŽVê]e@LKo¸‘%¿NIBý5¼¶ÆÎŽðýŽw—s\Z\\õÛú·ÀüÏKÑNdPÌ‹Ý$ƒ¨r>=1õ{Ø\rFý~ànH–PKb{o2Ú~Epin)šé#J²9ÈäÎòLÖ§4­žž‰äŠGX±î¨êã¨<ÇóBƒ0¤†‚8 #é7¾®z‰·+rÀæ¿¥÷ýn³MRíšˆ§ÂRŠJž§†ò…´üîFOåè2pzxw;¸ýö#Å?!ÍrØ£ék©¼›Ïü8z?¼RÁI¡Ê\'iBA…ÀÚ@ÜµK9Çn·;«žöñøðÔæt\0–\nX’zøû:ûñõc¶Nç/)täé~®U´*ãn3q¹oév›_×ÅLº¦Á‘oÜ÷üé4û5ÔÇe(JÍ¦´¹‡†1éôê“$Ì)Ì²Tä/[#\0´ ?âXÝXú‚6 Þø]³z&EQV«mîÜù_I{‘¯®á¾	:W«Ê¾n:þ]:Ÿª•©Ús\\N«êï?R/ÚÃ–+ªRèn\\Äñ¥Q¥E™ZK´è\r@¤%ê[XBRnŠ·è]Rš¥¥Ep#„E)uõ•Q½e!lÌK÷tƒbN’NªìÚ¢Uärdfîµ×kX-¹¨ÙºàÙ÷Âï¸Î5ïP4¶ÓÑ»‚giú³U•©V´öÝ¶%5¤ú*O§ÝT9m*à\"ÚuzU2#Ñ_i‡¾V¡Lùw6³-.7ž%¢Í¸›.Ë³\nª7î\\>(º¯Ò!^9€\r¤HŽt²’.–ar¶/²lß-É^²Ž*Ô›/¨¼°’\Zñ=ìÑ·wÕe³-ï_Ç³]ìº¥yÐ$ZwÎ˜Dºí™/35ŠuZ51åS*qð#Õ©r“WKôJËKlÍ‚ìy-’v¸9Í{[ÀuÕòÇY&Y=6aNR¦V:…`B6M@øxIòïH+”¹úz%#´†@^˜x™\n0nV ìy€„‡tvµyº\r¯÷Õ¶º“±äK¡kU.—ª,™[’Ý1ø¼:¬:¤ˆmÇv4W˜©\"¢©0©ì3!k’Ë3ÑÌøSŒÚH¡ÌxN>%‚0-2iåµ€!í »6›—R„9Õ{¸Ñq£º˜¥j¨ê8~¦[¶¬¾©Ä*Ä\'èSÅ$$ î„ˆy{ÂåÀÿ\0nŸ‡iÏR—yvù&Ä\"ånßÔZÅa©’w:4vëôÅT#3\"Dƒ”U`¾Y$šƒ¨Kî¾ò#2YAôQ4¤D&¶1PvF=«Y¬Ai4¶ú¬¶ÒØâ>\0d\0ñæhÝÓÜ4tH\ZCk\"’ÑÆ¶m‚»n¼ôÜŠ[ìÏº‹_M™}RïNåubŠ²ëµJ>™Ù*¯Ü3ž“\"“\Z5¯nÔ¦ÑéPVüV\"6ëÒÜa¦ž”ü¹S][¦Ò¥áŒÍ;©rÈàe‰^(R!^dÈìÏ%‰f¹è \r±n#áø\rVŒÍ³•Ýã3—i\r†•P4PÝ4…w˜jÃzøøpêN»QbDÖm+¨Wž§Ä±4Þžä¤[É‹V…\n\ZnŠûË¥)lË¯Ï¸_or‹Ë6ôî 4ùoåõ®_E,*YœÙ£Q=Ûwù¨n—ÕÓ¥Îxr¦Jª”•‚“{È{Öä—Kob7°ïnq¦øl|ë\rËÿ\0_îí4¾52±ck-…\Z©J¦¢Ð¢\\výNL˜×SmµU(›p\nsë†Ô…2‡‰!Æ}U!A	‘q%oñE5Uù\0Šªˆ›Ì†0Ò)P4å}V­ˆÌÑÔM%-iÑPWºo¥l	\'e÷:G°âæšÓûØP3mÍõ½)mú*v>œŒ¹±?æñµ¨œž¢g‡3Í\0}Y!>Øÿ\0\nÓ/íC})loÞä;iý»á-¡¦÷¥\"•H‰\"ÛœÒš‚ÜIm©Ø*	*Ý¶YÉ$ðOŽ¼8w>Ë¤#Ûñã59­³Nÿ\0JV»’,qþœj)\Zy¨¶õó%ÆmZœ«z²Ð\\©\r=MôbKorRµ´©Á@©;rR“Ÿ\'¬þOg€¿è¹7ó{ç…æÍ²¹iúR‰£;‹=Üt\0éÚÞx4ZVÅÍL¹á¹2•%ºc2œy2T¸åÇy\nI	|¨ ­IÆþ.ŠäY&qM›QTTP¼PÄä³›\r/`×æ@Úø\r][G-«@yr±¿1âLÿÙ','Morad'),('Collaborateur',3,'C1111','Agadir Elmassira','1978-04-10','Bennareg@norsys.fr','Agadir','Bennareg','0666145878','collaborateur1','ÿØÿà\0JFIF\0\0H\0H\0\0ÿÛ\0C\0	\n\n			\n\n		\r\r\nÿÛ\0C	ÿÀ\0\0€\0€\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\0ÿÄ\0=\0\0\0\0\0!1\"AQaq2‘¡#B±CRb’ñ$EcrÁÑáðÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\03\0\0\0\0\0\0\0!1AQa\"2q‘Ñáð#B±RbÁ¡ÿÚ\0\0\0?\0ê«„FK |ª¨.\Z‚ÜR‡Ò~ô)šÌÿ\0¤Ê¤¸¢\0Ü¨ÕbZ˜zºSI¥–k·jÆ‘œæˆóAîÜ=7¬ÎeÉ÷–c¸2IÆõè˜“ŸâPÿ\0Uëäé’Y–à!yÀ#Î—IhW–8­Ä€ð+ohF©#¸A	ÝJ;í[ëEÂWè¾W<üè}Â¾\'Ynë\\¤Èló€ÏCWDâ‡Ó°ž¿]œÉ	ð6ƒâpúýÐ’ÀÐ&îÂˆŒ‰0 sRå^ 95Ä²æ@>UQyÕ\Zz\"{¹wˆ¬¨d”©Á=Ç•\'üGí©µ,Ç³\\&Úíåd6Åµ	o)ÿ\03«ÝGàâ…—{¥Êz³ÜÔSR½È2åÇ¾ÿ\0­\r&§ÀX×Þ~TTzw;¾:è¥—^iAáê[kÎ‰L”äý³Z–.me+IÇ5È{„ëL7”ý¾eÚ×!ÉPp)#Ó)ÎE¸yÚ;\\h—›K:³ê˜N¶ÝAR=JI8ù£\"¸¯©Ÿ¿¾úÆKDÏ\r÷÷å].Vf¯	5)‹*VêT§F/¼*í%gâ2S\nfØ\0’ßxOŸújõÿ\0)ßæŠßo‘?ˆãÿ\0`:QvöÉrÁº\ZbÐph‡=áKl+!SnØ\'˜þc_/³.)	uÌ§×¥€äZ4ózÓÕÓš>\r-7AÏKH´Gy/rwÅz=bŒ\'vœj¿T¸ÊïSQyðêZ DPaEq¼Íx8ójÜ+ØzˆO ¨ÈSïMçå!	O/É«ŠZ\0(±žúüÛ#o*TûNÊ“õ4ÑRV•ƒ#M›X üRÕÚ.4ix=úˆÇ5.ÕHùaš&Ô‘%\rxQszÐÄÛ¬µ­¶YAsÄ¼$šqO‰W[wvEÊò¸¶˜ÊRPêùOR”Ÿ!êvù5¤ÖW–íÑ™´3-]ÉiÉ.°•`)#`Wì?µ-97N%ßm+L¬0Ò0\\H;Ÿ?Ò‘ÚÄ×YÎs÷çNmETc^7N3N\\åG±Ú­$òýS„­Â=såö¯\'užª¸»Èø}ô9°-)hRzd8yÙbÂÝ©™wU>^y<ÜœÜ }«}Z:\nOw.¨x…oúŠ6ØÓ8ï¦1h7Ò\rÒ>3Ií³ñ‹vÙnÈJ°\ZyÄáiöQó7«X6IÙ@u.)xJ€9Nø?§_Ö›ÑÁý;!)kè‘‘¸Nõ«ÓœÑÌ¨²ýµ/¶q²½i¶¡ƒ…Åc6ƒ4gÖ¤¶ØõÓJ\\…Â§\Z-¸‚TÞÙPPÁ¹®‹pGQ+‹z%Öd¥·1€ÙG+ïXGÙ‡Nj’«c(‹Ì|C*ç„úqîÜfðîD —VDˆÊB¿:Héìp?cN¬&ŒÜ©ÎÒxæ§µK9#”Øð£Z	ÖÎ[¼>Ÿ`kÐè›—òß¥PÈ›xŽp‰nmïP¿ßÛ\'WW1Û\\Ì2®º¡džÞ†B=õ©:.÷ü—ç?Ò+ÉÝ\r©Uù/ÇîŠË\'Uê$¦«ïRÖ:˜¦^~Õ·é÷Ÿä¿¥ùûOøŸMOìÚâÇúªÊÓ¬aÝJ\":—óNõÍEj½H{õ¦K²Ö¾rt¡j¹J+q(È*5¡JµÜÆœfR9˜¥¯´`cñ8½ë¼‡•X¦Vì¾È-¨\r)ý«Z/BVSá]+Ô—|X4M¾Uù¥£‰s!I³N‡™3o¸[‰+gcŒüÿ\0J›Ùg‡ŽÜ.ÎÜnPˆì6Ø)êzì*›ˆN\"$\" ƒÞ8Ûaj=7Š;v_°\\²¨Ô\Z[mJÈh+ó,ºÍN_¹†Õ‚ÿ\0#U\ZD=µÊ“üEo\r¢\"XN\0HÊ©ƒò* ŒùW·µî”Ò®%«µÅ¦ÝvÊÇÈ‡…ÇŽ\\$ý/ãÛ™Àï\ZPïŒR›;i]w*œU“Ý[¡ÚîöÑ‰ÉJr°r:ÖšÉ1’ð+Pê<ü«1lvÛscê¡ICˆ8 ¤ä\ZµjE®Øëbá=ˆã eÅ„Õ%²2ãŠã³aÁâ‹ùÍ–Ó`¬bƒ½¢îÒt>°Òzê:OvÛ©b^6æG0þ€“ö4L°Þ´²CE:‚«æH‚­b»IZ!jvtþœ‘ÿ\05”„² v8Ry·ÿ\0´ÕQ.9¨›÷U³9N\r74%ä§Â°>\r{9¥Ðó]áFÿ\0¡¶Ù£µ	´€1^¯Nj3E³åçV0<ŠhÔ,Ñ$ž¸¬ºQÐ²@9Û5ö6Rj]çP<’[aäÔmâc‹åQçzx²Ý„Üi3ÙÛî \næ‚È\"ŠÝ—ØráÄ3:Ržë;z]ô¥öÐÑvdb:ãÊ·]—o°,¼K\\Kr§\'æ¼Ü€WŠ²«+¢¶[Y‚À<äå>f•.ÔŸñ\ZÒÉn—Ü\r’7#*šË}ò¸ÉTg S¶s@¾3ðªç¬5%§R@qEVçÒáltP\n…¸|xTN ÉÒ”+9m¼_ÙE–ŒÃäKB•Í’‚‰õÛ?zl´tTé^ØØB0Z„ƒ€ÊŠûKæ¤µN‹t£6èò.Q@çq\\ë*\0û/Šeí.G¼i;CPœJÙ\\fùUê0*öbÑ =Õé‘ŽÎòAªÝ=”µñ\Zã{LçÎ›Ó¤IÊœzd¦¹ùIèzš¹|Öí[?»ý*¦!þìB‘“¸_—•8º“FÀy¥![+ÏhsqÐV–žR;àœþs)µ†¢‹	VJçH–Y«ýUSÁ[ÝÖqJ¤µÜ¶NP‘€sZþÓ7;&šr×\Zyw3qk!k*KHÛ>%\'¥Zé«ºÓoï¡¶Ž£;Š.j=hÔú^3·©{ºa+ü¹)8ê(Ýç·i2+VØÃ`7<ŠPx2ì@óÎÜxV˜ÌF“Ý-q$¾§BI?ÅÁþ]ºçl©³Ö\ZY±`Ñò£HuôÙnÍ­<®bZ\0Ÿ=Âj&€²³j_q 4v$§|z\ZÙñ+\nÒñm¼¶ÍÂk\r²¦ú…Œ¨}¼5B—JÃrŽŸ}jj[Þ°ÈÝN3ô¨þÓÃJ{°òFÛÖzÿ\0«m±“Ì©	Ôª†“¢ÝÔ¹*UÉHIZŠ@=zV]qx˜b?=Dsyª[kð€YW¥E\\ÚJ¼\ZØj#ZN\Zt-^@VUî1¢‰\r·Ì±ä*Rø{m\n)eJ#×5šÔz\Z7~F”\\=@ó¢âüOùÃÙ*â“O‘´&–­EÄ‰÷¸Å—¡ò`u¬»<é¸šÃˆmD–áJ[Oy×æ³÷wm\r°ÙO69‰sÀ›¬{6¶3žã™ÓÎ§‚aT=d\nMtŽÅbƒa€Ìhë!#Åšº„uÐ•aCÒ²\ZoãväLúžðÁý«qâê4ï[ÒóœKM:Žd¬«læ„Š`XDMLíªî/h¶tµýÛÂ-È‘{…AÎ\\”œ¤úuéçU|>“o±XÝµÄ*K1®á*W1Jâ\0lÑÁÛ½ªüTÓÄ¦T‘Ì…€¤Ÿ± ÛgIêy\0f<Y(Cí´<#$r¨Ú¦õ} ýè¢Ç¥Xézë^ªÃ:úh=oó¯«Æ¥@[¯<òÒ|JRˆ\0\në-mn¼Imˆ÷\")q!Â•à©ÜµVñ-é×;kq˜–CNÈþ?t®€\r¾Ù¡þ”ÓQïº”èû†š¹™N\Z“õ!áŒó$Ó¼ñGošk-ü­7f£:b4ö©Ò’m)·é«ˆ’¡œ“Î6ô£4‹ŒÃ”÷7”D˜#¬´ž«QHØcÞ•í1Á	–y!VËn ŠëjBJ±ÏŽðe?r:VóThV¸Y£ŸÖÚßXêxÛq1”VÈyej8JÎæŽÑ¬\"Œ³!$\ZÃSº›b‰psÁˆ&ÖÑ®³“bÐ™)W#ƒÏ9£^¥Ì‹¶ãË$¼ŒuæO@=3’)áË·9O·½`‘45!\\Ëú–;•Žà©<§šytÜùœæb£©æ€„(n:ãïLPâeóÖjW¥™%Â‡ÓZá×ž\\»jB]R”RLž•^îÔyR\"ÙÀpù“FÈšš\\ù†?àÎ!	;¨«L—˜\rh˜V=+XC’PÒØÙLô³Ãv}šðÜ;ó\nm+ùÀ­²Ñ§Ÿ[jð)DW¿tÌ­Cp`ÆŒ´¥µó‘Ö²·+ZumM›)m!È_¥>´ÑûV‡Õ;syÙÜù×:´ÅŽõ©ïµÁ×PÂ™}9Ø®í{¶µ5ZøRÈ-#¥	ûkK\"ïwIWvÙ$¶––÷@<À÷®‚i}D\'ÇT‹zˆ`+	¡ø¤Z…ÛÛªp*ŽÖdˆ–j…Âž_¸w¦š³H½;=M·ËÞº<F°zÓ³=Ã_k¸š¢ç~y¦ãM^müÍ\Z¾È\r‘Þ@¡žºâ^±Ó®ªUº/Ô0‘Ì@;â§®ï°Mg¡V¶ÓÃ¥iGDy®9Ÿ\n¹ŽsBžÐöþòdwÃ}â£a+GL$ŸÓ­MkŒz†JãÞg 4ËjL¤åD\ZðâÍÝ‹è\\Ì™-%Ôù`rçzê,ñ¬·\0áï¦ÚU–%‘¿×»Ú)z¸]Ti-¨wJJIåþPšÑÚl»ÃŒúÇq. þ¸( cü]Ee¯ëî˜SŠ	J¼ÎùG—ÇJþÚ5JâÛÆ–C_l½Á™xâÒç²~M-\ZÓ‰6r–íº‘÷ÚJÐ´&K(‘ŽPFv$\n!³e¹k›Tk×®ß‰Ç·<¹¬Aq´4Ê\\ê(ê}ÎivúÄ®­Nˆ·S!\nm•œüÑ‰\Z„¢Ã\Z\ZÑHIyÕ(•„ƒçíµPØm´M}:àº¢©ãþx{ªv‚°Á^¡º_A2n†â¤oÈ˜ôÇ5Úr<­ÌAŽÐRYm)Î:ãÏïI¡âK\Z	@ÄO-Éç’†Ð¾­6¬n}È#íŠpx?w7+cS%8	v:U÷5]{øvM:ÖÚâ~;l<¼}õæ\'^\Z•ìðEÒ,í?*Ð9u±Å”¨„¡/©jT)Ð.ñð¥¤dJÌÍfÙSÜn6Tµ!œb«xQ&ãs×¹R\"ºÄÂÇx?\\‘]~•F\\gšÀê–UlsDÂ†ãýÓ¬ŒŠ\\»^K´@ÑS˜nWÓÈSJîŠU…Jc_}\"ó!	X<£ÿ\0ƒöç»ÈF©µÂKªîÖÃêRs±ñ\nâÚ!\n³c?ZêfíHSHÇœÔ5¶+E¡ÉÏ8òBNóÍu„ÚZûJF6ƒo©kOøvéKßf}= ôDÇÓs‹«‚Ö\n‹ s•šo•¬lÖë:ŸmöR„§ÉB¼ãU¼7\r´.\0ïñª›HD+¸¶Iîð¬†ªT¸,¬ ò”ƒúPUñ\Z5¶Þ¸Ó›JœZTžEZjž&½{»˜Ð_m,º¼gp‘åP/2•ÄF˜jÈÑÝc¼¡†ÛÜ“ëì*F[9®% –=+;«‰\0ÛJÓü?¾\\øo}ÕM¼ã7k­Ãhm¡Œ…oÑK#\0ùš¤¹Ëqø6ôHRÖ¿¤i+Ü’ÉõÎhöjÔ„XâÜÃŒÄvÁèR‘ëB.ék…´&õ``ÊŽ£1¤\ZUÔ­Ìz½ZÍø}¢µˆ@9^£Ç dû¿ªi jqZ»Å7òè|þ´3›¤âKï`”,r©È;zPî\r549!ÛB”ëEaA¥( ƒ#Ó4PµÝ›}´¸Ú³ê|Åhá:‰$ääz6’Æ2*†{Xæ—ƒB½-¤ø†$2Ât´õslwO*Ž}s°¦\'†<.¾KKWMhÚ#2…EJùÔö:%Dl=sšÞél6­ÑÕ€´ƒŒoVÚÏQ[´Ž™{šàiˆÔ°\0ÝJÇ… y’p\0÷ª»xÂ&ìrj^vf}™àRÚ9©0¸‡\"bä¡Æ¦Oú¦lød¹¶>0R}4âðkZA›£b*\rÉ	u¶ÃgÄ=)CíQ 56›Ð¼;»H†úÞ0¤‹ŠÐÚŠYqÇ©JÈü¤s¨oæ\r¬œJ×:hÁuñ‡¢U·éNõ«ëËÔŠ1Rv–ÖÖóK,KÃž|ë¨ò5F¡‘5Öá¢<…ów«Ý1tÖLÉv+,¡CÄRw¤;³O\Zµƒú°Æ¿^äN2œJ—À®€ÚXŸq€iþE-4›·½i’ìmÛÒ	SšÕ\rÆ¸¬Hp­Ò’UŠQ8ýhOxÃÐÛn%0âè#æ_—éLÕ·FÏ´Ý]¸Ü^2P¿Ucù½9§e^—uZ\nJÊG1™¦ÜÈ`hÉÁî?ûY,q%ÂÊË:ŠM¸“®4ú‚<½7}·%A¯R°AòéQ­·Ý}Ä(ÿ\0Ù½qvîùØ¥”e\rU/8Hù5”àgaIº‰ê..J‘h„H[v´/–K©õu_ÝoÍñOÓz[@éÆìzOÃ‡¡Ê„0ÈBV|ÔTwYõQÏÍO.1…Sœwšfn™Ç¤ P—„ýš.6i¿qoU&kà‚‹dÊ¢Üê³ìœsF¥ÕØ×lµÂn$8Lÿ\0-ìqÐ$}²Nõ*3oD¹«$ŒøP0	ôÞõH÷;g$º»õr­4´³Ž2ÅG8¡$~•)3Ì‰ÌJQÙC_÷¨IJrB‡.P	ãqyÈ¯*^	aDsÿ\0&ß›ÿ\0ß5w@—ŠZSœa@ìª{mì0¯·­foÜ9·_]rm¥h·Ïpä¬áº¯E¤t\'Ô~õ‹ÓrÄ÷­svz3Åµí‘pqê=è¯*çô÷„Ht5–ÏˆgÌ|\rë9ªaY=Zl©÷ 3ßÆ+V\\_(æZ2wPÆqîc¨hñÎ½ª.sÓƒõ¦šV¶öî!”åOcéýQ.Ç>¾Ò.¥$\"3y9 K§¸°Ö¿â—NÊ¹ýŸ·HüNrÁ%)m¢\nJ€ëâ)Ú³î*Î¸Åø®:²î–‘’TO@\0êkç‡œ8¹Ã¿ÛäkHn³t×S¶[¡¬xš„}×òå-ò×zK·{Û¤‹ˆ<û(ý^hìíÚLúG¥:á\Z}²=À†å[ž¥)M…%m©#\n);’NÔ¯ñÇ±¾ŸÔÖ©\Z‡q³ßœëŒ•òÃ–Ð&ÉöÛ=@ëMºá¶©lÍ·ˆ¨Šã+F0@ý1_Ë%·¾³L·ÈáHÈßj©¸Ž)Ff¢£gNV’~È<•iÔ×qÏ*Ýs·=ÈÔyåüàôPô âŸ‹lÑã¡¶U€‘¶+1lu¦¤$´‡£áQNè÷Ê¯ÚÃ8úg¹’¡ÌOQR÷ZSÅ)‘NáMá¼O¬eG2Z-©Á‚:ÖyÝ1)vX}XÇ1\0úU°š¡²ÁÞ£\\efÇ;r\Z¢“ÔVÛÍÿÙ','Samir'),('Collaborateur',4,'C2222','Elmassira 2 Marrakech','1988-04-22','Benchrifa@norsys.fr','Marrakech','Benchrifa','0666458287','collaborateur3','ÿØÿà\0JFIF\0\0H\0H\0\0ÿÛ\0C\0	\n\n			\n\n		\r\r\nÿÛ\0C	ÿÀ\0\0€\0€\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0	\0ÿÄ\0B\0\0\0\0\0!1\"AQaq2#B‘¡±	$34RbrÁ¢Ñ5CT‚²ÒáÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0.\0\0\0\0\0\0\0!1\"QAa2qR±Ñá‘’¡ÿÚ\0\0\0?\0Œ‰Mør¸,I÷Ô/‡ŠjcÓže‰·2B\\Iqa) 98ÈÕ¾…Ð¿‡šýÊžü´J‚7²]­¾É#ŸBïÓTî”õ¤ºZ°?¦ôÈ×ÎFyÕ»ÀÚ[L†ÉPP^Ü“´s¢Viµü6ÚRm×\Z­5N’ê&n:Ð*iIXíÜk7›ÌË–Ç$õ‰£¿\nÇÓçŒÂEºyÒ¾˜^	¸:wÒÇ`ÕŒ¸…ÄÖL„øgCj–}R9Ó\'\nù¯\03fÉöòº“¤á›\"\\)n9R-\nCï-¶ƒ ÆYÇèÜÞ”Ü~®G=õÐÚseN!¤‚yûh}J=wcvOÌˆu÷‰]»«ëU)éõZ<º~Ò\nãw¯#QQíè’&7S¸\" :”†QÎþx#Ó[{´úyÙÆÓz˜‚û‡*Xp àvÁÏ®”4Ù¿V“á™¶+–:	ÿ\0¨î÷\rY] û·`ýø•‡.¾˜ê8WÁ¡Y´6„©mÉõ}j\"¾Ä¢¡Sëp\ZƒžDsêsvT¢Øzs¨;!åÛ6u,U-è´ZÔÆÂå@aAmÄtƒ’=Ï\'C‹Û¾/H‹’Ë@r«5ÒÔ©©N¸ÚW€ã	À8ÁõÐ&À¶~°ô¤ìÚ~!NÅ¿zkÓÊ­bS½ üÌùîI¥**h,äq£5*±L­EDêTæe0±”­µd\"Ó~fE¸êR/úuJåÒ‹Ì)kA\'€		ûwÕï¤—SúxÜˆw‹\"2\nÂFRrâÁIÿ\00üôÒ½VÕ9ŠíÑ‚xâ5óÿ\0_s­%þ.ú¯PºM¹›Cm¹¶S¸×©OùÓþdýF§÷—B’®r4=Ö-ŽJÎ-mX¤méI³*íÑü4’Üï\"›Ô»a;€	ª5‘Ž1§šâNmJ™úW8ü´…õI~R­´‘ª£#?}§\\0ý Öƒ[qâãµ6@<LpçóÔßaŒê·h(ªM\\ãšàÿ\0¨êÇÀVu:ÛØ$õN1Ó~ºŠòö[½5.:\Z> Cì%JOœ¯í¦¥pú€®žFéeábN¤?I{|%4¦œ•$Ÿ9ÀÂì#@kc¬2èÊ›%—Ü+ZRÐ!Dú“ïôÖÓ=k­š½J{uéK.ím-­ò=3ôÒÍE—jWcŽ?™Ü)ø]4wïªßÓÖ~c_Òû&§iÞLÕª@¶†Ùp¸´\0àîÏ¾×\rÏ&‘dTë¸¦Dõ4[ŒËj\nVUÀWÛsv­ÖzÛÉ¨$Ü/¥.ÐØNâP§~{jÉ#­WS”c5yLmm¦áQ¿?–…®«k9úJü—á¶ò.,{FzàN’ÛUO—´©nÔ¥$Èšñ‰PÉ^ÑŸß­:ÍÒÄ&RçjJôÇ×IÍ‘xWoUµE‘wHáCÏ#°ÓîfÖõ&]ÉÔJzYœ^£ÛñI’?¼}XØ¾\0ÉÕZM„úCƒ2š¯	W%÷OS5Ëó/DrKt§$+>TížIÒñzüA^«)tèª‚–ÂÛ…;PA€tõ\"4ž‚ÙIà£C~§t&Îê5=Q%CCKÎR¶Ò\\¦OÆáÕ¯©ÎÖûÄŠWÄéT¦ÒzsÓ©,Ó+2ãT*«y!Ç£“•ò4Ëôíºo\n»G©F‘\\§£(–Ú’¶å´G `ÿ\0ßAn¬üÕ™‰&±f×—šIR[ÆÂ@ôÈ×¿ƒ)•ê\"B¹™”‰”j“‘Ró¤þ‘¢)$÷Â»®™¿¥ée>Ÿó%bzžåä}¡µê\0¶®z|èuS·Ê<R¢bJ<l$qá¬pAÀÎ˜\Z[åÈí¢SA©>p;nõÒûvÞT#[›fN%ƒ-ÒÚÇ‹éc«¿Fï\'ë°[¥Tå-Ù”Âb:ã£YOà*÷Ü‚9÷T‚\ZeEˆM® .Ù©§Óå\\´ëŸ=dt£ªÖ«C)+¬Æ\0{y±®ˆTRfGÈGŠÊÓ“Ødi/ø‘éÛû«§÷<¼INWÙ3ZIÂZorBÆNí4¨…tâ+Á`OÒ7þÕWOlNwÿ\0‘Õ‘DóÎªöb÷L¬ÙÅAáÿ\0QãVuy\r|¬û$Xe§)-¡M8¥\'vVŒã\Zö–¡¢\\Õ0§Jüp•ƒèF{q¯¨^gÎÙQñ\0ÝŸ¦³±ò\n~Z£-Â øß“ëÎqªsÐ·¨ÍiÆˆ’—ŸÎò6~ÏlãSn´ÃÑÚåxM… …þ,zwÔ,á	:–ÜŒI*\0·\Z™©.Í%·ÔPØy;Nsì5Ã {ÇÑ‹†³:t•å$2Tž‚‡:n~.9÷u•Uº¦’¥M¬Hi¥zÑ€1ûô…72<\ndçI-Æâ°=\0<~g½tðt‚à³ºÒ{ZÇ¹®še2¼í<TäÅ’v«{ÇzŠ±ø@Ü“í¥:º†íã²Gö˜Ä+¼í^Ìbu°I×±-YçU+;¨ô›Ö\"Ý€…!m~ HRe!c…$ú«#n²áåXüõÄlpÅ½,‡\'š¼ö›€òžHA\'öiNéÕzvõJâ¥PÜm¥FZÒ‚®7È\'vÑù\'Óé¦O¨\n\rÛSö9€X_¯ÓHgÃa¸è×•Ç5ýÎ»N­¦R#qŽ¬àýÇæ5h_Wqo Ž‘6PJŽá{âI·.\Z5Òå5Å‰.!Ðp…8”ó•c¸Áàë%tH£uZâ­@Uéí¾ÂOªÑ¸Œ|ÛF>¤QmÞ¥Û.RÝm%“*.Ó‚Ç™ úûŽ€ËµŸ õK§R¢:éK*v;í¸1”…}~ž¾™Ô•‘Ófy\0ÈT	ots©ÕeÔí%U3¹f!sßnt†u—¨Òª]aµíÇà0Q&±\reã’âJ\\ô9ãí§G¦òzÓšÒ)@t6êž@ÒMÔŸV.N¿Û²)QÝy0ª¿,¥$¥”%YÜT;\r3Ñº:£¿ÄI}e-dG®ÇX2ë|ç\'Áã®uk*új¡aãækž¹ªHçÿ\0yÕ•N/Æ)?‡:àm«(Û“üN\"ÐÖ‘À’êr	ôÆ³³\"1ù£>Å‰8YÉäý9Ô}	`â\'9õÔŒi-,Jð£6‚‰T{äûê°9žŠ½y3Jc±P§˜ê*rZs—8ÏïÔ­Fe4m8Ÿí)ÚõW×:„™9	.%0ãŒ\'Ÿ¦³TæÇKˆÐže\0œgÊu÷Á¬Ââ:Kc+«—m:Öyµˆ.ÔXù£¿ñ6	Oæ×FúÓ*ÙOÄº#/üÔCå¡±â)“ú›»ãë¤·àÎ·C‹uÇ`%:ýAÂÒ¶ãxC$~úw&u$t¥\r¨8êŽÐŒóŸ®“j-©VãN»ó†÷Ö«R8VºGÒ]=eº2Mi²”FZ²õºÇÕ†j®Br5=3¼$sý•òÒÊ½G¦Š$¶ôT¼\\l­IÉØxÎ¢æ±Nž³Nãƒp‚~£R{g$ó×¬v¼½ƒšï]i¶Dê‡Nz­h\\l6Ëi\n­Eª;%”%cÊT¥ú8ÎªÝ2­ÿ\0W·J÷Í*¥J¬Ov\"D€ÏFR2\n½;€3ë¦»ª=& \\)0ëÑ£É„RJ’¶ù8äg,Õ;z(’jPâ¥,S%¥l4¡äK) ãìs«EÕŸf0~±ÅL¶Tpr45pD¡ÎfM¹!rè•\"ä†š_™qV™²}ÁŸQªîòÚê}µ\\Lß	_Îý|¡Ä-8Ø}ŽO\Z¿ôšÀMVÃT–\"®*ä:ãxÙò¨Œ·××Y‡Ii—/óÝ»Q;%¸°õ.f9ia)}ŠAÕ	çï%ã=B™RnŸHØ€ãÉ%Òë\'…c’q÷\ZWúåñŸ~Qz}dÒ\Z¤9X©Df| ÐSŽ7â§ô`þ¨÷ï¦’Á‡SKM&åNÉíµà—±ä÷÷JGÅHéÖ÷Yì*ôIHKµ*ƒ.xjiD’Ûƒw#ÊžãùÓ?ŠØDzÃ‹¯Ärº|ÚõÜgÿ\0“éþ³«‡·$\rTz|¢®…\0\0ªÈÇ¹óuo.‚HF P¼Å¬[8†t,”v‚ÈÇôÖÒ§esPm²ÛýÂ˜óÉÔm¾{ÂR°…gR%Aç§¡æÜBà-+iû;ž’¼à´¯Ôê‹J]¶\n¾m íh~ü}Q¨ö—mgæ’<ÉF×$TÛrQGŒTÜ”à0ŽµªíäZ¿N’|¤ãW­yÄU}àps\nv7RÓÓ»²×¼4j‘qæ‘‘”+…Œ°‘®œx‹¦›ñ¶TÃæ[“ÜþÔ¨dg~úãüõÒ`P$Ôêò]áT8Éî®™^Éþ:q¿“oâ›šŸ\'¡wU@	°P©45º¬Xî¶G¹Iä}	öÒß%ãžÊ?1Xý\'ŸÛýL\'’Ô ÔaO\"6ó¤ª`-Ó©êR78˜«*íëåä~ÍANê¯H™N¤¢ñj]X«k\rÉ‘úuÿ\0§ñ«VÄ2–·TÓ¡Œ‘ç	öÏ|}5P­R-khüËô:k¤\rÒÂ7!#ýXÎ”’0s)­ª³•9’Wôª)ÆPÚ’Î§Ž?Ž‡÷üø¶ÿ\0NæI©4à¸€ÆÜç·ÐöÔ6ø¡]•µÛð×$¤°T7)?æ)ôÎ¢:ÊÛuG¥§sqVÃÞ|­m\'•œ{ƒÏÛ_(Ë8.$6…!@Ä+trãŠ‹\ZA?Ù%4	À¼¡ÆÈ¿ßRµfæ5)Š…)ÈÅ>•:PH(ìUŸCÿ\0m>i•”	Ð TvÙA\"´øÿ\0\nñYËiÏ)õòè±Ô†ã·J«©Å)J7*T¬„ýrtQV^3ÄÅU¸Ù—W],\\-Ð-¯˜Ðy‘»)psÊO¸Æ©]qªÑíéTiÕË^MQ©3\ZHXð›qJî¬öÇ®©ö½&«\n»Eœ™É™ý´8„­t0´°HÆPväg±ÑNàªÛw<7-IÞ”:”<ØßÊAå\nÓ·}]Š?\\]~œ«f¾xæOÚr&mYM´–æ-²R$zê}å+Ÿ\r9÷ÁÖ·MfœåA¶³‡$•œû”ƒÿ\0:˜-£\'4ZIN\"sf™Âj\"É¤§;¿?ÇYÖì¤I˜§V’ÆÔ©>qÆ¼S#¶·H*kôDž=µp\"52BÞù§S%~5]Kê6Ñ=å¯]ou‡€$\rÖû¬½($¨V…7‡l~íUj•×ÔT”-IÝÛIäëÍV¤fTwåùSÏâW¾´#6©“’”å*jÇ	Mh©Ò­J	ÔšÏ/©Ö¹,Ø)âÕ¹àGþ’Ój1\\„ÂvdI	Øâ@À\nB‡âûwÔ;;º!Ü9ù¨s©Ï¥è³d9—’AöN\0Ï Žx:ƒ¸®ÐÚN¦#\'@}I÷:Õ²­‹§¨Š<)Sßq@–Ùl«®;\rpPµ!{àõ  çæt§_Ê\r}U-s:â ÓÚ %RÂ\\ÂÎ9Vý5wuôêM¼õ÷pÜŠ?6Æ©©Æß`SÄç×ªµ/¢Õ\nE³‹¶u2=:ÈmpAç¹QNRŸ_/\'F*ËTª¶Êz}Ó«Vºˆì°Š£-´‘ÊUÀ*}aí²–´z³üû˜íUj\0àf/Ý3›[£ViÝW 95-±SùW#º³‡€[É=øö:m:ƒU§Þ6¯õ±Óù¬nFLmJ#ÁXÀÊñ’’žFqØéEyÅ÷-µK¢ÑvB’ÜJ‚˜ÝøJweG’p3œ©xWÇÐ{ž34ÙÒRR*lÔ#D”«AM(‘´àtMµo`Tû¾>ßy7ž{Ž¯Hz‰O‡K‰I§B\\‰Ž°]yÔ#ô^0ÀäñÎHãÛF	R®*-:mb0.róŒ„îÜ¿r=ÐO¤ÿ\0}º©±æÓ\'ÑaÊmæ\n!ÞÄoVßëÎ5«Õ‰~’ô¶å‹<]ÓeÔÓ ¼—™üëÇ	úr	Ð´Ñk?¦ªsjŠ©ßÔ4Ë¶d»Nz,m¾èSŽ$£+	#€œcÓ=¹ÔÒêTITÚx®d@Ž±”•î1Ê÷(,î\0dãÛ:ÇÓ‰+cªŒ4šCl­[<áj	ZÛS—½š.×â\\vÃ©§]´øÐ¤­d!äñ¹‡€üM¬qŸC‚;hõÑm`ˆ¡µÅÔ¯Ì-Fi-:°\0óm?¸øÖsƒVì[¶-énÅ®´Ò£<K‘fFRTiM(¥Ö”GJ‚†}x:±5)#™Âº{ŒÆjCïÍ¡±œ«Õ¡åß\\[®Hu\'’v }5`¸ª%¨\r,”«xþ\ZUÝS³–ÒNBI\Z+Æé±ïiÙ‹¼¯çugOYö/þŸõ5Š¶3†üÎ¸p5ôéK¥D0£¨‡ÝþðƒØk}¶Ù¤0\'ÉJW!Äå–»íçþ=õ\n˜Ò&ÈSïJŽãžÚt‹““ÔÊ:l=Èÿ\0—RÈJB‰>Ã’të|:TêÝ³¨ˆ¡·*A*ZÜm¿\"1øy îúP¾ú#K»çÿ\0K+ì&Kqe!¸‘pƒŒ•¼¿t¤êt@¾íé;¦|–à¢-,%H§¶°q2?•À“Û=Éúk1æõ•êŸòƒ¡ßøŽ<uFöË]™U¬uò»p)æãSmêCaÉ ”—]Vv§$ã;R¢p8A§ë6M›pøµ\nmB¦ÂÝ!€‡‚ò7c*$ýµ`~ùMjEjÑ{äèê«¶ÜÇ2–…)gØäí­ž¥·bÞ™4ƒ=bßŽã¡½øÜœð#È:SMaÃÖ>ß?¼=ò±7ßêõ†\Z“Fé\Zh5:Ãì²Ä¦€JT•(\'8ÉÁÖˆ»NM«B\nÅuU:´Z—†’µo\\hëNô ûy{Ž5?uõ#¦´ûB…@»£Ã~è£¸—©ÿ\0Í	Ü3„oQ#ý^úšêLÊ3(½l“JUÕo×ÐÄôî¸Ó`}NÈÇ}YP5:2¡ÿ\08ëÀÝòŒ¤À?H ?\"qR\'(¹Ir/Ì9½{v)µyïÇÓV»*\r‹]«F¶+í&;Ž 2Ü…ùóß?}«Ñ>j=\Z¨V,­ªó°›R·å¸•ËPæT[É8ç\nÆsM	m«ç¢ÁX´¤»-e%3¤=—BÈpÛOôÖz»œ)euÎäÏÈ»Z¹Ðæ‹U¢Wí.  KdñÏ\Zè-·q±0Ðk!íÍU\"%*$þ±\ZLoù,Ü=‰Pa)&’\0Éã·:1tÊð3zCN©2²UEœóÈAÔ5½CúŠÒ}Æ56Óøq¥ˆ0[eÙ2–ô’Ø\0-ü\0VGº‚G>ºÈª›ìÈÀq2ãïXÝúFþ©ÿ\0êuIzC·¥\n›9Ø«¯RTäI,«\niý‡jÒGbƒùhðßñ5ýaÉMÔ\'\"Òz…tf&~ÕŸàäpîAÈã\'‘ŽÚ#0Ü¿HPäfrº| \nßyYS‡WYJZ[ÕÂV¥¬†Z?¬}ÏúG¯ì×©óô„2€p÷ÖÅ\"œªìÿ\0–*R#4ˆ¡èŸDýÎ´(¢µÉ•öæÖäý?ÌóJ¤T+ÕšÚ·ÚB÷<³úçéô\Z¸½f¶–ÃñCm¶FNõvÔä&¡ÀŽ#Fd6Ú`2BÔÈó4OoM\reìýp ¦ÆfÜe’ì,ªM6™oÖÛ£H@6µåÖH$çŽFw^ u¤5èô÷¨.ÖhŽH\røu¦–§š\'…º…yöê4•H¢T†÷·cÌ`™L`¡>\Z”û‰FÄ©|”¤v––7Ž®Ó’Ncdò˜] CœË‡¡4\nl[ç¢7^ˆäß¥-¨ËRGâÜ<ÀcHèuÕ/Wá.çéM›*i[òªh^\0¨ç8çœC\\6Óê°zxÜvôÚ­BiBBr§	p%)s5½qµ©Ý9øh™ÑúU&Ÿ©C‹mÄüe)êƒÅR¢3”¤íí«©Ð&•—±?\'¹Ä7QºËý%þÇþ¹þñ	«½\"Bß–‡IpáÎwqÿ\0æ‰–ÄbË´¤Qjô–«PHoÁFÅ\'Àì¤¡îp0;a´ºû‘HÄA»Q“v\"ÓjPJœu(Éûàé«iê¹B8â![$Ù×U6¹w¡mDM¦|¼ã€­d“XîŽ˜Ôí©I—Gs\nIÈÆ‡µK^U-Q§Äq8ðÒ¤-¾™×cõÑ]°¤±“±9î}3ªŠ­c)Ô_ªµ—/_YŸ¤÷dùVÍFÙ¬(:–Û%½ßˆqÆ]¬Ç™lÖíÖÏŠÁXFpAOÓ@Š-­hÝc>ÀS.€£ßøèÓ‰I¶nöiÁàËÜ…r=ÆªµCˆªÒ2HGLn÷%Yôç¸z“;åó±GŒþýS>!~cH\\ž¤ôÑ‡‰yf\\ú{D‡é;‹Ìžàç’5]²«É¥¦ò¦­jØÐj{iIÇá_\'ö<4YT(Ð*0ÈSr\"´±ì¤”/e(ä¬.q?ÿÙ','Chaimaa'),('Collaborateur',5,'C3333','Elbadii Marrakech','1981-02-10','Elghazi@norsys.fr','Rabat','Elghazi','0666485222','collaborateur3','ÿØÿà\0JFIF\0\0\0\0\0ÿÛ\0C\0		\n	\nÿÛ\0CÿÀ\0\0€\0€\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0?\0	\0\0\0!1	\"2AQaq#‘BC¡$3R\n%(bc‚ÁÑðÿÄ\0\0\0\0\0\0\0\0\0\0\0	\n\0ÿÄ\09\0\0\0\0\0\0!1AQ\"aq¡2‘ÁÑBb±á	3Rr’ÃðÿÚ\0\0\0?\0Ãå\r>uyÅÒµ{IrC9y^ÆKiþ¡XïàuÜ´ÅZ9¡Ug´Û¦g5-|Á\nwÛw²B¼yN?ûzéY–5ã¡§ÿ\0@¨Æ§.¢‰JkäW&³Ø $¥Gô#óÔVçºÜŒ¶íÖR¹\rGS€»åjZŠ³¶T{u\\óº”B;\nò*øaGmÏô¢ßG,êånâ‰6–ñ}—\"SÏ!#™Ô¾=»\n€8ï‚:íÓµ¦ñ´îŠ…U*P€‡‹*b¯.­ÄŽÄƒå\'9lxê¡Ð¶µ¶Åà£[Ug¨/¥HSKùˆPÆRèGöèŽvŸ»tRj5ÿ\0-Çy<‡áª1lÜ•%DóýG‚ïÐÝÊ[…D‚®õxÍ‹èkHI	=7£·Dné7ÅëißŽËvÑ¾aµ!Šr¤©Ã‡ÐBÚöIJøøŠ³ÇD–â¯]`k@5;N¯-5n¯iÇ¡!¹S-Ÿqù®Ó~U|df×Ä¥H(IPÂŠ\'¸ ¶ÆØîÚTj…´åiÉJöÒüYÔèI\'³¬È¤(gºI?œôzØWekN­Š}V­S*ø:%m¥•!öû ÆšÂ°¦–\0JBÎAJ¼\0.nP•\r*ýêX\n•ã[{&’í[×é„Â\"[v+l4”%Á3JW€J‰YÏnç÷ê–¼½\\·«4š…-û7²—^eé[\r€~U8–[@#¶OE&îva·[Z\rû¬”M\"œýÀÌ¹‘iEkU>òÔü Èq%h!H)Ï«é<ºUvîŽê¾¢=w³¶-\0ºõÈMEE©°ž”ô$)D7å¶áHxœ,r$«ú¿m´]4tjW‘Qýëe`ËàÝ„¶žá š—Éß>âæ\n-µ§vè#<­Cú­g\'¨¥Gs[º¸5LÑÛ\'è‚Ë,‘ûqFç¦=éõ°kŽñÔmv¡ï/BîËV™nY’êÔØ.¾å9×*	h¼”©m¨’|UÄöù†{öë‰IÚ~Ÿ/R\"P•yÖÑyËD¹eµˆÍÆ!ðÚ›JIV$”¤yù{œ“Ö;<»¹-¶„éäÅ=™²³+ÐéyÃä\0<Çz[	‡¹ýTC°hú‘ª\Zp­§ˆ²å©ÒÊqÉÕ\0CaïŸ¿L¶\rûr·µúuË>]».ö\"jR‹ŸÍ§©2¥—]ç“ó·ÅKÏŒ££?L´rÈ°õ\"üÝšûÈ°.8žÜÊ„‡“eM{.!.)@¥‚qç®n“5£ô}r~µ¯Vš›¦4ÛV”óôï„LœÊQ˜#¼¦”ãi!+99X\'ÏTÙ…ámsj \0I=\0‚R`ø¥®\"»±hÚ’Ø	\0r£ ’w1÷©nœT‡éû®•í»R}oiìhG¿¿%£Lq¯s° Œ$(<“Œ}MËNÑ÷k=‰í\\tÚå6„”Æ[žÛ´ôª\\æJT•)C–c‡8§±÷S“œô½¯«òØ¼«Zìš{Iôæ§TB­J+·XÈjžÒ¤ÁæÙw‹Jm·XTVr‚¸öêg¶}Ìi&×hZÈ%Þ:+_¯ÜÐ¢DŽ™7›\r±K,¿)ÐàZP·@Ì†¿–žÅIRŠ‡ÊÍv¦ÑHJàÄ\'é@Wy6ðÝ¥A¢$ÒiçÜÚi¸[ßq»a…£ÛA¨°)nV.ùÕÅ)ÓíF–¥¾XKx+–æ\"°Ú~dåÜ«åŠt×ëCUäÓ©v§tÔ·Hmºc‘Ü-Ç ?>Dy3ÂÀ%¥ºÒSó`•ŽÊŽ„«SÖÂÏÓ{Ê-åQv×P’Õ—\"Îæ]2d¥”:\ZCjf:VŸg²TOžä‘“@j¬’]õ¨Õ»‹\\ô€»í‰wÇf*¥ 3!‚ñC@…ŽH&C¤“Ÿ>; ±™4x`ªa\nëô«‹œµp½‰\0ñ$qõ¬¨ÃÖÍE|$O…¥ 3	ï€0“ŽÇ¿ôé…l#i­j^²_4õK÷&‘ÆrÖ¢êIú»‚a‚Sû†Ó¨é¢ƒŸKrŒbÃšÛ@$)÷¸ Àî¡Ø|ÇñÓFÒØè‹Qì­7tÜTše>#4ôÖ×f®¥ È€>¬’sÕ6\'r§-‡É¦\nùŽÔw—k|®éS£a=Ïö¦g¥;n²ªÈdf\ZrB‚/¥ ‘ôŒŽÇÏaß£ÃN½2tÊÿ\0fgñ&cY÷$fýÈšÇ¶ÝLrA·T8“Žà‚{ãÇQm½t¯Z¨TÄPîjÂ[nAŸ˜p¤=ÖOo9) ŽžæßŸ‹SÓ¨´*‚i’”„óBšëYúÂ\\ç r<g¥Â¾a¥B¶§e»joX*¶Ò}‚èÕ¿Rn\ZŒÜ“†ÙBÚTCœ@R”\0Æsàõiê¿¤¦ŒjÝý-ê	¦M[žóHS¼J3žC $ç?¿Fæ—Ùnª«³NaM2ÑyÎ!!óÆpFüt[·Ø”ñÇnŠ²Þó`­òDqKáš—nøfÒ s´ï^zþ£Û¿ö»bmÇª:iXe)t®UR\0â9%\\\nWôùRsŒý=R;Õhµ˜:“o\\´[bÙ§EmB0m.T#åI÷VØ	ùÀN\nˆò{Üu¶?U}´P7µ@§¿ã£2šå9ô¤ó1•;ñR9§ôÎzÁ\r¿n[V.»i¾¨ØŒJ£PêÕgíêÜº\\ß[¹m!9Ï¢ŒöNGD™~àÛ])‚fOô ì}„b60(sê?zd–<Õ×®ÝïÕ£·\Z›*5§RˆÌ°ÚT…s§6ÚOcôò8>{’z_\ZaoÑäî¾—C©´¥Ûl*²IHQZÂe¼ã\'hå>ç£»M¦Æ‡aïš ]ÌÕPÞŽÒ”>Tæ@eD‘òŽäÏn€¹5ÄÙ{ŸÔ•–’¦éŒÜédG¸ïÆM`c\0Ÿ £&Ÿ–¬ÒívPêUýµOmyR¤êMÝí²â¢Å³ëªç“ÉYsÿ\0ø\0côèW¼*û.ë=6áÊ¢J´hý¾ •$\"k®Ê„©Xý0;:9¬ª+t‹‹^šy‘ñìºŽ-à(ºŸ~ãåZ?¯Ž”^îËGÕ¦Ø}†œnnVFi* Éã¥ÞkiXƒËæ9üi£¯g»mkypƒ¸Óõ43[:æÍ6³§—dG#Ï©9M	‘	(0\\JX2?™–Ò¤¼Ž$ù9íÔÊ“é-¨5ÚVé¹`Æ‘wEªN¤´ô*Tx.HSœ]<$à d‘Ó	ôq›íj6ß_®C¬µøÍf}SâÈ¬!ÖX$«=ˆ?~Ý4;ÂœšöËlëžgÃ¾îœÞ5y7#ÒLEDmu‡ÛR©R}²êP¤’xøÏGO[-Ihð`oU¬]8õúPèÔ’$Àß‰#½g³F=2Ï[‹¨¶¶¸Ø´+v ¹èf=M·•\0Fy,¨ÌB¡¾kp•xÏR›ÏÒFû²4ŸJõbMílÖéW|™MS£F–¶Þe˜î{n¼àu”å ÷9?œvÉå°*=FÓ—lØÏÈÛ)I¸óŒE<ã†Ÿ÷PVsÜ—#¥Iÿ\0lþ½û¤‹U^ËöS”óOVSCº¤·Ì}*{ˆ‡la\\|ö\\[„Z!ä™*¥øÄnUˆ9n³	Rr‡cÖ®MÓÆ°f&ÚêyŠ½iE¡•³°â²?Ò¿lúã«‡V÷wK¤×§6Ö‹Ó5×ÓÈïB.2ëç·¶€ WÜxõüÛ£j…öæ«]—Ûqÿ\0ÅN)ª4`ï,¥%n,““’}¿¿€:9)z=©zr¸u;fÜ£B©E”¹‘%Ç’†ä(`¸¤«ŠñØ«\0ô”/¡§RÛÛ„Ž‡­lö‚½òåvãu™2>•ÞØeÕ¦k¨Á©Y–´«Ñ(³Q ,”ÅI(ð3Ÿ#±ëB­Þú 4ZF¢iÕ\ZUÄ‡R¦‘I’áöƒg$gÇ‚Û¿HÏ`ÛmÔ=AÝµ-nkU*Åv®‰UG\Z@KhG Tp\0·l}Ï[.ß×ÿ\0øk¸Ó&˜¥WiTÒáZSž-¶‚V¤ãÇ`ç¨ :øqæÆ Š<N%mb¦m.•9>¾æ­2õôÐÚ´KkWt§Rtò®·^bcI§.Cl-$qq§¶”\n³ã‰¯NË@·C£–¶œ¹ô–ð‰_ŠÒ‚$GZÌˆÊ=Ç6—…\0@8>XÙþÊ÷³ºMÌ[’m\råÂÒ}>vªú+Â\\–¤.3hQÇÃBtqt¬ñHÇ“ÉCÏZlÙÂµ_n›«m£q´š‹Þžý³{PéÂK²Z~nãî\0¤òo%HW1ÜaFþÓ0¹nÒXí±àÐ>=’¬Þyæ™Ô‡’\n€#ñ.‡éN—p5z}½£\Z_©°%SbQ%¼ûù 6r?¶zóÔí|µkWëM$\ZsWSr!ÈáÌ²ën%hR~ä‚2HÀûué_¾º“Ô­šnn«<ä±dU^m!Xä Âˆ\0þs×“*ëþ7¨®\\4Øp(–ýQ%¢PPf£ìº•-•Œ|„dwÊ¼tFõ¢~dºÄÖ—XJµZü1ÉWè+FšqH™ZÚ¾æ5ÎŠâõjUl¡\nByË«4®\\‰\0’¤àŒž@ô·L9õÝTÜ…N|‡ZfT¹,SRé!>ÔŠƒËZÒ Iàp¾ý»«=ri~ªZMÒ»«IžŠÜxµ[¢pÈ—f7ÄEšÜ¡´¦ˆâ¥2”s°\'±ÏU7­·WîFn÷U\nžE:ŸMø_æûdFIÔKYÊÉ* ŽÇóÔ&1”„)+JÄÿ\0\"»Ïj±^Rt\0PgùÓ·Þ›v§Êƒlëné(•\ns´ÆX²£Â.´}ÆtAŠãŠZÉù@Jüýû‘~ñ«NÑäj³Ìû/È¶ã©¸ZÁÿ\0ƒÑÅ{úèeó{nô£Ü–\\J¥ó\r¸±áÍ”·Û¦©1ã3„”óåðÙñþ°;c=;ˆÓz®¤l~JF‰U¶ü‡¦,¡´\'àT0HÕÐn!‹£üÉ§ž”¥ òþ4÷¢+\\1cpÛ@¬ˆ…ÂOn(ûôÒª[õzVÒ“A«š¥V=«|ÔæÂmÀâ©®#“Î çÒ…}ŽSœã®ÅõX£ÔcíšA‰ñUò\n³Um¥§ç`=]|‚€ÀWó1ØøÈûž‚Ýœêîžm†}©áÒyš¶«”9CüPî»>¢—Gºž	—\"\0ì89¾`ë&šÕ«ö=Y»›O`Òè\Z8tÊ=«š;®¿%R×$ËSå)OT28ç°èãÌ¶‹¶RPL“þÓûPþ^À.íñfß}0ˆ\0™ñ¾ÓÞ¡FÔŠ>žE¦±yT¥H‚óUÆ¨?GS²\"zZ*m¤žëuIN;€F2\0ìOú†\\ò(ÛAôþ¨Ã[jª».|É1Z½çÛþ9).d÷W\0[BTH=ÈÏàV¶œS\"Ø5Zefò²ê÷ŒŠ—ñ$ÉbèŽP\\}Å\08¥#%ÖÁÂ@ÊTF3Ñu®Z»+Tô{kZeE´èaÛçLù²«”åÊwEÉAÈï¥*Çp*PÀórönÃÖÂP^Ý1ßòâ€É—æín†LdþµkéÍ=Šu§µËnK¥Ç¹¥ÓgAQ†Ò[]IÇp´8æ\0Ë‡9VHä{öèâßtë@.}·i4æ(W ³Ë—,V;&tPuI½ÎJR3å_~¾ÑkjýÝZÒ¢)úE¹OnKMù°BOê@æqût±}{õé½?õÕ‹+ù5ÚM6ŽßÃ²~XËöËèþy¡D~{ô«·eÇÒ ØVÕXcM[èì4Ö¢=\r´yË¦öºõ~å¥|ðXC1šQ¶éîrNÞ>ã­=ÕJq…ÓªŽESR¶‹O‡ÒFœ=qÖ}ýcîRJÓX³«vÔø±£!HM6b•áç‚H[g*ÀÆGo8éþnwszñXÒ=/ÔWm;Yá]ÊZ«¶­cãiÓ`ûEÁh%KFR¯OsÕ¶Œ\"ÆÍÆÂeÀdõ§>”5˜²cøÎ,Ó8Ê€H3¸0O=ªqAØ«£›‚75¿jÁ¨ZÕ9«—Tg=™4ð¥d²´ý.%$ö>qût×ªúih\\¨µÅÃGV™Iq2`Iq±îGq …ù#ïÕC Z—S¬ªŠ“>åI¶Pâ‹€yÆ¸=¦JOã¬Ù}»(qN¥P`þtñ¼HÜ\"Öðã ¦G_?¨æ‚/Rš„*^Ã÷VüÙ…Ùu›Pò§TÞ‘ú•`c¯==ïí×ÑÍšhåùOÓêÒÖ¶®†(WsŠyR)µÆ*PÛR¯•‡š%ÆTÝ\\‘Ë%IëpÞ¥Z¤Ö«Àµö?c˜Õ+ãQ\'G¥8rÜh…ÎN­Üw\r„6²¯¾<~:K¾®E{Tm­·iüê#µ¯2Ô¨TÚý´‰lÎ€§Aû%,À§´„£ÉZ×ùZüÚ®.~+f\ZNÞGcúÑŸ³Ì‡ˆbVnØá¶«~íI. IJAHÔGmÎÕ…íx³Ù«]šKdZô…ÐU9×âËš–	 »9i{*àÚA	Îxöí×óRý?už¢Üêƒÿ\0hÒTí*E^5k¯·óåÈ¨ˆÜŒ$q@%ÂŽî£Št½\nE:­fé½Á_¶i¸s%çf %Ke÷Ç¸±Ù(ÉV;à•Æz\")0&–ºFóØGM‘å%Â¶°¯HC¹Ïž]N¸ÅËLOö¥î%—/lîUi|…4´ÎÊ~âk&né=½§ò(ÌÞlÜu*¢ŸJ™ŸâX3ùÄ\'ÛmèèìJ²HÈïùÛÛÌ3W¨în„&CKE,)$ü§Û¥òR[§r\"çX±YøN*šP¶Ê’G‡|ê:·tÚX5íÐ8àAâ¸‰Â¾á4¤ÿ\0Ç~”ùÏ]Ú\ZqbèŠfä0ÓNé$ï×þ\n®w¦7§®‡næöÖ*Î³ÑeÔb[“£BM,µ//»Ž<B^*@N\0)!Îé$Ó;Üg¡ÞÅm>¬WìÝ4¹i÷\n\Za®K-û…l§ºT¥v÷üþF}ªtºb5\"[×sÅ¦Iq\r&Dµ6æ@ùZ\rã8ùSùéëî«Ü:dÂØø¤¿\"» [A4ºœÕ€>¢þÙüt÷v×á H­mÄ¯– óýë%ºÕèá Ô;ŸVª­Jäµí;: ˆ’©«}Ù.OäR’%g(âV‚HýóÒœ¼vÅaR7CÒºMZç¥Ð\'U¢Rãéuå­m´µp8çÜ^Ü\'pzt›óº¯ezƒ×Ý¦]Uúu†û•6çÒ˜œóqj/…ËuÖAöÜ)øb”	:­Z%2­¾kB«XCµ	²dÌ—\Z;ËR„uÇe”¡ô vImôŒöWu}‡W0ßÃLÉŠ†·î\Z·uÝ_…$ýºV·½-çÚ¶&»W®{Þd–ÜÅ<î9¶¶PTœ+È¨“ùêÈµ=,6KêêYº\rã^µ›îáµ¥?Hu‹y´iõˆˆî:ã½ÜZ¦IHýóÒ ¤Ü5Ë~Õ¿÷™™\"2Kx<HR›úõ§ßD†\"ÆÑû-(MQ?—qÉ`y\'ôÏHì!)ÔÛ¨ø­üâ¶g\r¢ÉËÖ¿ÕJ@RFõ×½z:^µúvÙÑkfMéK€µ§Ôç>Ü9â]N*T˜O\"Ë¥`Ý9=(­&ÝÅKiš­xm>£H½«z·%˜T[ÂQzž£Åûd\'ëÀXP=¼GU6×¬ÏPû_Ô_¬ëô~\\kÊ±6\\¼†#(»1çìd$©\nB›?p ~ý2àÝtê•™H¦î«Nèõ;¹—¿÷=m˜©›yÂ}ÜrAqœ+¯PñœD“¥HƒÒØ÷£¬¿—íØe*ijQ)EJ™=Ò8ž¶†(öU\nþ·§4ý—*r!¸Œ”ç‚‡å>üƒ×ÃTwOcÒ(µ–h5vj56âH}°ËJRPÑQWè‘ŽçíŽ³Ysz–=¦fgOíºuNŸ)––”IiÀž#=ÉÇtä<t¸NðµO^ë²tGCêRž¿.Z|™5šä‘Â5“Am¤ª\\§”{¥E	=»)iHò:ojã©\ZSá¡‘•[ºÄAx—^Q#ë´ÕÝln·Xen>µ¸:MÜÜëæ#S PåÉŽ•°ÓªB‚ÔËyãò „<“ûô8Ü·ífø¹ß¼ë•µzÝl¸ÅQù•:¹ùÉRÉû¨ùë‹O§S-{N+6š§=\n‹#Ý„©/:ÂÖáÿ\0É\\Jˆûg@õ\npµk\rÜñ	ÿ\0\nÕRÓî?çÔ—ã\nÊOLf¬	ãbÐ×¡¿w_a˜vUÂÚe-$^)\08ä\rJPñ“Ì\r@¤qµ\\±žn Ál¦4èo ¤¶ú‰_Ø‚“Û±Ïìz5ër¶¦Þí7…Z·n¦¨›ö`ÌŒÇÄGeÆ›r3Š)$3å?œ¬ª%]ƒZzž™(,Nˆ*ð\nObµ}mëÔSU´ÑÝmÐÃMa<¸74¶$È¦=œæ€µ!\'ÿ\0•Îí(}ÒáJq†ßLzÒßßÝÚÏ7e§nlëq­¥â;POP #ÉT÷ý.šÑ{ßczªK>À¼©]J²ªÂêÔ(ÒÞœãÝ`²ï¼…’”%	OÛ¾~ùë÷¼oGÝ,­[Z¯»:¶×C¾«\n\\ŠöŸ¥ÿ\0nt·Û÷(é{Ë…(ï‘AïÃd”wè{»š‰Ù±ín­)êv¤iÅÔõËn°€”H‘O‘- Ÿ+[R™Y>NHéºê©…ZèÛÊ,j•iÅJ£!Ç&O{’&¸„§i.c(\n§óØxê¢ÿ\0´[JeCˆõØ‚+Ï.‰_Ù¾›¦vŽAã´Ö–‡¦î›ê®ßj²ë5Í¾¬Û]\ZŽ¯Ž¶\r¿!Çé4–`ÊöýÎ)WÌ§ä §éöó÷ëDZ•aÏÖûFSg[÷Î¸áÏ„üêz¢¸ú£Ô\Z’[ïÍf9OsÜ`Fsï¥¤Ô\rV¹© V¦F¶ÜYC\r¿r\Zr$6€y¼ ¥ã!KÁ$øé“@¶ýA-ý*½n›pOÖ7Oj¾½/ˆì˜µYÎ°ò]øHUžb¢Œe§\n\\?)#=‰ÙÄRj{úRß²K×«¹Yd˜ˆ}(éõô­Ð­HÛ”zfÞ4²•ZÝ-*ä‰W“:*ˆ­T™%MTòTB•	Kq)Ç8ïœ?»¥š³¥¤w;‡J®ŠuZ\Zª«f“>Œ¾ôv[y6€ t6€;ŒãÏZ­ƒê£|i.ãâêáIÕæ¥\nTx—‰vÓS­GË|€L¶½ÆŸeÀT¤ºÒ°FAî\0èÜˆÒßZm\0¸µfÑº7)kÊŒ#Až[¤Í¦·üÄ>ÒªG¼„8¤€Že-‚’©^©\ZIÜƒ1ÞkøÍ9l`\r3ÐO_JÏ%‰¬¶®ZQî[:{\Zd—’èm\"ÛZqÉ—“å+IÆAý1sÖˆý07oiY56-:Ôtd6yÅ+þâòpG÷ûþ:óüÐ=W¹4j½&LV¥Ï·ß)]FÈOû­ÿ\0õ3ûÇO¿CuÎ$¶-ûž…TLúká6òÙMœcö?oÈ=\'ËÊBÃˆ<½n¦rÈÃ‰·}ÓƒoNÞ¢µù¿ŒÞ\Z¹_»Ý©UšVáé”„²š;òPÄµ–’¯i!ó€Ì´•(ûk(WjnËÔZîší[IwmV4Úþ¶ç®-R‹YeQ¥Át ‚•¶çÌH\nIJâ®YI#¹Úg§†î)úeÁ²nyé\\æûFqDd§ìSÏS\r˜é¶èvÉ­nFÒ5¹µ­šç[uj)‡d™‘ža’ùO2Ùâ´qÎ0³ÑãM1x×Ì ¾£Î‘X{÷–˜ƒXEÛšZR‚R£ÐŸ!×µyüèÕ«»½ê?Mµô†Ï‘mZ#ñg]ÕØå0\"ÄQÚRþ·\nsó$cÉèð¢Ø:E´Ý*¯íïGnHº™©•×uPP\'6‚ŠT5•)_…\0VBˆR†;ã°ÃMÔq¹-ÈÖ­Qž¢Ù`ª‡A?Â€àáoÁ\'Ç]¦V Em˜Mü3O Ã÷ý^ª,3*9Šîç»Ÿ¸}¾xÎ;Ž:yP‘øAè¢O1È¹š¸©1ÐµÍ¥( ¶ün)Î\0luRÏ‰þ\"³jvœÄ#âP—PÁW‘ƒã¿ô=v­[º3u¨ä¸Y–@ Œàxÿ\0ûñ×Öý€õ&²ä¨ `¬HF;‚;ý3ÑÏ!ÖJù­oõ³\Z.TÂù0AóÌPÍe\\s£ÑàÄ—î1qÛ½µ¥^\\ˆâ°GêÏüt\\ÛÕT£Üö¤ûoòA|ÿ\0^‡Jõ\"<Ú¬KÒ–”¥©Œ;Lž<¯!Jüãûu`Á«&3Úw0™¯:Ón÷î’AZ¿²P¸ê£R˜:gíö¬Úk·økÞ$})pêE½©›Hß5oXô~ðÖÍÊÃuFG –“1Ç¥¶@ð„(ŽÝÒ²<ÔçWuá»¯¼·âR—Rªÿ\0ÕÅ‚\n[(òZyg%!J=¼uvo–ÛŸTµ¬-A‚ô¦Ø£JøIì¥D%LÈ)Kn÷àòïöçÐmK¥É½#ÓêrªÑí{iEO®C§“¡ò¬/Úgêtä`c\0“õg·_N!k|Ï§Ó¤×š¯{ïg\rålÝugn’––¢âGHsÅ·TŠ·´†Ø§VÓ&«tÜÕj=¥¾1¦ÃÍ²–ÈR‚¤¾ÊÀÎ?Nœö×ªº’ÕÑ£­IÔ+QˆÒ\">–j%!I)2]J]øxA#™O%œzöÿ\0£¶ä•G¶ivlØ`:»zuY,ˆÈJr§ê¯ç’TGÌ¨¬„„‡*ÊŠôCC­Š–±\\¿S\"à¶cÁKíÛpœTZm©9B‚€„¯˜?\'4åI<Ô\0)ç9©²õ¦¶•Nº4Š6¤nP)Õ\Z…Z%f4vã¶ädG£á2”6™nŽEjìAöÁBsÿ\0sÎ4O¥ûTÚ–Ý«v¯é>Þí}3Ô‰áÒ*óìZ\ZXvt%(¸¯â-Æ%.ÅK«.óW2’r’~n‚<·¯Wíe»oJ4ûLe-kS)Íæ=1¥¡Ô°¥$¥÷Â*+p%KJpžÝ7­\n´Ÿ´ìh¬T*5\nÝ]õ™çË$½-Óå]ü })Û0½cÇ¹¡ä\'C‡GänÛNI}ˆ³Qó¤æ;Øì¬yOÿ\0¾ˆ­¼Í©i…Ó{Y¯ÍX¶ÒãhZ²Û-½œ„~.ØqÕ{aÌ¥;mÄ~§W\\U%A+R•$…|¡ÞýÓ‚@Pûƒã¨Å¥t¤šœ\nƒ¡÷ƒ3)(P9*)}\nkô%_Ó¤ÊD#Ië]ñö«•p{¼(zô-IWQáàýtŸ¥jÇaº©6sÛ\nb¤ò\"­Hâ°£ƒûÿ\0nµ…Sæ=¢weNÿ\0URyŽp\\öWßòqúõ’=˜èÂ*úYm^L×‚*p_h¿ºSŽÄý?lõ¢Ý.¼L„úÒâTØA\n=ÕŒÿ\0[`Î)¥85Ê¬E¦®ÙxL(Èë^~ÖýËsÛ¹4ë]éRÈ#\n+$ä~rz2tnŽþ«j^˜i“n*;÷ÃN¡©üä²‡ä¡¥9ÊR¢Gê:i;©Ù^nco?ûNí*Íÿ\0ß•RM»©V¬7’ç¾‡””TÙA*WÌGÌ0B²\0àz¾öëé¦:§¶^·oÃqÏíúã˜ûS(´êeJ$7(O6íü[òç»#å´Òp‚0T£œØàî¥{™O3Ò+²ß¾~‡åWmƒŽ5|à[(d\'[Èp&Òé•%SÐ£ëµzÐu›J«úOhG¶t’¯Jm˜ŠÈ%š„4ßmÂÝu§óŸœ—Øô¿]nø° \\´±ñ’#$¶â¾üß÷:ÝçbmËÔßk×‹x©w®–ÖœWðjÐA‹9JeEUbsBKNsJÔ…qàâ‚‡\nzÂ~¤mÿ\0U¶7¹mÛ%Ë5šôº~j¶Ôå²¦ãÜÔì’‡RŽá+R´dñqw&ËµS.•þÆ€}Ã}ë—‹Z5”qµ+ç­	R¤•¤w\'}@xH;ìz§å_Ý&Ð¸åÔä¢š‰†lCâ’’TèBI?Ž \ZQvKºkÏ\\sÓÂV# Œ%$÷=€*Wà¿CFëoh\rÔìÈÔª|š+s—.¥\"+„qmß‘¼>Ý—Û®æ†Ý©–¶#-ãó\0‡*J>È@ñó?Ð§Ì)W\ZÀq[ Ï¶ï1ÕØ¡cK&u0&}(ýÖ;‚Io¥ÖV•ÀUÔ¶“‚¥>¥¤2SŸ\nâ¬ýºO:q©)¤ÖX§¼Ó%1hl¸á\rD’â)hlvSJ\n‰ÂÔþŽÝÒ^ðÜÓÇ­Ê\\Ø²îw$°IË§‘ÀÈÉ\'·JŽ]@PâÕ*KÜh0¡ºUŸm.æ-.€°ÞPÁg>:#¶d¬•Wÿ\0ÄOÚ=¶/œEµ¡J‘nÚS\"¨É Ÿ)§“³}BÓ÷nÓeÛwÃ&Ÿ·ë7%m*\r3Rf*yºY‹%|P†ä¾|ŽT°‹Óäjýñ}P-ú5µV—I\\‚)Ð=¬*H$eÇð áÁ8ð>TÖh6;ªv]=5{jån…Ö…O.º¦xöwÜ\r¸¢¤-)ËhòJI ƒòàm‹ÒŠƒ¦—áKf¨Ñ]Ëû³bHAeú[€l)?î6¿Äœÿ\0œ—Î›\0I®v!±\nYšwÛc´¯I4«z•dµm)qã.gB\nÓ†øò!*88Ïcùè˜¸®è”*B¯9­í©Ïi…\0p¯›ÀÇÜyý:–¶ZR8¶R[Æ\0IÈþP›”½Û°tª±9™\"RÑ	R9a+úÈòxç©^!¿„	ªuñ^JÌ[°ë-Kþ!ŠI–I‘Wf}Â?î6¡ô’IÝú¤´rÞ¸•©-Û•Ø.F¨Óç»*cnŒñÉ\nýAò>ÄumØbi¦Ü(q\nÿ\0JýW˜Ñ¡\\÷õÑsS©à%¨`€„¥±öüüÊ\'¥€JKRk³>ô/[³€3ˆ[9¥j%\Zz­Ï¤G¦æ´±½GK·ž¦¹)õÇx†ÉãÅü~Ý7ëJÿ\0˜Í©)µ¨¡¾\n Ÿ¿ã·Û¤•·¥Äµ­D¾rë­´xá)QòGäýº?l+ÉÉ¶s’œ’ÙI\nXùòSqý»õ’Á&¹Ë{rtÐy°=ÈjŽÍýVæé­BŸ\\¹´§RîYH©ÑÝU\Z[åAke)$î¸UŒpæAÆzÖîúv¥;öÓj\r‘¨u:Í»>—%Ùôjí$4©][%²\0p¶U”•#¶x\'c=ezì§_»–þ­iuõ.Æ¿ê’‹p+m-+z’¦ÚJK8ÂÒ’TCjìJ‰\'­ClZÍÏ·Ê»wßë¼.ëF«µz“è$GR¶¥H^žXBÒµ\0”Ód†Ë*Ü~õ÷í?_Þ]Ùãöëøwm #Z$(é•6>1F^™ØPtîÄ²¬Èå‰&GƒHÈoÞLvÐPøƒÃ8Ïlõý@Û8ÔmGÿ\0$÷_¤¶ìÊÄë!™ð®/‚d)æ 8¤<—ÜHî¦RPâTÑÈ(öÏEVä=zöM ’êô\nERèÕ»²:ÔÊcÑc{pÔ qËãÂ’{ØX?lõ›ÝúzÑîGxZe©­švèªbº·!ÀB”ü÷’[nD¥áNE¶”¥$ã9ñÔ«§ZRJf™^ïþËsÎµ›‘oðZ·•©Ní©uBd(˜˜0ÄšÈFîµ‰Êöç/§(²Ýœ	h¦3™öÒ\ZqIbV§Gž˜þÄU·oyûËZk·ÖÝ5“.LVeí¸ÚSË4‚¾øÆ¿K;X4²m×U•*—\r^CÎ¹Ã$ÏK\\Æ	úŠáÉÏ·Už™]U–èµ«uN¾Óc‹+AÈ\nÏûcÇTZ¡Ô¡öÆãcA·PÞ_º§Ô…\\©N	I$‰ìAûQ¯qßP.ëƒUoÛf—.ß·êuŸv›	R”â¢Fæ¿m’µ•p dþÝDÓ¤5ë‰¨ÒÛv‹/˜K«¥6øaX÷VAÉïŽ]Æ{ÝB¬Âº…*ó¢0Rü¶ÛDÏl¤ñZSÙ^?ñÔëLuf•Jk¶Â®@Ôej$\0{yî ;’>ßn§²‚“)æ“™†õW2OŸç_»M»›Lo¤Qï*v‚üÐÉC2>|pmj\niÁ‚~EË¶\nH­mt5½)©Ù•Ù5š­7ø{\nŒÄÚd?eøÍ€”©µî¥\'?!ñùì:V#T6ù­–üKf]^$&Õ1€ªuQ±‹ŸRUÌå.‚‚\'õè²±´ÏX(wti’%Ñ¯M9­E23ñb€âXÎW‘“ÁcŽ±ÎzÊóbT(P:¤Àé[´Ú¾ÿ\0l{æÛ¶^2ã^	©¯œÚ1l2Ü\'¾’_Šµ[R¸‚F\nrO~®íÙj¥6¡cM·íêš”åH“){Ÿž,#“õ\0r\0ÇJ›ÓÛJ¶_Z·+–õ*«HgZÚŠ\"U©uˆë!À´ä©…Œ$¤Œ(|É)9íß§gé~Ûìë\nŸ%\n‘*ÞX)uÉ/{î›\'($œò*žß¯_˜µXLLŠ†íÇ#ŠÿÙ','Jabrane'),('Collaborateur',6,'C4444','Elaazouzia Marrakech','1985-05-01','Elhouch@norsys.fr','Agadir','Elhouch','0666857495','collaborateur4','ÿØÿáExif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0€\0\0\0\0\0\0\0€\0\0\0\0\0\0\0\0\0ž\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0¬(\0\0\0\0\0\0\01\0\0\0\0\0\0\0´2\0\0\0\0\0\0\0Ð‡i\0\0\0\0\0\0\0ä\0\0\0\0\0\0\nü€\0\0\'\0\nü€\0\0\'Adobe Photoshop CS5 Windows\02014:05:23 10:54:40\0\0\0\0\0\0\00221 \0\0\0\0ÿÿ\0\0 \0\0\0\0\0\0\0` \0\0\0\0\0\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0j\0\0\0\0\0\0r(\0\0\0\0\0\0\0\0\0\0\0\0\0z\0\0\0\0\0\0\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿØÿí\0Adobe_CM\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0`\0`\"\0ÿÝ\0\0ÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sðáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑð3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0õT’I%)$’IJI%×:Å=#Ù6jó¥LñwþE%3ê½g¦ôŠ=|ûÛKOÑiÕÎþ£>“—%“þ4q»0qkçXv“ýV.®õ|Î­œüŒ——½Æ\Z;û­š³í°°3ÊT›}#3üjQEôñE·¸{Û»ÚÓáüµçÙÝf¬ËsñÅn{‹‹«=‰ú;JÏ{‰Ý	Éƒº„ˆÚ›Øáº³-\'¿ ø\0ã C‡åQcË#ƒÈF$lÒ5Õ0Š\\\r¿ÿÐõT”\rŒÂoYž(XU$ICÔgŠ^«<Q°¦KÌ¾¾õK2z‘Ã¬î5û\ZÑÀñ?Örô>£VÙ.?Í°¸/2é”¿\')ýO\"½â÷×N O·ÚšeA|#fœÌ~‚\\Ñe²+:‡QúÝ¤é/e½@õŸÌÈ¯P}®:ÿ\0e6$ÑêÉ“±Ñç#E4„R„î~*F\"cû‰ií¨C)é1kDÄèšvHÝÿÑô\nÝ!¥b€ÞYiPrˆ»¶A0tªd™ ©¦Ôsë­–”ÌJ¿Íµ´·áËÿ\0è¬o«ŽÇ{,®ë\Z[ô›ºZ“µkýaË¬ýeéØ¯ÔSU–€xÞíÿ\0ELeÒk{É;ŽÓ@tá*]õ_^µÖš–´+gÒ$®w¬ôþ°ìk¶¶ê€ÜæÄF¿£]ÚÛÚàö“Û•g,×v;›¤9¤}áÎ¬ø²Ë4<\'rÁUŒšÍw>¿ÜqqA#ò«\rÆª?EÀøQ¶ê öja¿ÿÒõTÀ”Rá\n¥÷‰B)PÜ2˜P…²œX%S%œúÓ|}iªÓÅA³àÝÿ\0}W¨¾ÖßöFÖ˜÷:#]‹/ë}dõw˜†¾±¯žÛÿ\0«Ygô\\â=jœjy:ÎÏ¢ïóTÔØ2\néjµîÈ¡Î/Ç5;\\J>oÚ+³h-Ú`ƒ¢±f$¸›5\'”ÞÊXvÀì£5«?Õâ:µ{3íótýê›š´z©f=Ã¹Tž5ù«1:&„Çª^eÝT\\ßyóÑª‹‡½Zÿ\0ÿÓïGP%šYùÇR«2Ñ°Â†é<¡ H¢€@:7Ùd÷SÞGuR‚µîÕ Ÿ‚Œâ½Âóÿ\0YqÅ¹u–a°cÄZßâ¸ž‘×2ºCì©­õ1ì2úÉ‚4ÞÂ½7ª`Øqê¹Í2Ò\Z|@Ü¼›\"²-tø•!Fq=>IH^²¬Uæ5Þ‹æòÓÚU\\«r.çAÝet†fíìöÂès*-¡Îo$iñMœDe£.9™ÂÏàò¶7u®>«¹ºüÖ¡²›{¡RpÕL^CñÕj¢áîE„ÛdÂ+ÿÔ×«5¥¼©·(ÊÆÅe–€yÑ^ÅÂ¾Ë\Z\0!®vÝç‰H•¢%èzm.¾lyÛK>“ýHVîê›iÆ“¦ã	²qèf;DWS}Ç€OúKŒêÝuÕåšê:Cìï¯æV2™&ƒ<1/]›Õ±ìÇu6<n#pà/%ËlÝg›ŠÖ9¯Þ\\÷Xñ$ÏóYý•—f¶8ü€<Džµø.pˆ…ºk]ööþiåu®øæy=Òën€t®•¬ÛT¿@nMK&Qópº…BºC\0Ð,W6JØê·z––·†¬ïH§C@Ç“R¬$£Ñˆëlk\Z	.Fm¤-lc@nÑ¾û´c|¼OòQ‘­‘õ/ÿÙÿíhPhotoshop 3.0\08BIM\0\0\0\0\0Z\0%G\0\0È\n\08BIM%\0\0\0\0\0£ñ§÷Eh~ý!r@•¯aU‘8BIM:\0\0\0\0\0¯\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0P\0R\0N\0_\0P\0Z\0 \0(\0H\0P\0 \0L\0a\0s\0e\0r\0J\0e\0t\0 \0P\02\00\05\05\0d\0n\0)\0\0\08BIM;\0\0\0\0²\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@oà\0\0\0\0\0\0\0\0\0Grn doub@oà\0\0\0\0\0\0\0\0\0Bl  doub@oà\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\08BIMí\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?€\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\09\0\0\0\0\0\0\0\0\0\0\0\0\0\0`\0\0\0`\0\0\0\0a\08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`\0\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0`\0\0\0\0Rghtlong\0\0\0`\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0`\0\0\0\0Rghtlong\0\0\0`\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?ð\0\0\0\0\0\08BIM\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0*\0\0\0\0\0\0`\0\0\0`\0\0 \0\0l\0\0\0\0\0ÿØÿí\0Adobe_CM\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0`\0`\"\0ÿÝ\0\0ÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sðáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑð3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0õT’I%)$’IJI%×:Å=#Ù6jó¥LñwþE%3ê½g¦ôŠ=|ûÛKOÑiÕÎþ£>“—%“þ4q»0qkçXv“ýV.®õ|Î­œüŒ——½Æ\Z;û­š³í°°3ÊT›}#3üjQEôñE·¸{Û»ÚÓáüµçÙÝf¬ËsñÅn{‹‹«=‰ú;JÏ{‰Ý	Éƒº„ˆÚ›Øáº³-\'¿ ø\0ã C‡åQcË#ƒÈF$lÒ5Õ0Š\\\r¿ÿÐõT”\rŒÂoYž(XU$ICÔgŠ^«<Q°¦KÌ¾¾õK2z‘Ã¬î5û\ZÑÀñ?Örô>£VÙ.?Í°¸/2é”¿\')ýO\"½â÷×N O·ÚšeA|#fœÌ~‚\\Ñe²+:‡QúÝ¤é/e½@õŸÌÈ¯P}®:ÿ\0e6$ÑêÉ“±Ñç#E4„R„î~*F\"cû‰ií¨C)é1kDÄèšvHÝÿÑô\nÝ!¥b€ÞYiPrˆ»¶A0tªd™ ©¦Ôsë­–”ÌJ¿Íµ´·áËÿ\0è¬o«ŽÇ{,®ë\Z[ô›ºZ“µkýaË¬ýeéØ¯ÔSU–€xÞíÿ\0ELeÒk{É;ŽÓ@tá*]õ_^µÖš–´+gÒ$®w¬ôþ°ìk¶¶ê€ÜæÄF¿£]ÚÛÚàö“Û•g,×v;›¤9¤}áÎ¬ø²Ë4<\'rÁUŒšÍw>¿ÜqqA#ò«\rÆª?EÀøQ¶ê öja¿ÿÒõTÀ”Rá\n¥÷‰B)PÜ2˜P…²œX%S%œúÓ|}iªÓÅA³àÝÿ\0}W¨¾ÖßöFÖ˜÷:#]‹/ë}dõw˜†¾±¯žÛÿ\0«Ygô\\â=jœjy:ÎÏ¢ïóTÔØ2\néjµîÈ¡Î/Ç5;\\J>oÚ+³h-Ú`ƒ¢±f$¸›5\'”ÞÊXvÀì£5«?Õâ:µ{3íótýê›š´z©f=Ã¹Tž5ù«1:&„Çª^eÝT\\ßyóÑª‹‡½Zÿ\0ÿÓïGP%šYùÇR«2Ñ°Â†é<¡ H¢€@:7Ùd÷SÞGuR‚µîÕ Ÿ‚Œâ½Âóÿ\0YqÅ¹u–a°cÄZßâ¸ž‘×2ºCì©­õ1ì2úÉ‚4ÞÂ½7ª`Øqê¹Í2Ò\Z|@Ü¼›\"²-tø•!Fq=>IH^²¬Uæ5Þ‹æòÓÚU\\«r.çAÝet†fíìöÂès*-¡Îo$iñMœDe£.9™ÂÏàò¶7u®>«¹ºüÖ¡²›{¡RpÕL^CñÕj¢áîE„ÛdÂ+ÿÔ×«5¥¼©·(ÊÆÅe–€yÑ^ÅÂ¾Ë\Z\0!®vÝç‰H•¢%èzm.¾lyÛK>“ýHVîê›iÆ“¦ã	²qèf;DWS}Ç€OúKŒêÝuÕåšê:Cìï¯æV2™&ƒ<1/]›Õ±ìÇu6<n#pà/%ËlÝg›ŠÖ9¯Þ\\÷Xñ$ÏóYý•—f¶8ü€<Džµø.pˆ…ºk]ööþiåu®øæy=Òën€t®•¬ÛT¿@nMK&Qópº…BºC\0Ð,W6JØê·z––·†¬ïH§C@Ç“R¬$£Ñˆëlk\Z	.Fm¤-lc@nÑ¾û´c|¼OòQ‘­‘õ/ÿÙ8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\05\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0ÿá\r§http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:DocumentID=\"47E830FBC91C5BA70327C40763970AA1\" xmpMM:InstanceID=\"xmp.iid:F0C2BE9657E2E311A086D2C5024B2C0E\" xmpMM:OriginalDocumentID=\"47E830FBC91C5BA70327C40763970AA1\" dc:format=\"image/jpeg\" photoshop:ColorMode=\"3\" xmp:CreateDate=\"2014-05-06T07:53:38+02:00\" xmp:ModifyDate=\"2014-05-23T10:54:40+02:00\" xmp:MetadataDate=\"2014-05-23T10:54:40+02:00\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:EFC2BE9657E2E311A086D2C5024B2C0E\" stEvt:when=\"2014-05-23T10:54:27+02:00\" stEvt:softwareAgent=\"Adobe Photoshop CS5 Windows\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:F0C2BE9657E2E311A086D2C5024B2C0E\" stEvt:when=\"2014-05-23T10:54:40+02:00\" stEvt:softwareAgent=\"Adobe Photoshop CS5 Windows\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿî\0Adobe\0d@\0\0\0ÿÛ\0„\0ÿÀ\0\0`\0`\0ÿÝ\0\0ÿÄ¢\0\0\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0\0\0\0	\0\n\0	u!\"\01A2#	QBa$3Rqb‘%C¡±ð&4r\nÁÑ5\'áS6‚ñ’¢DTsEF7Gc(UVW\Z²ÂÒâòdƒt“„e£³ÃÓã)8fóu*9:HIJXYZghijvwxyz…†‡ˆ‰Š”•–—˜™š¤¥¦§¨©ª´µ¶·¸¹ºÄÅÆÇÈÉÊÔÕÖ×ØÙÚäåæçèéêôõö÷øùú\0m!1\0\"AQ2aqB#‘R¡b3	±$ÁÑCrðá‚4%’ScDñ¢²&5T6Ed\'\nsƒ“FtÂÒâòUeuV7„…£³ÃÓãó)\Z”¤´ÄÔäô•¥µÅÕåõ(GWf8v†–¦¶ÆÖæögw‡—§·Ç×ç÷HXhxˆ˜¨¸ÈØèø9IYiy‰™©¹ÉÙéù*:JZjzŠšªºÊÚêúÿÚ\0\0\0?\0ßãßº÷^÷î½×½û¯uï~ëÝ{ßº÷\\Kõÿ\0‡\'ŽO¿uîŠßÊO™Ÿ¾ìuß\"{G°1u^TÂã*e5{ŸsTÄ¤µ&ÜÛ´¾\\žRUú3¬bÉ\ZÝn=´Î”ý3žœ†9\\ÑéþAÖ»ý‹ÿ\0\n‰ë©÷Kb:ã¶y` Z“.g~gâÛY<‹©)J¸œ\rU\"1U\"ýg¨Œ\"Çð=µ½rÁ¢í¥z3[M¾4Õ4ìXÿ\0\r)ùÖ§¤§pÿ\0Â§vNÁÙ8Û]E½;+%‰š]Ñ‡]áöÛclVÈ¥‰+~Îióé	?º#ñ©íb[Ü°mC¤£÷`jÖn?/óu§¿x|ÉÛ]Ó¼ó»Ó=Ôxí±–Ïç²y™ó[#/$M\r&b¹êåÆ¦\Z¶4¤ª†‘åe‹Ö¥T…ü{	ÉÊóCV^?ì×¡só^É}oDÛ\Z3R—Ÿòè²e\')Lù=­U-n&«\'Rñš³þ]ˆ¬n(«éŠ¬”µn•&èÇ…conAð83\n é©Í¤A%´•ãQéZtä ‚¾¡f†\nˆr0Äa&BV¬òÿ\0”y&^‚­ïr}¦ÖÚsr¤ÓVëã/ÀuÿÐßãßº÷^÷î½×½û¯uï~ëÝtO¿uî‰ÇÍÿ\0—»7á—Hç;Cr˜jós¬ØÍ·_SÞâ4í$oS,“Œ^5m-K¡Õ§J/­×ÞªOž¯	fÑ#ø¸ÿ\0/özùœ|äùqÜ?0»Ãpv7hîjÌö%Rq8¨na¢ÀâÌ´x\\5r=\"Žš#é§ƒÓ¨–‘žF-íjÁ\nš…îëk+È§´ztP·>à“\rOW…Â„Ššš8¢Q#‰çš$PòÍ2º» Mô‚>žÔ€@é;5jü˜ø¾€¼µeLñ­\\yuK)Žá’à [–\n’@æÞêYÿ\0u¤-*$\'ý9ÿ\07Hlˆš¢p5éš;€ª…Œväý%$ßÛ>3ŠêjŽ”4ÒH‚7ÓAN¡bssáòQÕÓ3ø*ÂE]JÅŒu4ü ™OÒE*|oú£p¥O×Ú¸Òh&ZÑˆãOõW¥–²ˆ)§žxô\'ÏYG&Þ’\Zfic§©Hê’•¶§5»MŸÜçëì%» hËgìÿ\0?BAq ð“Iõÿ\0c¯ÿÑßãßº÷^÷î½×½û¯uï~ëÝc“ð/¦÷ÿ\0¯Ç^G½>´F®Êäõ£óçùCœío’•Û9*Œ¤Û\\\r³ˆÂPHóÑà© `kë‚¤ÒSÉÍVie)¦šD\Zœðœ]*14ÇFñÚ˜Þ‚—\'×ý\\:©î½ø!&SG¹wJÖÓÕu1ò¬0ÎˆHiM`Z×\'ØIù¯]Â õêF³äm6rHGpäê®{Ëe×ìNÁÜ[nº!’ž¦{B¾HË$ŠõE*#ñÏ±Ý½ßÔ[Äã&ŸêáÔ[¹Y+¹bò¯@@ÏâìÐóôôÝ”Øóëßì=ùå¡ùô_Ã¤ÅM:x¤…¸h‹ñTvý?ÔžGøišJâµéð*~}%ª¢ÈT]µ7˜Oê –[þ¢ÿ\0_ÛZ‹\ZÓ„5W‡K‚ñå¥­ œ%Zø\'“T2·ŠhL òØ½Ðûï,Ýí\nÓG_ÿÒßz\\þy+étþ\nÊö\Z²ÖÜ6ôÈ”VŸ>”ý,äWAêÝ¸PÖZ„q{]lmôþ‡Û_¾m	¯I…	^=L]Å‡e+aàÌAë‹{X/a¥Kš6òy½ýäÂ—ýü\Zõ-o÷•·>ô/­ø—­˜eºzþE÷žÛé˜ì^ÐÈU@Ë³¶¦c/\n­SOJí¦<h—Êãëã½¥ºÜí¢\nrÍ1š×Ï‡—OY[´—q!>\Z‚Y¼‚ŒŸÚ:Ñ—ãFÎÌv¯fnŸ•=›´Fvƒ´·.{#‹ÊM“„×àñ³×T6+ï0rFú!­Vì­©KOa.e¼)nö©xÿ\0£Ü(Iü¾}JÜ¡µÉÍy}eŽìÓÄRøC†51ðõi¬FÊ§ÁHõ0SPÒÉD¬ŽçÅMNl×Ò§ÓþÃØ=®KÄ!o©.;¸®šy\'ñ#§—ZÙ3¾­ÂRe6÷fm™’ºŽy[•©†š²(\Z)ÏŠ¨3ÍQ±õ\'êÔ\0ú{òë¯‹•ÓÔIîÛóGq:Xj©ÆxuNUb‘Ðú¸bêY›…üXûÿ\0ÕÔZ«¦=5áÒ&½‚Vý\'YƒÈú›ßóõaõöÄŸêÇ¤½Jê\n§û7ëJH-Íý§ ÐŸ.¶ŸR6l­Oº1pùþÜd>ãÒ–#gS$$¿\'‰#áí6àší@¦ÙèËk¤w]ÿÓÜ‘S¯­ŠMËú~Mÿ\0ØsïÒòëV~Êu,I\r¡Zó¯K|eJIÀo­Èü@·ãÙ´w-š‡Ï¢[¸RŠgÏòéOM#ßH7 &ÇëõãìÂ]Ùü Êùûz`Y5ÓOË©³Â$Uá¯ÅìnXÜÿ\0²Éw©…F¿çÒÄÛá_ˆþßø¾©·ùÔnLåÅ­·Ó{Rb»¿ä§jm®¥Ä¢Ë¢cŽ©”dwÈIÔ±Çˆ‰ÒR£ôHA<û0Ø/.g¿Ä4(ŒMEsA§ì©óéÉ¬„ÖÆÖß²Y%‰OŸc1üº©¸þ\\•i›ÛÛov\'aâ*±«ç1)¸ë*¶îj6]3âæÂU	(Æ:Dô UD kûOºµäû|rZ .ì$4à¢´<>CÒì6H6yæ¼²½O\n‰d`@¨\nM~Þ\rÍAS[\rÜÂˆŸ#ODqðÔVE÷05DPJ±ÍU\0¼oRÐGÒþÀîðÜoÉréJý¿åè{sYìpŠ|R<ýz¦O™ó\'Ö›º-ÛØ8=ÿ\0³èñRæ2ûo#´†*\\Tø™&­’m£YMIÒEF‘ Š9ZRÖbÄÞÀymmý½¶¢¹jñü¿Ùê2Þ6Îón½½šïÄÒ…‚¦šq©­}iÖ¹¹$õŽ}%8úÞöúrnÃØ×\\ZÃ¨<:†V9ci—‚þcìô„ÊÁ!©§–àŸ4¨ÃúêEaÇà)öÒTN½ZŽ4µ6™T0OL’_›ßÓ«‘n/îŸ„^¬§I\rN˜µJš±B‰1ùZJ…m$Ü‰=cI*Âüººk‹Ã\'¥Ð9Y<Z~]ÿÔÞ&“¬ §¡ñÇQ¦Êª£W×‚>ƒiŽÅËŠãU8Ó¤_[½Êë\'Š@­xô×mÙq3±U1€ÅtÜsôúÆýÆœ×°!‘b6ÕÃåOóô5Ù÷;›‚ñ]d¨üøÿ\0ƒ§ll_]ˆ·þ¿qôÎñÅBp:€Ädô¡¸\n<+GÔYIãüA{.y°ôé–Áê€˜_kíêæKð×ªså& Ø=eÚ]‰IOS\'ùß›ŽÐàÙ¢`ÑÉYM‡¡•£¿ ¸#ØÃd˜[m;ÕÏâC	ü»Éì¶â}ÿ\0k‰éÈ³\ZT\nó©oJ({[iUmíÉšªÈWœœòTPcUi&Lm&:ˆé®ÈÇ8MM\\ó-Ô*©a~mQ½©µ¾½âZ/Èâ¿gRmÏ-¹Ýöû~ñæ+ðôXÆýÂÐç¨3xü­sW‘ŒÃ)uÈF	ƒ+¢(¿\"ß×óì#m¸D›‚Ü>½çÙ¦k·®(z{j}»¾º÷5màÌíÊúI	ÐÌÆ¯,$£\0RÖ\"Ã›û>Þ7˜bKk¤¨`àtCeËò¹µ‘j®)öƒŽ¾}¨ÛÛ¿sméùp;“/Ók;-&BtRWð,Gø{›ìä·šßhÖ²Æ	ë·kiá¿ÞãQˆ®cìÏÙÐwYNYãºÜ-dW7\0€êÊ@çóÀöæ¯—EêµÉëÑ+†Qxê6ý>¯\"ú¹áo{&½;AÒw)‰zÁ\nt)aÁ[8\'ëËý8÷®=X1^:ÿÕßÜž=û­qè,ßÑ	QÐ*±ew7·úÿ\0ìMý†yÐWbj>–í\n«{ƒÇ¤¤^4R\r€*/ÏæÂæß_pµÊ®›jž¤QåÔIf\"ÇßÉ AoêÌ‹_dsº­Â­ÐÏùzPŠtGÇùzÓŸù¤ïy)ÿ\0š6ÂÝ3j=—C·|í<Ž)hè+j·5rÈÑèÅ‡¥i²¹ö(å‰6K¸ø´ºÀüÅ:?Û­äúÞ_ºP@‚ûhNz4û#{î¼Vù§(v^\'=GÃæ²ûssg·6YYŒ‰rlEæB¯“ÈPIçÙ¬ñ«Ï>ÖìjæËq†Uü%GÛZÿ\0“¡ÆåW7Ýî±‡AötoŠÞÀØ5¹ZœÇPÒS½\"ESP6îçÛ•ÒÑCY,)LŸlÕBhÖiªUIú{ÝÁâ]\n/üýzØÉc:‹ršGLÿ\0ŸGHn¼îdì½¿»ßC•ÄÅ‡ªª¡¨ƒ#O% 5\n1ž‰Ø˜êéÈ’ÌÑÝUöUºZM‚ÒÜ	*qOÃÃŸK,nÝÞö9\0ˆÓçŽµpù]·#½·ò*i5YÕÉ1ÒEžº¦‘€úÙžCî|å«•~Z‰<è?À:Äž{€¯8Ü³þ8:.õøà!7\Zå¥BI¼Ï³¦Ž=hß>»lr½C¨Uç^-`t¡7çé¦ßì}´%¹ÉéJ-Z!æØé;“ 3:5ÊÏL#¸½îÑ ÿ\0®=ÛÇ{Iú‘³¯ÿÖßšl,q4žU!TžôöúÛNÒðñÒ	·dŒ•Ñ~ß{Ú™g2)aÍ¯p.xö\rçÆXöÔµ/Üu*tmËH×-(zƒOË¤t;¤M\Z”t\nÊ\rÉN}Á2Ü¼(˜OŸR·!…[¬îš¦y„•K8#JØ†ÔOú‘kÿ\0­ìŽáeiCÔ€*>Üóô±ƒø~F5¯Ûš~}i¯üÝ¶ä•?-³Õ2SÉGÜ={„	P‚]\"¶}«Ùp´1ž=PTS£›5†®}œò®æ¾Š•ÌrÌH¯„‡óèuia<»MñX¼7H•øü@ŠÓ8Ò½\Zßå­¿3ÿ\0!¾íñ_[Œ‹~l½ÏëÍYSMGY6V§gÒÒG„Ê4SOM_Sƒª]Ð«>“rTŸrÕ¤V6’H¬¢²põZéþ|~]9c™óê­/¢iÌmá?‹5ôáÓÖáêt›%_W¸kg«e’rB,%ã}Q ˆÆÇöBØ)çÜ[¹ÝÞ™<Id\Z~CüµêvMÖÆé4[YÅ§’þ\0:\n÷®S\r²°•QÐÅKM¢©tÆ©\Z\nu´“\0£è%Ü{(%§:33‘’xt‘ÈžwZ\r$_Š¼g\Zu­/ÊJ˜7?pnŒ¥6—5ÐÆ¸]4Ô´ÑZà’A÷9rÞ«}ž(^§¬bçb—ÜÒä\Zúi]?äè´åiÌ¡T›U@¿‹Ü}ÓëìûÅ&µ\0æ§\nyõ×ÙÞ¥¸+¦MjE‰‹[ýr[Ûe˜µkÓ|q×¦\\•(l¾°\râ\n‹Äÿ\0O~©ÏqêÂŸR´½ÿ×Ûr>ÿ\0©ªÄ±Š\Zñ€Ò3¯ð?­½´ÜÌåôÏDk±ãìiÐ/”ßõYJ¶’ª¥DLÁ’2ì[ò> zoî=ßmî·7•¤c§ËóèiµvÕ‡G9üº|Ân39Ñ÷¤HÍbA?â\0ú½ûZ	vôèôïàL¿àéDs–0PK7¤ƒõ?BÖÿ\0_ÙtÜ¾²E·°ÚHßàëËÌ¡I+šüº¥_æQ°©·Wnl™¨©d’ Qí¹éæˆUO—Äö–k›J²ÓÑÕd`r/Éü‘î,$ÚùŠêÎ´Tyÿ\0™]d.Ó<—{\0|sü¿âúÕóâ/Î>ÔøYšÝ›GŠ‡vu~ëËÁ–Ü›*ª­ñõTyêJs@Û‡ndlÑSWËGéžTÅPª9VçÞHÝmÇvÚã\nsàÇÿ\0cöÑÍ{\'oÛª6Ö²GõDgÌsû:·­‰üÄ0]áŒÊÿ\0sp9–Êc#§—%‹ÊSÇMSBµjV)mÞ:ºc\"‘ª2@\"Þâ\ró–÷;Rqþ¯—YË\\éËœÉ6Ø´qåóóó=\0Ý¡¹·æõ³Bô4º‹Ìné#súQ€Œ)çÚkâ‰Ðˆž–nRÍ8’>¡©þ¯Ëª™Ïcß+º³wiR™ò3Ë)õa–@Çúsâ÷-Å?…·¥1Ãþ/¬s–3y¹Þ^¾Ldç zºˆ½BpõLÄZÞ¤P Þãé¬ý=›tž,×çÔ$¥-Q ¨Ìÿ\0[MCê²=ûóëQ§|b¸Ïùúd¯„f\0Ý¦WäzX;qn	àû÷VÓ[œq=ÿÐØ¹¡\\TÂ–K±ˆF*9e#ê}´»b¥<º\'ŸpÕP8tlšG\"¡Ô±æì¥Aà›û³Ù(+ZtØ»:)ŸÛÐ§±§´‹!vRHÖÜ€.úßÚ{‹`<ÇZŽõÃž=	mËå£’L}=Ulwñÿ\0’E,’&«Ú2‘©Ž> ?\'Ú	 ³Ž;á9Fÿ\0W—FIçq5Æ”OÚ?è.o”#Ÿ­Ø]½2š¿ºÃ×Ñb2( Xê©iNé¡«¤NúV(åŠ®MM¨é±ÜûÆOs6½ÂÃ#ß â·\nÈO•H\0yõ“þÓîÐ]l·›FèT\\$D¥3QB™ó§§_=ÃÁKêÌÉ\"•A•®ŒõÝÊ!\'êÆñÛÕù÷?íkôvKâ\Z¿‡ÿ\0ŒÔ\rÌÌfßi9[ü\'£Eð;+#º¿…HúisøZŠ\'@\r5<©4,.\rÈäÛêoì››¢3Ø»R´	½°ŸéwUVàNz¸ÎäÚÒãöN_#CoU6*h(Y\0ÔÕuQ˜ `–m@ÖüZçÜE·\"®ãlÄü,zÉÉÙ!»px¥?‘SÇ÷#ø.ËÞy¹…ä«©<t²X™™MTÉsêôÃ¨‘Ç«ëîK[¿\Zé3Ô%Øm6MÛP¡‘Éè«ÖÀ‹<v@U$”D\\6£õþ‚ÀûÆÄŸQüñ“\\g¦˜éÂ±qÃim\'ƒfw67à\\z\'8à:gÃíùõãµ^%_¡#éË\0±Ãê}×ìëÑ3©4á×ÿÑ±¯ÝtscY~ù5”PÞ¥<hàý}®y”ƒCÐ4–s§I½?Qv­=DÑˆêQ®à_P³›ý¹$e4®êªµçÒÔ‰4d¡ô§Vñ³fWvÖn,½Jáv&«fó•\Z–9_üèÆP¹¯VìÚ5å¾ {µÌË\n÷½1þ¯Ï£M²Á®›O¦FyüþW…ØýeGŽÛ©S4tQæòÔU?áˆz²Š‰€Y«d§ŸÉ(ZhP^G-e÷n|Çß{A¥}jRÍ—(XXXK¸^FÒñ %tŸ,äž#ˆ=×ò»¯7_å¶^æÜÔm—›æÇãåš\'­ª¤ÃÔ#y)XDÌÓdWrª’È@ÒœÅžàÞßîV–{|5.·(åøÒ‡†ŸŸ­zû°ÚÚnPî\0•\rššöši ÿ\0±×Ï#¶(³ynÉ\"`Þ|ÖJHÝTª˜äª”#Æ XÝù[pseŽ ¶+qVª7ú])¦Ÿ>òôê1æXâmÏxkq¤¤ìE<óÖ_ŽÉÙ8üµš3‹¬Šhæ†êRT`J3}4É>žÐo“!²x©Ÿ_ö:s’íå]Î+PµáþÏ[\rdâ“=×õk>Qü$ý³µšÍQ†ž0xscýŸq+Grò€{N>uë%–êÌFpÎÎ”ê´ûÿ\0mEµöu&&\"HiayP\n¤•»I;S£\0dg-¤8Qì[ËîÓ]	qåÐ\'™Q\"²[`4­2}z­\nÜp’f[*…UÖAåµ»³“Ç×A·ûcø™ºˆfD&¾%:ÃCˆšª]qÆYŒ‰Ç5\Z˜YE…½ÝÁªŠäôMQÊæAåëÿ\0Ð³±zž»uî,VOUW]••bU†\'œù[–ÐŠ.6þƒúûEst–¿Ú6?gFÛvÚ÷Nc¢&Ÿú¿.¿ÿÒÏÕx]Åº*q”TõŸº¨†™Ë£ÉõãOïØÐÊ•\'‡E6ÖK?Ž‡YtÖûÜÛƒOIM]KˆÊç©¶ô;†®h)pñf\'©Hc¦3TIUÊît…YÅÁ [’Ù®^#ú|Oú‡Fpí±« Áë`=ý7®¶6­qô2Òm­‹·âŸ%=¤¤£ÈUÁL¾­çý´ªl†L~äÒY,ÜwÍ­úv¤„Kü¡³XÐWý_êûzÖwåoÎŒžÝíl–ÚÚéUY†Èc·Vì’ I–Ž,’ÂãomLr°Ì”È±ËW%’5&8Õ}NÄ›6Ø³)ºÕ©Ðƒ˜ï`·»~šAOÔÿ\0MåþN«Â^åÍ¾r£!ÌWe7Væ¥©«©¨Ÿ\'%@ÇÐÁO\\0Û^“IÓžV–£EÕN@¾žuÚO#Õ5\Zƒû:KìvÈ˜Tø´ ¥#·¢#¸•êsÙ™u\nÕHGªX!\r0@¤å½Œ­ÜL±2ÿ\0¡Š£»àc–âysâµz1?°Ti(é`å$©šYle•ÚÑÂ„€O:¯ý=„9‚S”¯‡œ›k”`œ:»|~!¨6²ÍšÁGEI\n2*j3£B°Ä©ær¶·’°R¯ˆØâz•Éð”8øWªŠùQ»sîŒŽ;&jLjEy²	*.Í9€‘F·-o¯ÓØËg¶(`:ŽyŸrgÁN#Ï¢f›RYCDäËrÍnHrªŠ?àÖñ¿±w£¨öâØƒÇ	Íˆð¢Bð!’Qí­Ïªà,:nK°¿*?×ú{µÕÖˆ¼AøzY¶íÿ\0¨\'op>¬¤zê«aRâäÆã“?Ù}Ðíœ*Ÿ´Qè–¢¾º¤-&ƒUC­šgØ>åäÞdh£cAÐº&‡f‰âe¬“dçùuÿÙ','Safaa');
/*!40000 ALTER TABLE `COLLABORATEUR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COLLABORATEUR_ACTIVITE`
--

DROP TABLE IF EXISTS `COLLABORATEUR_ACTIVITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COLLABORATEUR_ACTIVITE` (
  `ID_COLLABORATEUR` int(11) NOT NULL,
  `ID_ACTIVITE` int(11) NOT NULL,
  KEY `FK33F1FB5BDA599155` (`ID_COLLABORATEUR`),
  KEY `FK33F1FB5B8E0F723F` (`ID_ACTIVITE`),
  CONSTRAINT `FK33F1FB5B8E0F723F` FOREIGN KEY (`ID_ACTIVITE`) REFERENCES `ACTIVITE` (`ID_ACTIVITE`),
  CONSTRAINT `FK33F1FB5BDA599155` FOREIGN KEY (`ID_COLLABORATEUR`) REFERENCES `COLLABORATEUR` (`ID_COLLABORATEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLLABORATEUR_ACTIVITE`
--

LOCK TABLES `COLLABORATEUR_ACTIVITE` WRITE;
/*!40000 ALTER TABLE `COLLABORATEUR_ACTIVITE` DISABLE KEYS */;
/*!40000 ALTER TABLE `COLLABORATEUR_ACTIVITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSANTE`
--

DROP TABLE IF EXISTS `COMPOSANTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPOSANTE` (
  `ID_COMPOSANTE` int(11) NOT NULL AUTO_INCREMENT,
  `INTITULE` varchar(255) DEFAULT NULL,
  `ID_PROJET` int(11) DEFAULT NULL,
  `ID_THEMATIQUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_COMPOSANTE`),
  KEY `FK28313117282A421` (`ID_PROJET`),
  KEY `FK283131189DE8917` (`ID_THEMATIQUE`),
  CONSTRAINT `FK28313117282A421` FOREIGN KEY (`ID_PROJET`) REFERENCES `PROJET` (`ID_PROJET`),
  CONSTRAINT `FK283131189DE8917` FOREIGN KEY (`ID_THEMATIQUE`) REFERENCES `THEMATIQUE` (`ID_THEMATIQUE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSANTE`
--

LOCK TABLES `COMPOSANTE` WRITE;
/*!40000 ALTER TABLE `COMPOSANTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMPOSANTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTENAIRE`
--

DROP TABLE IF EXISTS `PARTENAIRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARTENAIRE` (
  `ID_PARTENAIRE` int(11) NOT NULL AUTO_INCREMENT,
  `ADRESSE` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `NUMERO_TELEPHONE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_PARTENAIRE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTENAIRE`
--

LOCK TABLES `PARTENAIRE` WRITE;
/*!40000 ALTER TABLE `PARTENAIRE` DISABLE KEYS */;
INSERT INTO `PARTENAIRE` VALUES (1,'al afaq marrakech','fondation.ocp@gmail.com','Fondation OCP','0566858172','Fondation'),(2,'Geliz Imm3 APP34 Marrakech','fondation.mohamedv@gmail.com','Fondation Mohamed V','0566258493','Fondation'),(3,'48, Rue de la SabliÃ¨re, Libourne','agrisud.international@gmail.com','Agrisud International','+330557251706','Association');
/*!40000 ALTER TABLE `PARTENAIRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTENAIRE_PROJET`
--

DROP TABLE IF EXISTS `PARTENAIRE_PROJET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARTENAIRE_PROJET` (
  `ID_PARTENAIRE` int(11) NOT NULL,
  `ID_PROJET` int(11) NOT NULL,
  KEY `FK24D993D47282A421` (`ID_PROJET`),
  KEY `FK24D993D44A40E277` (`ID_PARTENAIRE`),
  CONSTRAINT `FK24D993D44A40E277` FOREIGN KEY (`ID_PARTENAIRE`) REFERENCES `PARTENAIRE` (`ID_PARTENAIRE`),
  CONSTRAINT `FK24D993D47282A421` FOREIGN KEY (`ID_PROJET`) REFERENCES `PROJET` (`ID_PROJET`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTENAIRE_PROJET`
--

LOCK TABLES `PARTENAIRE_PROJET` WRITE;
/*!40000 ALTER TABLE `PARTENAIRE_PROJET` DISABLE KEYS */;
INSERT INTO `PARTENAIRE_PROJET` VALUES (3,1);
/*!40000 ALTER TABLE `PARTENAIRE_PROJET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PORTEUR_PROJET`
--

DROP TABLE IF EXISTS `PORTEUR_PROJET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PORTEUR_PROJET` (
  `ID_PORTEUR` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `NUMERO_TELEPHONE` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_PORTEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PORTEUR_PROJET`
--

LOCK TABLES `PORTEUR_PROJET` WRITE;
/*!40000 ALTER TABLE `PORTEUR_PROJET` DISABLE KEYS */;
/*!40000 ALTER TABLE `PORTEUR_PROJET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJET`
--

DROP TABLE IF EXISTS `PROJET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROJET` (
  `ID_PROJET` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_DEBUT` date DEFAULT NULL,
  `DATE_FIN` date DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `INTITULE` varchar(255) DEFAULT NULL,
  `ID_ADMINISTRATEUR` int(11) DEFAULT NULL,
  `ID_PROPOSITION` int(11) DEFAULT NULL,
  `ID_RESPONSABLE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_PROJET`),
  KEY `FK8D2C40CCEAF0C0C3` (`ID_PROPOSITION`),
  KEY `FK8D2C40CC31F655B9` (`ID_ADMINISTRATEUR`),
  KEY `FK8D2C40CC1296B13` (`ID_RESPONSABLE`),
  CONSTRAINT `FK8D2C40CC1296B13` FOREIGN KEY (`ID_RESPONSABLE`) REFERENCES `COLLABORATEUR` (`ID_COLLABORATEUR`),
  CONSTRAINT `FK8D2C40CC31F655B9` FOREIGN KEY (`ID_ADMINISTRATEUR`) REFERENCES `COLLABORATEUR` (`ID_COLLABORATEUR`),
  CONSTRAINT `FK8D2C40CCEAF0C0C3` FOREIGN KEY (`ID_PROPOSITION`) REFERENCES `PROPOSITION` (`ID_PROPOSITION`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJET`
--

LOCK TABLES `PROJET` WRITE;
/*!40000 ALTER TABLE `PROJET` DISABLE KEYS */;
INSERT INTO `PROJET` VALUES (1,'2017-03-03','2017-08-15','Professionnalisation de trÃ¨s petites exploitations agricoles familiales et valoriser les productions fruitiÃ¨res. Sensibiliser des producteurs agricoles Ã  lâ€™environnement en promouvant des pratiques agroÃ©cologiques','CrÃ©ation de TPE agricoles au Maroc',1,NULL,2);
/*!40000 ALTER TABLE `PROJET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROPOSITION`
--

DROP TABLE IF EXISTS `PROPOSITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROPOSITION` (
  `ID_PROPOSITION` int(11) NOT NULL AUTO_INCREMENT,
  `ANNEXE` varchar(255) DEFAULT NULL,
  `BUDGET_PREVISIONNEL` varchar(255) DEFAULT NULL,
  `DATE_PREVISION` date DEFAULT NULL,
  `DUREE_ACTION` varchar(255) DEFAULT NULL,
  `ETAT` varchar(255) DEFAULT NULL,
  `OBJECTIF` varchar(255) DEFAULT NULL,
  `POPULATION_CIBLE` varchar(255) DEFAULT NULL,
  `TYPE_ACTION` varchar(255) DEFAULT NULL,
  `TYPE_SOUTIEN` varchar(255) DEFAULT NULL,
  `ZONE_GEOGRAPHIQUE` varchar(255) DEFAULT NULL,
  `ID_PORTEUR_PROJET` int(11) DEFAULT NULL,
  `ID_THEMATIQUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_PROPOSITION`),
  KEY `FKE354E2B689DE8917` (`ID_THEMATIQUE`),
  KEY `FKE354E2B670382C16` (`ID_PORTEUR_PROJET`),
  CONSTRAINT `FKE354E2B670382C16` FOREIGN KEY (`ID_PORTEUR_PROJET`) REFERENCES `PORTEUR_PROJET` (`ID_PORTEUR`),
  CONSTRAINT `FKE354E2B689DE8917` FOREIGN KEY (`ID_THEMATIQUE`) REFERENCES `THEMATIQUE` (`ID_THEMATIQUE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROPOSITION`
--

LOCK TABLES `PROPOSITION` WRITE;
/*!40000 ALTER TABLE `PROPOSITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROPOSITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUBLICATION`
--

DROP TABLE IF EXISTS `PUBLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PUBLICATION` (
  `ID_PUBLICATION` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PHOTO` longblob,
  `TITRE` varchar(255) DEFAULT NULL,
  `VISIBLE` tinyint(1) DEFAULT NULL,
  `ID_PROJET` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_PUBLICATION`),
  KEY `FK400F360C7282A421` (`ID_PROJET`),
  CONSTRAINT `FK400F360C7282A421` FOREIGN KEY (`ID_PROJET`) REFERENCES `PROJET` (`ID_PROJET`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUBLICATION`
--

LOCK TABLES `PUBLICATION` WRITE;
/*!40000 ALTER TABLE `PUBLICATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PUBLICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RAPPORT`
--

DROP TABLE IF EXISTS `RAPPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RAPPORT` (
  `ID_RAPPORT` int(11) NOT NULL AUTO_INCREMENT,
  `FICHIER_RAPPORT` varchar(255) DEFAULT NULL,
  `INTITULE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ID_PROJET` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_RAPPORT`),
  KEY `FK6536E4027282A421` (`ID_PROJET`),
  CONSTRAINT `FK6536E4027282A421` FOREIGN KEY (`ID_PROJET`) REFERENCES `PROJET` (`ID_PROJET`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RAPPORT`
--

LOCK TABLES `RAPPORT` WRITE;
/*!40000 ALTER TABLE `RAPPORT` DISABLE KEYS */;
/*!40000 ALTER TABLE `RAPPORT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RENDEZ_VOUS`
--

DROP TABLE IF EXISTS `RENDEZ_VOUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RENDEZ_VOUS` (
  `ID_RENDEZVOUS` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_RENDEZVOUS` date DEFAULT NULL,
  `SUJET` varchar(255) DEFAULT NULL,
  `ID_ADMINISTRATEUR` int(11) DEFAULT NULL,
  `ID_PORTEUR_PROJET` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_RENDEZVOUS`),
  KEY `FK2EBBA11831F655B9` (`ID_ADMINISTRATEUR`),
  KEY `FK2EBBA11870382C16` (`ID_PORTEUR_PROJET`),
  CONSTRAINT `FK2EBBA11831F655B9` FOREIGN KEY (`ID_ADMINISTRATEUR`) REFERENCES `COLLABORATEUR` (`ID_COLLABORATEUR`),
  CONSTRAINT `FK2EBBA11870382C16` FOREIGN KEY (`ID_PORTEUR_PROJET`) REFERENCES `PORTEUR_PROJET` (`ID_PORTEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RENDEZ_VOUS`
--

LOCK TABLES `RENDEZ_VOUS` WRITE;
/*!40000 ALTER TABLE `RENDEZ_VOUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RENDEZ_VOUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `THEMATIQUE`
--

DROP TABLE IF EXISTS `THEMATIQUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `THEMATIQUE` (
  `ID_THEMATIQUE` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `INTITULE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_THEMATIQUE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `THEMATIQUE`
--

LOCK TABLES `THEMATIQUE` WRITE;
/*!40000 ALTER TABLE `THEMATIQUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `THEMATIQUE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-22  5:31:18
