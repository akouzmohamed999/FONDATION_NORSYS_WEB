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
INSERT INTO `COLLABORATEUR` VALUES ('Administrateur',1,'A1111','Daoudiate imm3 Marrakech','1975-05-12','Messadi@norsys.fr','Marrakech','Messadi','0666297841','admin','����\0JFIF\0\0H\0H\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\07\0\0\0\0\0\0\0!\"1AQaq#2��BR���$3������\0\Z\0\0\0\0\0\0\0\0\0\0\0\0��\0#\0\0\0\0\0\0\0\0\0\0!1A\"Q2q��\0\0\0?\0�-���jk�[3����ݜmNV�gn�mޑ?��\"��h��Mpmxa�����j��/��\"��jã�O�XQ-�cj��� (��F�t�#$����%�t����\r���i��\rDia)IԿ�~)N��#��.r��3��G�/��Z��8���\n��R���:��ܥ��Ց��EQ%.�A��46��sC�ږ���6�R��?\Z��y\nҧOu8��D��7����A\n\ZK �\0z��B՜���P�Az��_U�7���5�g²q�Y�Dk�m��^I���✤[�� ��*�m���$�=#rj���Ws��j�\"8�����\0�˅%�C����L�ԕ~��ތ�e��*ڙm�p����(���*��J��l�ziR�o�v�N�][�P��P�����J�\r֛۵:�m����C�js��\0\r�,�S�?`�ZK7��BFZ�&�9{��.Gn@��>1Pnp�\'�㲥�O �#ڗg�?-}���?���;�ޓ��B���.�srAW�	Z���j�[�Р�Oc[5n��`m��w4Q���z�J��5BiŰ��jZ���)��Yj�Y>��E0/��%$�>��\'\n+ ���V�G�1J+���N�����rY����◞�U��x�:S������:q�Z������de��\0n}i����ٙ��P�NN2��W{Ց�ִK�d&#��O��j�KB�u����Ia ���)$y�O��j�OEÆ�-\'%��J2�ađ��ZzҤWh�02�Ҁv\Z�)B�H\Zd���]/�x���r��9���A��>���\0�9B�F�\\-$�r���aڢ��5�h${���\\SeYh&c��t����S/�y����>����*\'6�IM�&x�ba�h�Z��:Nzp�ͱBqwRp<��/�����I�pB\0o����-�ɳ�%���+Ц��zQ8r�h,Mr���GCP��}�\"��?���� �ħ5��}6\"��+b@���1��E}\'I&�<��\0�Fy89 \n*|6NV�s�kt{h=IJ�W�f\Zf��v4�p�Ft�O�4�v�dE��ޛBoL~�\Z\\؉Ò��\0R�f�Y8ǥ?D����y�t�d�UaL������!-��O�:�/s��[�R�Kh�����.���Z�9�i����7uek\'|�IrmQ`�G%JHyedx�S��∮<���@ܓڪ� ��+S��c��Q��:~h�7^gi={+�W\nR\\m�Fq�S%N2uiQ:��P�m��M��j*Y\0`g�*̑���t��Oi����LՕS����%Y帋�E���V+2ܘ�����%Y���o��Ż��g�[�z����M�H�yqE�r_AJ�{��摛��>>*���ˡ�{/+���D�~��<��-c�v�N!�m,�Q�Ih��i{���S\'�n��0U���SJO��l�|y(<P�r��u+��t�]\"�I\0w�ƸF*eil�y�F\\Z����DD�a�ҝ9�=�E\\};~D�,��qj���h62��K�ޙa�l�5�\0RV��>q�\n|\\&���!*w�\"�!�yAA\'��9��4�9�	������\0GW�\0(��S1Kn7�)�I9\"�Z�.3KS��Q�ڀ]��cz���ѯ	�\"BV�5y�m��\\���������֎��%����y�R�T6T��\'��W��7+k�e^��֠PUtc��s�n��O�;_OB�ǈf�kBup}D�ؚ%��6�dԀ���Ҥ��Ri��I8J�0O�L�v�J�HO1<�~N<S\\�6\Z�UVy��Hg�ʚK�J��@��)���7�L���8�T��9uBˌ��\r\nN*Ǳ!.p$e$Խ�oHsX�E�FT��f��;���U�����*+������\Z��\03�*C�%*:@9��F$q�/�4��!)�AI\0���~�����|��ja�w�,sy�Q����1�xeCo�q��B�ɇ�|�:ҵ\0��4���B{��E�\nh�rY>���Z�%xBO�\Z������֗��Uq�&2Tym�/ں��1cIS.�^�]��t��Զ\'l�rrh���[ҠA�A��^^���qO��K�{�p*d;���O=��d���rf�iӓ�A\'oZG�KJ�)&�&��R��\n�G�P	�%�5(�?�l�̦�!��2	_,����k�e�Z�m��\nҶ�����w���\n[�\nQ(B���k<1r��o)�\ZC��,\rU�����^��bs-^���/q�7ul!Jmą�	�5\'��>U���2�\Z#GIqrϠ�[��g9:�q��RB���bX�v,�HKm�X�?�#*Q={*īK��Xq$�2�1e�d�zT��O������Y��2\nc2�)e���|��<��N��:�1N��Z�:�S�%rz�G�TW�`\0O��_B��W��4m�#\n�ͮ��*�n�\nϽZ�<�֦�p��*�J�\r��qV/	q3�LwO�hn�?��\0+�$[��%ńR���=Ҳ2J�Fk������n)̌+&��S2�!XPמ��os�*i��͝9�;\Z�^��_��\0-��\ZJք�c�@�u��IcFӾ\nԭ�=��]�մ��)ը�$l2(�\'`������Ƶ圭���q+qeJ@$���-ޥ�����umL7i�:��z�\0����!RqD��@s�,s��*�H���T�s�x(�뀭ɮ���@�f�J+�$\Z#�t��\Z��m>�yX��iN<�����]�_�/�p���]�#����J�$P�Gr��V����ut�z����\r��?S�e��JY�js���m�E\n�؊�kS/%C�T>A����S��v���^R]*�{�ȣn���a��8�B��\\{���m(�`�x>Ef��q���R����tb�&�mp-@��z��f3qa6]w%Č��v��ҜHJNv��_ˈS΢��C�jM��/��S�+\rS��xk�nJ<��Kd$s\\���\\I!%h`wίҨƾ�\"|���)��|�V�\0cɯ�q!�����z�+\n;�Н�5#[WT�aQB��W�A�Hյl�t\n�&�QΑDGr��Y;�\\T��[)]�h��o�9�&�sߖ�_��$����T�%C)ZNr+��wS7�*�w���O�w(���a���#���Lq���Z��⠳aCJԾ�Q�q%���|�e(WbU�S�1\rG�����:7	��4��}\rt���ub��e)�6H��H�:��S��GsZ�ky��*Z�IQ�5�=X��\"!\\��Ěƭ�;��4{#*5�5�\Z�UB�I��','Ahmed'),('Responsable',2,'R1111','Saada App 4 Imm 34 Marrakech','1978-04-10','Elkhaily@norsys.fr','Marrakech','Elkhaily','0666148596','responsable1','����\0JFIF\0\0H\0H\0\0��\0C\0��\0C��\0\0�\0�\0��\0\0\0\0\0\0\0\0\0\0\0\0	\n\0��\0C\0\0\0!\01\"	AQ2aq��#$\n%\'���&3BRb��4CEe���\0\0\0\0\0\0\0\0\0\0\0\0\0	��\0F\0	\0\0\0\0!1A\"Qa2q������#%B����$35Rbr���C��4c���\0\0\0?\0�\\u�U�V��T+�J�Sj�3v)3�ҩϩ�լ��ܢr����:�sZ|ֲ+^�{*���T�S��n���S�N�$�v���HV���>\n�y�BW����E��:s�A��<h�v\'P��������EE�F�,$����σ�><g��~P�|��s$�i�6������?�\Z�w��tcR����x�ZO\'9��p~�m�C����������������aW�����:���Z���GO�����=xqu��$y\'�c`�P[�}��(�k��Σ��\'�_��\0���XE���������\"�ߟ��mi�:�[$c8�D�r�\0����͟g��f/�K~�ٌ�D5k]�������%	#Q+C��Q2Nq����Z�!�5[����\nvP��@,=~�OpZԬ�\0�j��F�q��\"���^<E�����2�B��/n���[���յ}��P�)4��~�jx�:<�Ѓ�\0�< EV,�����.��F�֊x����|R>�)��w��I�I�nȤ�6��ߌ��-pڥ+Q�@���A�})��:��:��\"��G�Ui{�Y��ߌC�]q$�\0�Z�1�cP�>8��9��g�;$�2{$�~��d��<���a��b�����\0�5�v.M\'�����xًۥ�*E�̱s���3\\�����`����3���@�\0�=x�x�}b��I���>8��3~l�m�?�o�?\\uf�ի\Z�]�*�*=J�\"<���̶�H�HJ\\S�, <�DmZU��ӂS%��j�چ	�Xerl�#C�0<k,q�5��n\r;�8��D*<~1<��	J��x>>������c�����n�!�7��0rIBR�)k$�������<���q�P�E�ώ3#�T;^��|�1i\'݃�p	�����\'��?>8O�.yl�vǊ��TW�\nJpB��?\\���qq�ǗH7#�`��o\n\nT����F1�����\'T�P[��ٌ�\'�<��9���րn?�y}�pY���CC�z���yb*�7{��h\rU�WR�z��\r��4�څV�����a\r�ѳ�͚Ӥ�)	y����/\0��gS	�XV��&y�H\"\0O~VU6����I�*9�0��M\rNuY!��H�P��\0�XF��k�|\0j_֨���Z��jg���靴�x�ߎdǖ�v���v8+gtQ��m�J�*��b`�L�VE�B�BG�\Z���c{5��6&~��h�F�����Q��Y&�(�J\\�i��7�<H��w��f?I�]f���Dy	�&į\n����c�)A�o(pjRS�((8�wZ#�ϓ�fE�RB�/M�G\Z�в�[��H�\'?=�A�g�J*�E�SM��3i�k#0�o���uV$oa�bU�������r�8>���x�<�����?��Yt�b|���nG���Ki�\'!+�N���|��笒O3|$b\0)Q�R��N�\n� `HH8����q�C\0-���F7��G݄O�B�G�Cf���\\g���f�N�����l~N�\0�8�����b���e�;a[�>RB��/9)8� ��㎼obO�?>�n��sn[��`�ۦQ��p�((���IANW�c���)��~�����_�$?��o?���/q�W�P�O��H�hT��n��h8��\0C�l�>n?r<4�p�E���=�ʲ�N2v``�8݀<g��ACXawN�j�����g��\'�IW���t�o`ya&�nF�鯍�FI��G���\0�Xv��cT������8ָ�T�/��P�]y�!\r6�R�J�(NI�2H�Q���6�;\\�:�s�̋=���{G6&�ȝ�<E����Z���u�CQ����v���5;L�U\\���rք	���j*\\�N�Ѫ�f^n3�>�YWX��=\'Х%rA��L«+��Z��H\'�$MT����z��J��v[�-���le<���qW\reU<��*\rI�6��s\"���c	 #�$�[�$�n�\0\r��J�I�;z�B�V�fEr�z��n]uڹ}3�/kµ-2�W\ZW!�%�2�S���ry��s�&�^#���s)��ܭ��\"�WLQ��D�\r�@�7�\Zh�c��V����zzAd� ����*��ܟYً_��ؘg�}Ah̩Oґ\"X�*#�W�Ԧ�\r�Q�\"\n�qʬx��4�>�Q��kbv$���+(�vF��\0���\Zm{�\0�� |(�[�+�L�#f#�\"H�l..�V�p�Z@�[w�𸛫�&�5M�M�ު�f�H�ʳ�z$�Cӗq�w[/�3Z��6%3�AV��ř��s���J�hb_�Xv�6�vG�f��{�6]��β��\Z)`v���Ir��\0�p�K9Rl]� e������W�ewEfT;��8�e@�\\��T�u�iQ��F�E=o7�	�\Z�!�/�)-9W/%M�����\n���t�gH��@Ga#�w)�({̼����i�oG9�\0�#����`��\0�\Z�PT%��R�\r���;k�{D;��(\Z��7kW5����W�N��]�fW\ZA\\�r���Y~ݯ��Yw)u�%��<�ҳ��\\�$����f����94oɯȍ��CX�b-KW���)!zJ�}\"X�tb��-�é �[�d�(FR��*u*�P��\0�㎅��f�F�q�>�)RNs�\0����u�~��)ocR��(�RI ��eG��\0�[G=�aMA�l@8�m��\n+Z����On�Z����qऐmp�����۲��4P>k�B�s�?��G\'���<tg��������~m��w�s[5##���O�?�R|g�����G��b/���&�p�\Z�\0��� 6>��`�\0�<�z�o��c5��\0�7���F� ��N\0\'��u�R��	���i�[��|�\0�2G�\0h	���~�l���b�\0^�d\\1�`X�\\_lA�e�q�S���?�gZ�=>�M����h�.=^��s�2i:?nUc`Ӯ+�:D�)Z^�NsۅHI8�3xxG%�E�7��V\Z�\n�U�m�`�)����%��-���Y�xg$\neK�5D���ۼ\"�LAƥG�qw�9��O���*��{\Zײm�<&�S�Q)�c)��)p��HG�!�,nQR�U���^�����>�T�I\'}�oXݯ�;���.j�k*�Ri�\n�H��\Z\04�H�Ȫ\0�����7Ūl�q�$�H��~�+av`,�-����1��T:�lm��n_m�e`��Ą�$�H�?o���d&�����1�2rd%�^��+��\0�EM��<��9$g��	����7�tE���ߗ=��|6Ɛ�%P������Z����w^���+�Σ�=p�*=q4�q�ŕOKң)&LU��d�ҿQ���Z\n]!`X�F�[�����l�u�\0-��N%�vc���EE<�P;4����j��lV܈�z�n����9��K\"�~����eH	����T�n6r3�-�/i�|�Ais$���ǚ��ewߣ�.~)�~ϥdFjj�,�HQ�����.�\r�(ܶ\0zN�x%�A���f�c\\j,� *CA 1�u/�Yk�-����)w�tP���K��N�Q*�C�jz�6gӦGui�rX���9�YRHe�)K�YX�T؏���Ye��`GPH�H��~���M)Q��9X!9�<�<����3�i\";�[t�����z�Os�8�z�ͭ�	*ن��}���:��3�8���?���6�A�\r�s���8v�I֭7\0�쒮M\n����:3ÿ�yw���o�f?�}�}�\nu��/[5% �M��J��A�Q��>�z���e���\ZR��#�V���>�\nS�T���8����:	���k�=��\0�O<9�x�:P0�a��[H���4Gq*p�w{p�yR�	^?/Y��\"o����\Z4��w��o���#]�MO��լw\rQ���wwvArd�P�4�ev���$!��ҩ�5��P�HB�@Fb>�B��G�DP�et���+��n�w7�Jz*��8,�1�\0ͩ�y\r��Ԟ�8�Ҹ*r\"<��kzP�l �%8�Fq�yꍧ�����[o`����k��S��}�;��R�q�\'rPBr\n\\* �@��y��bEr˽����ba��@\'{��þr7#ݸ��I�$���W��1���:J�6�A��n\0T�H{��o?o�͉#�k�����G�1��פ�ᐓe\'���������\rZ԰��y\"��U�()Ŵ���+����q�B**5(�@�a��\nSӇx�7/����=,>�r5�A�E�,�����*tv��c�]�F��|�ķ�J��t�Q����v�C	K}�KO�цQ\"���\r��5l��\\��#��aqv]�ӂ� :Õ+r1\0^Ngo�b�{�*e��U��l���H�3,�I��F$%������PܐBI�������=�.�7��PX_���c���R���\Zi�۪J��X��*��N�JS�����bT��⨴a�K��y���ZC�P����F��x���Bn	H\r��y/�6�*Z2�@#�\"˶��P���~��}�!CZt�IBk�����\Z[ϴ�\'�Fq��:/ö��.u���T�d����{�*�εj8N7��ӕd)F�I�AO?lg����!�1��xo�#U���A������\0q�~��O,bgm��k���1�zA���p@ܜ<������[mc�\ry�����sd���-8��JweH\n	 ++#���P]���=ۂ}�U&��ǳY�˟\\BO����t���M%�[pܺ{�ח�(��K�Jb��\0a�R\n���-҃����$ ��S�49�Ӥne1e�r�j�K2����M�5�PT�%�٧Q�Զ��^wBI�4ﶜ]|�d�}8[Q�-a�\ZuAIX\\I���Kke~���\"�\nv����\0�*u��k}�P�;_D29��6�3%sֻ�\"�.�urݙy�qn��k�m8������5]��R�uS㬸�8�i�Ω!hRv��$�U�C\'bєh� �[s\r�>L�:n��c�um�0�T�b+�0����G�U˲��7M�m�T��f���*�ө�ܗ.Ia����\ZZ��R�����u�k4�t�����R,Q��fs��n�\0_m����Y]IٕdK*�PM�&܁<�@k/� ��u��j���Ou߹��D�M8Ӛ�Xќq��*�R�X�\Z)��Q�R�\ZW �6�g�AO��K���uUC�9�e�\'��؞�1�xF�;\'(�I��b$���:u�t���Dql/uV.Uq?���+#\Z�����t��@�\Z丠S+46���5\Z�*ݕ#�L��O̐��丶���6��WN�]X\\^��nv؞��J�/U��2��YU�C�d��]��t�\r�W��\n��\0oZ���U\"���*ͮ�n�#%Q�U�@��z�LJ�o��V�����jV�%\n�x�✒�Rݍ]TJ����n�ekn	�eE^A�PL�Yh�i����D�XI�-�mp�|h>�ڨ�>;Y���]WL!T�f*�XK��uGԶ�uxZ���ޢ�|�ҜO���(.�a����Tn�%��c�b�\n��6Şi��n	2�<���|M�BHHu*)Z�AJ��Jr	��@����N�C*دߌA�<V�^�G$�O��\0!�i,�c�ᭅ�ԕ�|�Jq�J�����ornm��6V\0�H��鲎B��v���\n�7ppG<��ע�;o�2�kZC���z�x��cUܒ����2���[�B�(�T*A-�-��$�}�3��@?Mf$���>~��a��\0���ܲ��8J�ӏn\0���۠�H��1��~Q����Ii!@�G�`�(+�m>3�>�l.F�5r�\'I������pݕ\">HR��T��,���9@�R���h�$���Cہ�j���7�����o�~��{c�*��\"�{��oT��������^߸.*3/H���\'Wm�P�I�;\Z	�\"\Z�~Kq�E:�u+�s���%e^Usf���̈ʒvq¥��Pm��2��k㷽����d�0#CO;�r#�,�/E��\\��wf�خ���.�>W���~��q��f�qUm+{V�7��G���M���1�}FTմ�)ҡ�Lw\n����(%^�Q��%����&oJԔ��\ZO-*�Uj#rvb*܂�\"كfg�i�/v��=��$scDr�i#p�{�6㨷ga��mb_�����4�����Ӌ9R�Z�p�DȔ\n<�t���bVS!L�k.��R�Ҁ��Mi-�w�>C����X��l�;�)��JUK�ȊWx�����%����~%�����T�=]ô9:���nU䙐�<����r�\n����X�$��ޜЕ�;��U\"j*�٨&��2�HRt���P6)��r)Ŋ��3�̻I���\Z��17��$��y�^�}!d��gqg�Ư#wI$�nGtlM�۞9u����ߤD������W�^�Ư��e�tW`Q~R�ۦe����/;)�1�S�	>U/mq�Hj���\Z����$���PG��MMٗU��6\0N�M���t���:f�����6GI�M+������mCH`ebH�H�I?��>(��I�w���~�\\�ӵ��:��n�6�U(ד_�԰�q+�dLg�()u+���p>n)����\'�Im5MGl��x@�8��T��x��;�����`�2�Q�,�e˖\Z���1iI����d�&�H�>��&�v��-xJ�)\Z���-�P�S�\Z��Si.����A�l갲�:��% ���m^G�e��=�Oƥ-�\0�s���\\^؆e�R�n�$vYIW@�N�.����*@��Ϙ�<�-�^�סv�l��->ӝ�\r!���><��T5E��&�q�Ra\0_��Tyn�SGb�\\�Z����8�6ϳ\Zɳ��g+%R3(\rx��*A6�T�YP�!�I�_җ��˽p��>�=>s]�gԨ�t�c���;��h�@�O�4�b�\\�\"����79�!d)��@���q�O=N	�ŭ���6M35�H��#���|`i�-)j)>�����ثʼ~�*��c�#թH�ow�ß�����!Ē�A`,�������� �b�v�n=����B��M��ܪ�b\0(�U�J�����tg��2�\rg�T00�����Y�7����5n(�h�\n���~�9Ns�zW���瓃�\0�`9b:m��|��#�jikS��(�(\r���JR�I�?��н���==�n��k쥹��k�g��,��$���RI��Ϸ�<c�I�lm����Y������cA��RX���J�S�( 6v����1�K��`�ao{�*&V�ErB�����+�^�z#j�����\Z�j-��͊��R�ĩF;�ZV��� �\':�%�I��?]��{u\0ۘ����pq�/_YI�\\ ��2F��@u*����E�<����|7��R.�\Z��B��H�\0#lQZ�C$)��Ì(�J�r��c�бE��	Z\Z�!�K��E���5�;؎d��ld~������J�j��j��n�K��t�<�`��L�;2�����Df���oժ�k�S��%��$�\\Fq�]m;R��I���M�\Z\\�Wi3,Vv�ȷ;nI���|\n���5�ȡ9�K,��ic��P��	l	Bڴ�M���齩R�ۑ;2����V�2RA<r1�A��ˊ2�j��Zu2X�:�� ��۹�����\nJ���CN��W ?��~�x��)�}��藆�[)���i�2-�oS�N;�J\\e�?2c8��SN���*�=Bi~������5-D,-bæ��v�z�^4�r���=�|��IV�g1��m �2���b����N�(T�G�§��m�lGa�66���Rx\0g�\0i��u-6�tAu�����E[Q�fE��Y.I�K�\0�\'�U�O�Q���\\\n8�Y( ����<�G�&}$3K_YZ���lNxf���Y%��tߝ�o��ȋ��Ac�.iΞ���s�j(!�&©]�I���O��Jm�T��Vj*S��e2��!J+DiM�9[NM=�J��UK)x�\'-��X���P6� ����^?�>���*�ʩr�3\n�\n��*5H����w����@�)�Y\Z�v����%]ʖ	 ��$�\0�9��q��srO?�9\Z\0A�6�ݿ�e-(l4vcܒ�O��¸�\'U���I7��tR�IK`�T�Y�p8@>�<u�l	�#�P�m�/��Gv�}=k�v�1�\"���RA��9�9�@����Yq�\0�\0m�����7\'l6;���綨#�[��F�	�P����/j��#σ��υ��\0c���n#�F�^��~^��\0i�^���HÐ�I*@�|��~�4�l;�\0<0��bu��\r	�J�V���*I8	8# �����mm��ya��f�3�<q��댥��E)n-ǈ�)�\0��(���z�Y�\0w@�����熕,{�y[b.<|q6�?U [4hɫ������=@��4�(#>\n\\J��0^�_��/g�J}���G/f;ǅ���	�Fl���a\n��of���j~��*�P�V���h�T��qN0�8\0y\'����y��������Z���ă$��`�U� �nK7���~g���.�ǽ/�wo��nX\Z�u�xh�Ug\\�̿����PJ�VdU&N�#����x�.�q/��	hANٟe\\!]��6oų��wJ�A�5<����1U29�q�\\�r68�ܢ�����\n�e�MMY�����\"��2���u)�E�`\\����3i�#pT�e�m���jU��$YUj��n-6�ؑ\n�=-�T�o��ά���\r���2���>f�qMG�r\Zi������Z6v\'Of�e�3��b[�p�e��Ȗ�g����`р����C\\X:���\Zu��ɻF���Sn��)4��-A�BE\n�Z�\r�*$)[e��e�s�g.�iHGU�v¦���2�;D���+�n6a�aU��M�Z�����)��r�ɍ\'\n2���I\n��u������F��@6�j�cZ�K�j^iv�\\�=/A����\n�Ѥ�m�ʐ���\0�\0��G�UGD�@��/��/G��ǙeAjh��Tn��gpE���{W�(z�pU�Ò�ܥ�0g��.�D�ڀYJ\\J�N@<�ʞ���^@z�����q���LӃ��h��x��J��[۹�~�u�k�=qRۯ�6�L����[r�}�h�\Z��;�R���ȳ�� z�Y% �/FL�VJT�%��U�(K�:�]��l��G%O�4���a�R¢N��\0�ZN�c7�:@��7��݌�B�TH<���uuX3�{�rf9�ҷ�\Z��|�1�n:dw�,�+����\0\0s��ZE���������\r�22�󸁌���$c\'!��rǠe�\Z�>�H�\\߮�f0��	|��@��YY���sю?���˾�|f���������_��j�ZS�,��ِ�Yr:K�ݡ-^���뷱H�\0;��)#��B��Z��\0��#�4��ߝ����2�$��B�8V}�y>?|��;i#×�\re(M�n���f���딁���\0�P�_�a��f;�\n9�����ZxX�������?�\nRv��kZp9�((�G\0��m���m��,O���\n�#�T)7�l.o�A+�xl_���m�����ji��!�(F��\"�C�l�4������<�ƹmf[�٥=k�YZTaɒ[�`���叩��s\\��x\"�ˣ�Кx�ȡ^) ^�t*�Tm,�����h^��7�m�Z�K�,��c��1�8��h%�H,�V78w�d�����&˧��*z\Z}UT�WY\n��+��A���6ɆkL����=��vfP\Z��_f�l	�t���\r�����+�;��!ʪ�.�|���mc�K��]��_����46ʕ�e�1�ٟ���<I�Qe2��4L�uD\r���,�\r�;��v�� |=�SW�W=]meG�d��`X^�Tʪ�Ʉ0͠��H&P�?�RfO���߇7n��[�\"U��~5P�7�*=-v�	���T�e�T[i!{N_�OI�G´ӆ9��N�����-`IM�v�X�QpFV)���!Zgg����AN������������zk����/)��U�>�52�SfYڃ�\Z��vU�*S)>��b\\�����H>�L�-!A;�q�j�oGr�P���1��3!�M,\nP��9#*�X͓k�3Xb��˲8���#:����P�&ݜrJ +rM��:�k��b�hz�x꾜Ǭk�	�L��n=^;��Jn�am1�Eh,��\Z���P��\00�/\ZPeT9�d-P����ng�$��k��m�Y�[����OQR��,NW�P�v��1���f=�Q�\n��,T/��].-k�٨����e�z,F��6��}�G�Aff�js\Z��đ��Q�;z�nOSa�x���Re��-,	��Z�\0I뵱6��Ԋ��n��vMr�:H��*i�{��U8�Mf;,���2����:���\"�xk)�HU*d�<�ߴ,�f�vm�>�|�����Iƹ��fs�d�5K×@�9��F�:�LtD�˭�*	}D��܁6�u�+\0��pq���|�?�G�#~���0\Z4�*���\Zc��W�� ����gx�n\\�0�I;cļ�mA��h�$�dn�q��\0�׎�����6ֲ��ǧ��l��k���juD\\3ӕ+ڬ�k\n����~�p��5��Y���FfnA��{���ju�U�B�qD�	X	ô0���I#�s�8�p����Ï�Tk1��ӈ�!��cr���������ۦE؅ �??f[X�}�͟-^��R��Js���9<�|p:^4�AO+���ᜌ�!$j�O����:c�X*^Ġ��3�� q���X�Ib���o���(\'KYW���k6�9���5��6-�Ov���*K4�A�CWFDg0�e̶Ķ�AB�F�U���)�d��=yJ��S�E2�N����Wa��,�k���\\v/�&q�=>�5�.�j���b���SL�m��щZ܌�sƮ�|���T�j�u&�A����PP�=�,��H�N\nI��:�Z�9(g����F�k���ߖ>�e�@��WQY�(E��X�nw\0��_ߋ[�Qܼm��+$\Z<E�#�Dfi�$B��c���y\nJk��I��82�*�Er�\'cro��_lTSK_V�٬����ŖFVk����G�����\n�k5.�M\r6�N�qRۋ:�@�b��1��YV���}Ԕ��q���p�L��id���F`�$veH	�o����I��y]@3�*����;zü��6\'\\��QmZ���0eӤ��)�\\��\0��jmղ�sh	$a�\0�@�W�t1��o���gIWOQZ��J�Z�\0�\r�6�7�~|�8�=#���5r�*��A\n^\\�%�$%�\\C�����\0I�FJ|�qש\\Ԅ�1�a� ^�{9t�㦩x��7�cfP�\r\"���}���#��\Zٮ��P*�)��d͸ڎ���L�=Y���J����ۡ[Kkw(�rWh�\\\rX\Z�j�uX�x�V7��3! ��m z��{�U<}��\"���1QsAN����25���r��-�|A�B�{Qa2�T%����g��2��O�\n�A$c��<^=\n���ơ@��^������%|�~���k��I7��[��R����@�}��\0��:���>x���PI�ǂb]eAX$,�ԏ�$��#��%H��p��]{�~�p�!++N;���j��(8<>���I���cM\n]����\\�ƽi�[BG��c�U��+)$����랎��s�x�?��m2�:I���~}�hwW��\0>�I.$,*䊦�JG�?��!�\n��!X?L�z\'�~o6�q��/����]���~���I�)!(���A�eK\'��ܓ�I\n���|�ȮN�|-��|0ɛ-Н��\'����$��e9�|���.6�\\��AԱ�blGϕ�ƒ�v�S�Pm�O��s��h�Ò*���ok�ڐ��JV\nq@%��1��)�\\�0G��|���\0�UUT�t�����Q�{jp�7��Z�\0��mz���[��d]z�wm�_Tպ������V}���z�ua5:l�7f׭�iO��DS���@�!��ť��Y�n���.oO��q\rZ�\0\Z*tf�\'R$f���.�Y�,l�]�}d�C�7�Y�C���YuUT*��ћ,�x����P��o��oA5\Z��~�-)�Y��mpʠ_Z�\rǥʟL��ܧ�jc�rcrԖ塷BN��Sn(�2�=Q\\�f�/P��WR\\\"�j�&PuG( r�Lm`Yl,:���\\��&[�F2��q�u߲��]=�е���.J7R7\0��\0|\Zo`�0�t�i.Ė�e��Tba.8��RԐ��Rw6@�xJ��d9�}���v�H+ٹ�=ݍ��ז���}7��+Q\"`4��\0 �6�q����j�m��|I�Je\r[�S>[�y���?*�ϴ��2���4]p��ѹ�oYx�V(�\\�VY�\n΋��&ې	#��j<�����\n|�$���$$YU�\0�zX��	�CS�/��[ֽV㝨���b:�r�V�5S*\0-�i�ἷ*RU!����\0w�8TIA\0-qvu[�\Z<���9\Z��D�ـU[u�+�a	r|�$�*��>���C�IAv<�\0�b��N����(+_������M]P��,�K�;ED���\n��\"TDΙ\ZC{�Ǉ-�X��T�Y2�֧�[E���FWÒKMX���^�c�(��\n�X%�@i.$�Cy�\\�䢤��=5,�0�Wv\0ƒ8\"��BZ�`�\ZvR�,�;�z�U#C�}\"�}9λ.mF����J�~�J��Vf�b��a����\nǦ���&���� �i�0�N�ѩ_��@�P�55r�\\V>�`�OG��Tɳ��(�͙䫏C��2([�|t�F�A�R����X�Ҫ��Ui�#+�be6����̸	Ii�2��������=I�+m�n\Z�n	�F8�c��z�i��L�8 �V�W����1k}.)\nCjVӹ`�A	����������m�R�*.�;3�#���Q�������.)[�\0$\'��<s�۬-�6�~w³I\Z��Ͷ���Sr�n*\\wۄ���@\' ��py�{�w��(�Ŭ���jx;��l����%�z�PA �O�wts��������ً�{�{|�}�e�g1�k�� �������\0�h��S�W�����_;��3���X���u콼��e������Z�f=\Z�@�C~]J�GfEN�:5:(�*rnD�\'J��ZijZW%��%N!*b8�����\0,G�\\��`<z�+�sD�:J�HG|�*��� |/~[`���ܺ��2��)62eL���h����)���T\\��RdK��ѤG2d����ӡ#�>b����Z[�O�~�����?f53޺�SS�u%�GR�!P]��%.���X��r%�lșpZpi+����;��՘2ߑ�Z_RX�4)�g�\0����愥�\\Ȫ�ꪁ�G�sU\ZF�\\������\0)�<�&H��)ՒGm#&�?X��Mʲ��.m��- P>\'�<�E��h�ѭ��e�#7��[:O�1�WE�&Ý)x��M-��R����х�Ji����\0V�\r�-�@XXs�mD�2j����u��<���4���b�s����W�CԺ�>��e�ì֥�SL�iO�KkfR��z�z.Ka��V��T�� ?q>m�gihs	EE5R��	�\Z0�P�wk�IcccaҜ9��s軄�:$Z�����T�Ȭ\'��i\0܁\"H�)VQ�$_�ܴڝ:,�Z\r�yZJ�� �nԧ�z�;>�bz[w8���	sڢ���9�u�Y}]�e.[M������E��M�/��+�q��8��8�.�8�Ȫ�ae+�D�\0-�\'�� �@�[���?��zR\Z	��e�[�(ng��ai�;N|��9����#�æ�\0�|v�倔<V�*~SJ�ԡס�V�������ka�gR��~�eZ<����݊*[��ӈ[�-ń�@/,(��\'q%I\'pX�ޫ6���:y,�p��CK���c���ؑ�Y7e��IX��y���%�#�\0�:T�7b[~CU�6F�wzRiΗY��DO���>���))�����s�BQ�3�d#$�|c�����q��T��l]��lI7� �{)���M����w����{�Ҝ�m\'cݱ��h��V����5�\n}A��%ѭz2,��N����u:d���B�s���z�.��;��Z ���4�����6�>�:\\������\"H�\r{�M��wn��L�%�ii`=�,ن_V�i�j�+}����F��m���r郚���oӦ3Q��4�Bk���K�\nؘ�5J|������;�}%)0��	��+���]fG�Ib9�ȵͺ_��y\rVuWSo�T�ib���\r�r܋������n�\"=J�V��)��O��d)�I�!d�)��^zz�A\nSqP��H�m,�$��+�\"�<��\0���\0�q\09iv��4k��	vHK�?TO!�[m�\0�ʹ-:�k�߄�ȸhKUF�۲���T?V���i�1�5-���\";.�h�i��(�\'d�f�e�q�,A��N�qk����7s$�ms�`<��]����ŮI��%������<�6������\Z��\nv>V�����fv7�t7�>؁s_t�{��7\n�[���Rwey�㣹�1�Xl�\0���.�]�of\n�Yt(\Z�}�V�oZ����Y�F���ۺ=�t9-��3�Իڢ���%,2�� WV��.	S{)��/��}\"�)cG\0�w���\0$7�r����\'(x~���h�\r}�\n���mj7RC]��`Is�����Qd���S-�2ċoO�(:٤{�I-�]\Z��>v�{k��-�ڋ،��)?��I	uߛ��ޏHi�)��I�R蕎�ڧL�r���8���32�=�J��T	;I�нķ�ڹX�M�5J�5��;ڷ-�Z��hؖ�*ش�jDF)v��H�b��H�Ae���3���m��i\rT��rI$�$�9�Y�ĒY�叉\'ry���J�@���\0[t\\�1m)P#L�+��1���T�0��~CTvڵ�D���o4� yo�[��zGR�`��w�dW\rJ6��M�/3��_�ƾ+��#Qt�������Y���D.��)5�ޞ��׭���r�\0���!B�3�z�d[�*�q��F�=�\0��G�:e�X^�ՂΨ	�au&�t�\0��O�k�t۸O���g97D;����\0Q��A�Z�MԊ�m��+�y��f�e�0�KrhS����~J��zD������y�\\]�A��cw��E��\'\n#d\"�KcrӗO�gu\\��LU�3ӭ��:�w;�x�N�o���V�ìZ�z�\ruY��G�RZB�V��ƨ�)I2�l�������U/\n�p��\nz�HT߲�S�bn����r������m\"\Z���e{\r`�����>6y�nnåǖM�r��}R���1��B}B�[uay�Rq�o���M���^ZOƵ>��a�eY�;+�̔5r�&�bE���\Z�������E�7!\r�4�s�+�u���2Q�##\n8\'���k��&���4ځ�w�!�q\'�=��:���5s�Jߐ��.�Jm�6ъ4�Ԗ!��G�%֚��zڕ`�R����\\�fY�wU$�r��I$���=�ߞ&ut$E-%*�1B�\n�y^���u��g��j�q]�v��HrE�L�.��.5:kr�7)�Jb��&�\Z=-��Z��6��$�=	�F����2U��H�к��Fk�B�pN�{�@8�/MU�t5�#Ñ��,����$�eN����)ܒJ�u!������=�/�\Z�n�R�+[�=ժ�^��v�R��>�:ܓ��*�\"�ʊ���GCԧ�\\T��8��0�k2��٫�c����I���7\0�AV6�ߝ��|�5�4��	#r{)\n�	�����bo��Ȥ�]�$�Dv-A�T��Ӕ�E��p�J�,(q�[W�t2M��h�>_�5�ID-�\0pP�:H=\r��\r�ź�hҋ�s�ݤ����-U�o��:0�.̻�7-��׼Ҥ�5n�q�Ar�vҫQ���e���D,i��?�e�u^�����s��[rM���-*��Tؖ6�N�N׽�˓���\n���t\Z��Z���CM�i�*Tԡ���!\Z�Q~�u[JSP��U�,�*E�GBw�zW��7`ŉ옖\0~�3��Xm��\";[���<,e\Z��6��b<V�w\'����H��}��4\n�Q�Vj��5HR\"�(��zh��کQ*�V��0��P�ڷ$巐ө[i\'��󜼫n�n<;�6=q�)i&�����O5#Ğ@�\0���Ŕ^�CW-td4��r�U�:S>�6���J�Q����\0\\� r.��\'ۉ�[�ު��\0��\0?��~��[�a��;-�6�\'��HQ8��*���Ǻ<NQ&�	\"�w8]�FCiN]v2C�Q$���SǄ��~�N�G\\&���a�,,�a�5V^A^��v���;��������$�|�����O9S��L?a���bJ2]r����ݭw���iv֙�3�w�]�jU&ˡ�D�&�|��\Zd*�gTeѝ��n]���[4�ӑ���W����q�,oF�\Zg�kSO��Q��{��K�W\n�T1\nz�n\Z����JZ#/�IYE���﵈�� p?�]m�> =��j��K�&֫_�y7N�}AНI�ΝlwE�N�[o�����F��[�b\\��M�壿5��5�\rEn]\Z�Mm���:V�\"��g[�vRʯs�`N�X4�$����̪��,�1�#4��x$Fad,\r�zyz+�\"Ѿ�kGI\Z�\Z�T�O���Ԓ��N��U�T�6��B���U����P-����)�SbS6U�����=gY�ݽg�_�&�_��Rr(�;]�i*\0{�K��;��)M�\n\n7Ex	X�ΩW���y��ң�s�m `#�����轧j��Hzʒ���$L��g\r/�%�հ)�P��x����ږgD4f̌��M�\n�������]�1F���\'���b\rլA�.o�����p��e�v�T{mhHAy�:���$$z�JJ�ৌg��VfmQ~�`��o�||0���I���\0{���,<yo�_���j�xTس�\"�)���9!�-S�)T��å>�AR[kj0�FWѾ�*��2���T����A�9�!��0�PC��կzV�r�:�#�i+,�Z���Ꭓ�u Xs�{|A;�����D�ޡQ�J�j�ΊܵkfC�l�iدj%��\0���2ev�o��E� ��z��}����\0�g�yR�\"�3ì*ܭ�+/(���p�N�n�.1�s5^g4�U�f�!�]cUk�o�����:)׿ѭ�4���T�W��ܨ��_��R�����4�*�5j]=�sz��>�ȧ�2P];�7q���\0<\\�?JUr�SSM�����PZݓ gea��.�\'�)\'�H���y��ؒX��5u7������ȩ�Yu\'�6���F �$B�}S�	\0t�����G1V@�q����5�.MSNi��.[t�\nSeG���R�(�Ғ>����s�3R�tўLH���^f�4����3P�[[j%%xBѐ~���e7��m���I\"h��}\'q��p��;e�ލYM.\n*mT�N<��FS�� ͎V�]e@LKo��%�NIB�5���Ύ���w�s\Z\\�������K�NdP̋�$��r>=1�{�\rF�~��nH�PKb{o2�~Epin)���#J�9����L֧4�����GX����<��B�0���8�#�7��z��+r�濥��n�MR횈��R�J�������FO��2pzxw;���#�?�!�rأ�k�����8z�?�R�I��\'iBA���@ܵK9�n�;���������t\0�\nX�z��:���c�N�/)t��~�U�*��n3q�o�v�_��L����o����4�5��e(J������1���$�)̲T�/[#\0� ?�X�X���6 ��]�z&EQV�m���_I{����	:W�ʾn:��]:�����s\\N���?R/�Ö+�R�n\\���Q�E�ZK��\r@�%�[XBRn����]R���Ep#�E)u��Q�e!l�K�t�bN�N��ڢU�rdf��kX-��ٺ������5�P4��ѻ�gi��U��V��ݶ%5���*�O��T9m*�\"�uzU2#�_i��V�L�w6�-.7�%�͸�.˳\n�7�\\>�(���!^9�\r�H�t��.�ar�/�l�-�^��*ԛ/����\Z�=�ѷw�e�-��_��]캥y�$ZwΘD��/35�uZ51�S*q�#թr�WK�J�Kl͂�y-�v�9�{[�u���Y&Y=6aNR�V:�`B6M@�xI��H+���z%#��@^�x�\n0nV �y���tv�y�\r��ն����K�kU.��,��[��1��:�:��m�v4W��\"��0��3!k��3���S��H��xN>%�0-2i嵀!� �6��R�9�{���q�����j��8~�[�����*ĝ\'�S�$$ ��y{����\0n��i�R�yv�&�\"�n��Z�a��w:4v���T#3\"D��U`�Y�$���K��#2Y�A�Q4�D&�1PvF=�Y�Ai4�������>\0d\0��h���4tH\ZCk\"��ƶm��n��܊[�Ϻ�_M�}R�N�ub���J>��*��3��\"�\Z5�n����PV�V\"6���a�����S][�ҥ��;�r��e�^(R!^d���%�f��\r�n#��\rV�ͳ���3�i\r��P4P�4�w�j�z��p�N�QbD�m+�W��ı4ޞ�[ɐ�V�\n\Zn����)l˯ϸ_or�ˏ6�� 4�o���_E,*Y�٣Q=�w��n�����xr�J�����{�{��Kob7��nq��l|�\r��\0_��4�52�ck-��\Z�J��Т\\v�NL��Sm�U(�p\ns�ԅ2��!�}U!A	�q%o�E5U�\0����̆0�)P4��}V������M%-i�PW�o�l	\'e�:G������P3m���)m�*v>����?�񐵨���g�3�\0}Y!>��\0�\n�/�C})lo��;i���-����\"�H�\"ۜҚ��Im��*	*ݶY�$�O��8w>ˤ#���59��N�\0JV��,q��j)\Zy����%�mZ��z��\\�\r=M�bKorR����@�;rR��\'��Og���7�{��Ͳ�i��R��;�=�t\0���x4ZV��L��2�%�c2�y2T���y\nI	|���I��.��Y&qM�QTTP�P���\r/`��@��\r][G-�@yr��1�L��','Morad'),('Collaborateur',3,'C1111','Agadir Elmassira','1978-04-10','Bennareg@norsys.fr','Agadir','Bennareg','0666145878','collaborateur1','����\0JFIF\0\0H\0H\0\0��\0C\0	\n\n			\n\n		\r\r\n��\0C	��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\0��\0=\0\0\0\0\0!1\"AQaq�2��#B�CRb��$Ecr������\0\0\0\0\0\0\0\0\0\0\0\0\0��\03\0\0\0\0\0\0\0!1AQa\"2q�����#B�Rb����\0\0\0?\0���FK��|��.\Z��R��~�)���\0�ʤ��\0ܨ�bZ�z�SI��k��jƑ���A��=7��e���c�2I��蘓��P�\0U����Y��!y�#ΗIhW�8�Ā�+ohF��#�A	�J;�[�E�W�W�<��}¾\'Yn�\\��l��CWD��Ӱ��]��	�6��p��В��&���0�sR�^ 95Ĳ�@>UQy�\Zz\"{�w���d����=Ǖ\'�G���,��\\&���d6ŵ	o)�\03��G�⅗{��z���SR��2�Ǿ�\0�\r&��X��~TTzw;��:襗^iA��[k��L����Z�.me+I�5�{��L7���e��!�Pp)#�)�E�y�;\\h��K:��N��AR=JI8��\"���������KD�\r���].Vf�	5)�*V�T�F/�*�%g�2S\nf�\0��xO��j��\0)���o�?���\0`:Qv��r��\Zb�ph�=�Kl+!Sn�\'��c_/�.)	u̧����Z4�z��Ӛ>\r-7A�KH�Gy/rw�z=b�\'v�j�T���SQy���Z DPaEq��x8�j��+�z�O���S�M��!	O/ɫ�Z\0(�����#o*T�Nʓ�4�RV���#M�X �R��.4ix=���5.�H�a�&ԑ%\rxQsz��۬���YAsļ$�qO�W�[wvE�򸶘�RP��OR��!�v�5��W��љ�3-]�i�.��`)#`W�?�-97N%��m+L�0�0\\H;��?ґ���Y�s��NmETc^7N3N\\�G���$��S���=s���\'u������}�9�-)hRzd8y�b�ݩ�wU>^y<ܜܠ}�}�Z:\nOw.�x�o���6��8�1h7�\r�>3I��v�n�J�\Zy��i�Q�7�X6I�@u.)xJ�9N�?�_֛���;!)k萑��N��Ӝ�̨���/�q��i������c6�4g֤����J\\���\Z-��T��PP����pGQ+�z%�d��1���G+�X�GهNj��c(��|C*��q��f��D��VD��B�:H��p?cN�&�ܩ��x槵K9#�����Z	��[�>�`k�蛗���Pțx�p�nm�P���\'WW1�\\�2���d���B=��:.����?�+��\r�U�/���\'U�$���R�:��^~շ�������O���MO�������ӬaݝJ\":��N��Ej�H{��K�־rt�j�J+q(�*5�J��Ɯf�R9�����`c�8�뼇�X�V��-�\r)��Z/BVS�]+ԗ|X4M�U����s!I�N��3o�[�+gc���\0J��g���.��nP��6�)�z�*��N\"$\"���8�aj=7�;v_�\\���\Z[mJ�h+�,���N_��Ղ�\0#U\ZD=�ʓ�Eo\r�\"XN\0Hʩ��* ��W���Ү%��Ŧ�v������ǎ\\$�/�ۙ��\ZP�R�;i]w*�U��[�������Jr�r:֚�1��+P�<��1lv�sc�IC�8 ��\Z�jE���b�=�� eń�%�2��a���͖�`�b�����t>��z�:Ov۩b^6�G0����4L�޴�CE:���H���b�IZ!jvt����\05����v8Ry��\0��Q.9���U�9N\r74%�°>\r{9���]�F�\0��٣�	���1^�Nj3E���V0<�h�,�$����Qв@9�5��6Rj]�P<�[a��m�c��Q�zx�݄�i3��� \n��\"�ݗ�r��3:R��;z]�����vdb:�ʷ]�o�,�K\\K�r�\'�܀W���+��[Y��<��>f�.ԟ�\Z��n��\r�7#*��}���Tg�S�s@�3��5%�R@qEV���ltP\n���|xTN��Ҕ+9m�_�E����KB�͒�����?zl�tT�^��B0Z����ʊ�K椵N�t��6��.Q@�q\\�*\0�/�e�.G�i;CP�J�\\f�U�0*�bѠ=������A��=���\Z�{L�Λ��Iʜzd���I�z��|��[?��*�!��B���_��8��F�y�![+�hsq�V��R;���s�)����	VJ�H�Y��US�[��qJ��ܶNP��sZ��7;&�r�\Zyw3qk!k*KH�>%\'�Z���o��;�.j=h��^3��{�a+��)8�(��i2+�V��`7<�Px2�@���xV��F��-q$��BI?���]��l����\ZY�`��Hu��nͭ<�bZ\0�=�j&���j_q�4v$�|z\Z��+\n��m����k\r������}�5B�J�r��}jj[ް��N3�����J{��F��z�\0�m��̩	Ԫ����Թ*U�HIZ�@=zV]qx�b?=Dsy��[k��YW�E\\�J�\Z�j#ZN\Zt-^@VU�1��\r�̱�*R�{m\n)eJ#�5��z\Z7~F�\\=@���O���*⁓O��&��Eĉ��ŗ��`u��<鸚ÈmD��J[Oy���wm\r��O69�s���{6�3���Χ�aT=d\nMt��b�a��h�!#Ś��uЕaCҲ\Zo�v�L������q��4�[��KM:�d��l愊`XDML��/h�t����-ȑ{�A�\\����u��U|>�o�Xݵ�*K1��*W1J�\0l��۽��TӝĦT�̅������gI�y\0f<Y(C�<#$r�ڦ�} �菢ǥX�z�^��:�h=o�ƥ@[�<��|JR�\0\n�-mn�Im��\")q!�܏�V�-��;kq��CN��?t��\r�١���Qﺔ������N\Z���!��$���Go�k-��7f��:b4��Ғm)�髈�����6��4���Ô�7�D�#����QH�cޕ�1�	�y!V�n���jBJ�ώ�e?r:V�ThV�Y�����X�x��q1�V�yej8J��Ѭ\"��!$\Z�S��b�ps��&�Ѯ��bЙ)W#��9�^�̋���$��u�O@=3�)�˷9O��`�45!\\���;���<��yt����b�����(n:��LP�e�֐jW��%�Z�מ\\�jB]R�RL��^��yR\"��p��FȚ�\\��?��!	;���L��\rh�V=+XC�P���L����v}���;�\nm+����ѧ�[j�)DW�ṱCp`ƌ�����ֲ�+ZumM�)m!�_�>���V��;sy����:�Ŏ������P}9خ�{��5Z��R�-#�	�kK\"�wIWv�$����@<����i}D\'�T�z�`+	���Z��ې�p*��d��j�_�w���H�;=M��޺<F�zӳ=�_k����~y��M^m��\Z��\r��@����^�Ӯ�U�/�0��@;⧮���Mg�V��åiGDy�9�\n��sB�����dw�}�a+GL$��ӭMk�z�J��g 4�jL��D\Z���݋�\\��-%��`r�z�,��\0���U�%��׻�)z�]Ti-�wJJI��P���l�Ì��q. ��( c�]Ee���S�	J���G��J��5J��ƖC_l���x���~M-\ZӉ6r����Jд&K(��PFv$\n!�e�k�Tk��߉Ƿ<��Aq�4�\\�(�}�iv�Į�N��S!\nm���щ\Z����\Z\Z�HIy�(�����P�m�M}:ຢ���x{�v���^��_A2n��o���ǝ5�r<��A��RYm)�:���I��K\Z	@�O-�璆о�6�n}�#�px?w7+cS%8	v:U�5]{�vM:���~;l�<�}��\'^\Z���E�,�?*�9u�Ŕ���/�jT)�.��d�J��f�S�n6T�!�b�xQ&�s��R\"����x?\\�]~�F\\g�����UlsD��Ӭ��\\�^K�@�S�nW��SJ�U�Jc_}\"�!	X<��\0����F���K�����Rs��\n��!\n�c?Z�f�HSH��Ԑ5�+E���8�BN��u���Z�JF6�o�kO�v�K�f}=��D��s����\n��s��o��l��:�m�R���B��U�7\r�.\0��HD+��I�𬆪T�,����PU�\Z5�޸ӛJ�ZT��EZj�&�{���_m,��gp��P/2��F�j���c�����ܓ��*F[9�%��=+;��\0�J��?�\\�o}�M��7k���hm���o�K#\0�����q�6�HRֿ�i+ܒ���h�jԄX��Ì�v��R���B.�k��&�``ʎ��1�\ZUԭ�z��Z��}���@9^�� d���i�jqZ��7��|��3���K�`�,r��;zP�\r549!�B��EaA�(���#�4P�ݛ}��ڳ�|�h�:�$��z6��2*�{X���B�-���$2�t��slwO*�}s��\'�<.�KKWMh�#2�EJ���:%Dl=s���l6��Հ���oV��Q[����{��i�԰\0�Jǅ y�p\0���x�&�rj^vf}��R�9�0��\"b�ƦO��l�d��>0R}4��kZA��b*\r�	u��g�=)C�Q�56�м;�H���0����ڊYq��J���s�o�\r��J�:h�u�U��N����Ԋ1�Rv����K,KÞ|��5F��5��<��w��1t�L�v+,�C�Rw�;�O\Z����ƿ^�N2�J�����X�q�i�E-4���i���m��	S��\rƸ�Hp�ҒU�Q8�hOx���n%0��#�_��LշFϴ�]��^2P�Uc��9�e^�uZ\nJ�G1����`h���?�Y,q%��ː:�M���4��<�7}�%A�R�A��Q���}�(�\0ٽqv��إ�e\r�U/8H�5��gaI���..J�h�H[v�/�K��u_ݏo��O��z[@���zOÇ�ʄ0�BV|�TwY�Q��O�.1�S�w�fn�Ǥ�P����.6i�qoU&k���d�����sF����l��n$8L�\0-�q�$}�N�*3oD��$��P0	���H�;g$���r�4���2�G8�$~�)3̉�JQ�C_��IJrB�.P	�qyȯ*^	aDs�\0&ߛ�\0�5w@��ZS�a@�{m�0���fo�9�_]rm�h��p�ắE�t\'�~���r���svz3ŵ푐pq�=�*����Ht5�ψg�|\r�9�aY�=Zl���3��+V\\_(�Z2wP�q�c�h�ν�.sӃ���V���!��Oc��Q.�>��.�$\"3y9 K���ֿ��Nʹ���H�Nr�%)m�\nJ���)ڳ�*θ���:�����TO@\0�k燜8�ÿ��kHn�t�S�[��x��}���-��zK�{ۤ��<�(�^h���L�G�:�\Z}�=���[��)M�%m�#\n);�Nԯ�Ǳ���֩\Z��q���댕�ÖЏ&���=@�M�ᶩlͷ����+F0@�1_�%���L���H��j���)Ff��gNV�~�<�i��q�*�s�=��y����P� ⟋l�㡶U���+1lu��$�����QN��ʯ��8�g���̐OQR�ZS�)�N�M��O�eG2Z-���:�y�1)vX}X�1\0�U�����ޣ\\ef�;r\Z���V����','Samir'),('Collaborateur',4,'C2222','Elmassira 2 Marrakech','1988-04-22','Benchrifa@norsys.fr','Marrakech','Benchrifa','0666458287','collaborateur3','����\0JFIF\0\0H\0H\0\0��\0C\0	\n\n			\n\n		\r\r\n��\0C	��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0	\0��\0B\0\0\0\0\0!1\"AQaq2�#B���	$34Rbr���5CT������\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0.\0\0\0\0\0\0\0!1\"QAa2q�R��ᑒ���\0\0\0?\0��M�r�,I��/��jcӞe��2B\\Iqa) 98�վ�п���ʞ���J�7�]���#�B��T����Z�?�����Fyջ��[L��PP^ܓ�s�Vi��6�Rm�\Z�5N��&n:�*iIX��k7���˖�$����\n����E�yҾ�^	�:w��`������L��gCj�}R9�\'\n��\03f��򺓤��\"\\)n9R�-\nC�-����Y���ޔ��~�G=���seN!���y�h}J=wcvO��u��]���U)��Z<�~�\n��w�#QQ��&7S�\"�:���Q��x#�[�{���y�Ə�z����*Xp �v�Ϯ�4ٿV�ᙶ+�:	�\0����\rY] ��`����.���8W��Y���6��m���}j\"����S�p\Z��Ds�svT���zs�;!��6u,U-�Z����@aAm�t���=�\'C�۾/H���@r�5�ԩ�N��W��	�8���&��~�����~!Nſzk�ʭb�S������I�**h,�q�5*�L�ED�T�e0����d\"�~fE��R/�uJ名ҋ�)kA\'�		�w�珞S�x܈w�\"2\n�FRr��I�\00��ҽV�9��тx�5��\0_s�%�.��P��M��Cm��S�שO���d�F���B��r4=�-�J�-mX�m�I�*����4���\"�Իa;�	�5��1���NmJ��W8����I~R������#?}�\\0����[q��6@<Lp����a��h(�M\\����\0����Vu:��$�N1�~����[�5.:\Z> C�%JO����p����F�e�bN�?I{|%4���$�9��#@kc�2�ʛ%��+ZR�!D������=k���J{u�K.�m-��=3���E�jWc�?��)�]4w����~c_��&�i�Lժ@���p��\0��Ͼ��\r�&�dT���D�4[��j\nVU�W۝sv��z�ɨ$�/�.��N�P�~{j�#�WS�c5yLmm���Q�?����k9�J����.,{Fz�N��UO���nԥ$���P�^џ߭:���&�R�jJ����I͑xWoU�E�wH��C�#���f���&]��JzY�^���I�?�}X��\0��Z�M��C�2��	W�%��OS5��/DrKt�$+>T��I��z�A^�)t誂�ۅ;P�A�t�\"4���I���C~�t&��5=Q%CCK�R��\\��O��կ����ĊW��T��zsө,�+2�T*�y!�����4���o\n�G��F�\\��(�ڒ��G `�\0�An��ՙ�&�f���IR[��@��׿�)��\"B�����j��R����)$�»�����e>��%bz���}���\0��z|�uS���<R�bJ<l$q�pA���\Z[���SA�>p;n���v�T#[�fN%�-��ǋ�c��F�\'�[�T�-ٔ�b:�YO�*�܂9�T�\ZeE���M��.٩���\\��=dt��֫C)+��\0{y���TRfG�G��ӓ�di/��������<�INW�3ZI�ZorB�N�4��t�+�`O�7���WOlNw�\0�ՑD�Ϊ�b�L����A��\0Q�Vuy�\r|��$Xe�)-�M8�\'vV���\Z����\\�0�J�p���F{q��^g��Q�\0ݟ����\n~Z�- �ߓ��q�sз��i�������6~�l�Sn�����xM����,zw�,�	:�܌I*\0�\Z��.�%��P�y;Ns�5� {�ы��:t��$2T���:n~.9�u�U����M�Hi�zр1��72<\nd�I-��=\0<~g�t�t�೺�{Zǹ��e2��<T�Œv�{�z���@���:����G����+��^�bu�Iױ-Y�U+;����\"݀�!m~ HRe!c�$��#n���X���lpŽ,�\'������HA\'�iN��z�v�J�P�m�FZ҂�7�\'v��\'��O�\n\r�S�9�X_��Hg�a��ו�5�λN��R�#q�������5h_Wqo���6PJ��{�I�.\Z5��5ŉ.!�p�8��c����%�tH�uZ�@U���O�Ѹ�|�F>�Qmޥ�.R�m%�*.ӂǙ ����˵���K�R�:�K*v;�1��}~���ԕ��fy\0�T	ots��e��%U3�f!s�nt�u��Ҫ]a����0Q&�\re��J\\�9��G��zӚҁ)@t6�@�M��V.N�۲)Q�y0��,�$��%Y�T;\r3Ѻ:���I}e-dG��X2�|�\'���uk*�j�a��k���H��\0yՕN/�)?�:�m�(ۓ�N\"�֑����r	�Ƴ�\"1��>ŉ8Y���9�}�	`�\'9�Ԍi-,J�6��T{���9���y3Jc�P���*rZs�8��ԭFe4m8��)��W�:��9	.%0��\'���T��K�Оe\0�g�u�����:Kc+��m:�y��.�X����6	O��F���*�O�ĺ#/��C塱�)�����뤷�ηC�u�`%:�A�Ҷ�xC$�~�w&u$t�\r�8�Ќ󟮓j-�V�N���֫R8V�G�]=e�2�Mi��FZ����Նj�Br5=3�$s����ʽG���$��T�\\l�I��x΢�N��N�p�~�R{g$�׬v������]i�D�Nz�h\\l6�i\n�E�;%�%c�T���8Ϊ�2��\0W�J��*�J�Ov\"D���FR2\n�;�3릻�=&�\\)0�ѣɄRJ���8�g�,�;z(�jP�,S%�l4��K) ��s�E՟f0~��L�Tpr45pD��fM�!r�\"䆚_�qV��}��Q������}�\\L�	_��|��-8�}�O\Z����MV�T�\"�*�:�x�����Y�Ii�/�ݻQ;%���.f9ia)}�A�	���%�=B��Rn�H�؀��%��\'�c�q�\ZW����~Qz}d�\Z�9X�Df|��S�7��`���漣��S�KM&�N���������JG�H���Y�*�IHK�*�.xjiD�ۃw#ʞ���?��DzË��r�|���g�\0��������$\rTz|���\0\0��ǹ�uo.�HF�P�Ŭ[8�t,�v�����ҧesPm��������m�{�R��gR%A秡��B�-+i��;���യ��J]�\n�m �h~��}Q���mg�<�F�$T�rQG�Tܔ�0�����Z�N�|��W�y�U}�ps\nv7R�ӻ�׼�4j�q摑�+������x����T��[����Ԩdg~�����`P$���]�T8���^��:q��o����\'�wU@	�P�45��X�G�I�}	���%��?1X�\'���L\'�Ԡ�aO\"6�`-ө�R78��*����~�AN��H�N���j]X�k\rɑ�u�\0��V�2��T�����	��|}5P�R-kh���:k�\r��7!#�XΔ�0s)����9�W���)�Pڒ����?�������\0N�I�4������Ё�ԍ6��]�����$��T7)?�)�΢:��uG��sqV��|�m\'��{���_(�8.$6�!@�+tr㊋\ZA?�%4	��������R�f�5)��)��>�:PH(�U�C�\0m>i��	РTv�A\"���\0\n�Y�i�)���Ԇ�J���)J7*T���rtQV^3��U��ٗW],\\-�-����y��)ps�O���]q����Ti��^MQ�3\Z�HX�qJ�������&�\n�E��ə��8��t0��H�Pv�g��N��w<7-I��:�<���A�\nӷ}]�?\\]~��f�x�O�r&mYM����-�R$z�}�+�\r9��֍�Mf��A���$������\0:�-�\'�4ZIN\"sf��j\"���;�?�Y��I��V��ԩ>qƼS#��H*k�D�=�p\"52B���S�%~5]K�6�=�]ou��$\r����($�V�7�l~�Uj���T�-Iݍ�I���V�fTw��S��W��#6������*j�	Mh�ҭJ	Ԛ�/�ֹ,�)�չ�G���j1\\��vdI	��@�\nB���w�;;�!ܝ9��s�ϥ�d9��A�N\0� �x:�����N�#\'@}I�:ղ�����<)S�q@��l���;\rpP�!{��  ��t�_�\r}U-s:����%R�\\��9V�5wu��M���p܊?6Ʃ���`S���ׁ��/��\nE���u2=:�mp�A�QNR�_/\'F*�T���z}ӫV��쐰��-���U�*}a��z�����Uj\0�f/�3�[�Vi�W�95-�S�W#����[�=��:m:�U��6������nFLmJ#�X��񒒞Fq��Ey��-��K��vB���J����JweG�p3���xW��{�34��RR�*l�#D��AM(���tM�o`T��>�y7�{��Hz�O�K�I�B\\���]y�#�^0����H��F	R�*-:mb0.r��ܿr=��O��\0}�����\'�a�m�\n!��oV���5���~����<]�e��� ������	�r	д�k?��sj����4˶d�Nz,m��S�$�+	#��c�=�����TIT�x�d@�����1��(,�\0d��:���+c��4�Cl�[<�j	Z�S���.��\\vé�]��Ф�d!�񹇀�M�q�C�;h��m`����ԯ�-Fi-:�\0�m?���s��V�[�-�nŮ�ң<K�fFR�TiM(�֔GJ��}x:�5)#�º{��jC�͡���ա��\\[�Hu\'�v�}5`��%��\r,��x�\ZU�S���NBI\Z+���i�����ugOY�/���5��3��θp5��K�D0��������k}�٤0\'�JW!�喻���=�\n��&�S�J���t�����:l=��\0�R�JB�>Òt�|:T�������*A*Z�m�\"1�y ��P��#K���\0K+�&Kqe!��p�����t���t@���;�|��-,%H���q2?����=��k1��������<uF��]�U�u�p)��Sm�Caɏ ��]Vv�$�;R�p8A��6M�p��\nmB���!����7c*$��`~�M�jEj�{��꫶��2��)g�����b��4�=bߎ㡽�ܜ�#�:SMa��>�?�=��7����\Z�F�\Zh5:��Ħ�JT�(\'8�����NM�B\n�uU:�Z����o\\h�N� �y{�5?u�#���B�@���~裸���\0�	�3�oQ#�^���L�3(�l�JU�o��������`}N��}YP5:2��\08�����?H ?\"�qR\'(�Ir/�9�{v)�y���V�*\r�]�F�+�&;��2܅���?}��>j=\Z�V,����R�帕�P�T[�8�\n�s�M	m���X���-e%3�=�B��p�O��z��)eu���ȻZ���U�W�.��Kd��\Z�-�q�0�k!��U\"%*$��\ZLo�,�=�Pa)&�\0��:1t��3zCN�2�UE����A�5�C���}�56��q��0[e�2����\0-�\0VG��G>�Ȫ����q2��X��F���\0�uIzC��\n�9ث�RT�I,�\ni��j�Gb��h���5�a�M��\'\"�z�tf&~՟��p�A��\'���#0ܿHP�fr�|�\n�yYS��WYJZ[��V���Z?�}��G��ש��2�p���\"����\0�*R#4���D�δ(��ɏ������?��J�T+��ڷ�B�<�����\Z��f����Cm�FN�v��&���#Fd6����`2�B���4OoM\re��p ��f�e��,�M6�o�ۣH@6��֝H$�Fw�^ u�5����.�h�H\r�u����\'���y��4�H�T���c̝`�L`�>\Z���Fĩ|��v��7��ӒNcd�]�C�ˇ�4\nl[�7^����-��RG��<�cH�u�/W�.��M�*�i[��h�^\0��8眝C\\6��zx�v�ڭBiBBr�	p%)s�5�q���9�h���U&��C�m��e)��R�3������&���?\'���7Q���%�������	��\"Bߖ�Ip��wq�\0扖�b˴�Qj���P�Ho��F�\'��줐��p0;a����H�A�Q�v\"��jPJ�u(����i�B8�![$��U6�w�mDM�|���d��X��I�Gs\nI�Ƈ�K^U-Q��q8�Ҥ-����c��]�����9�}3���c)�_���/_Y���d�V�F٬(:��%�߈qƍ]�Ǚl��֝ϊ�XFpAO�@�-�h�c>�S.�����ӉI�n�i���܅r=ƪ�C���2H�GLn�%Y���z�;��G���S>!~cH\\���ч�yf\\�{D��;�̞��5]��ɥ��j��j{iI��_\'�<4YT(�*0�Sr\"��줔�/e(䬝.q?��','Chaimaa'),('Collaborateur',5,'C3333','Elbadii Marrakech','1981-02-10','Elghazi@norsys.fr','Rabat','Elghazi','0666485222','collaborateur3','����\0JFIF\0\0�\0�\0\0��\0C\0		\n	\n��\0C��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0?\0	\0\0\0!1	\"2AQaq#��BC�$3R\n%(bc������\0\0\0\0\0\0\0\0\0\0\0	\n\0��\09\0\0\0\0\0\0!1AQ\"aq��2���Bb��	3Rr�����\0\0\0?\0��\r>uy���{IrC9y^�Ki��X��uܴ�Z9�Ug���g5-|�\nw�w�B�yN?�z�Y�5����\0@�Ƨ.��Jk�W&�؏ $�G�#��V�܌���R�\rGS���jZ����T{u\\�B;\n��*�aGm����G,��n�6��}�\"S�!#�Ծ=�\n�8�:�ӵ��U*�P���*b�.�Ďă�\'9lx�ж��ŝ�[Ug�/�HSK��P�R�G��v��tRj5�\0-�y<��1lܕ%D��G�����[�D���x͋�kHI	=7��Dn�7��iߎ�vѾa�!�r��Ð��B��IJ������D��]`k@5;N�-5n�iǡ!�S-�q���~U|df�ĥH(IP\'���ƍ���Tj���i�J���Y��I\'����(g�I?��z�WekN��}V�S*��:%m��!���ƚ°��\0JB�AJ��\0.nP�\r*��X\n��[{&��[���\"[v+l4�%�3JW�J�Y�n��ꖼ�\\��4��-�7��^e�[\r�~U8�[@#�OE&�va�[Z\r���M\"���̹�iEkU>�����q%h!H)���<�Uv�꾢=w��-\0���MEE�����$)D7��Hx�,r$���m�]4tjW�Q��e`��݄��� ����>��\n-��v�#�<�C��g\'��Gs[��5L��\'��,��qF�=���k���mv��/B��V�nY����.��9�*	h���m��|U����{��I�~�/R\"P�y��y�D�e���ƍ!�ڛJIV$��y�{���;<��-�����=���+��y��\0<�z[	���TC�h���\Z�p�������q��\0Ca�L��\r�r���u�>]�.�\"jR��ͧ�2��]���Kό��?L�rȰ�\"��ݚ�Ȱ.8��ʄ��eM{.!.)@��q�n�5��}r~��V���4�V����L��Q�#����i!+99X\'�Tم�msj \0I=\0�R`���\"��hڒ�	\0r� �w1��n�T������R}oi�hG��%�Lq�s� �$(�<��}�MˁN��k=��\\t��6���[�۴��\\�JT�)C�c�8���S�������ؼ�Z�{I��TB�J+�X�j�Ҥ���w�Jm�XTVr����g�}�i&�hZ�%�:+_��ТD��7�\r�K,�)��ZP�@̆����IR����v��HJ��\'�@Wy6�ݥA�$��i���i�[�q�a���A��)nV.���)��F���XKx+��\"��~d�ܫ��t��CU�өv�tԷHm�c��-Ǡ?>Dy3��%���S�`������S����{�-�Qv�P�՗\"��]2d��:\ZCjf:V�g�TO�䑓@j��]��ջ�\\��w�f*� 3!��C@��H&C���>; ���4x`�a\n������p��\0�$q������E|$O�� 3	�0������l#i�j^�_4�K�&��r���I���a�S��Ө鍢��Kr�bÚ�@$)�� ���|���F����Q�7t�T�e>#4���f�� Ȁ>��s�6\'r�-�ɦ\n���w�k|��S�a=���g�;n��ȍdf\ZrB�/� ����aߣ�N�2t��\0fg�&cY�$f���Ƕ�LrA�T8����{��Qm�t�Z�T�P�j�[nA��p�=�Oo9) ���ߟ�SӨ�*�i����B���Y��\\� r<g�¾a�B��e��joX*��}��տRn�\Z�ܓ��B�TC�@R�\0�s��i꿤��jݐ�-�	�M[��HS�J3�C $�?�F��n���NaM2�y�!!��pF�t[�����n����`��DqKᚗn�f� s��^z������b�mǪ:iXe)t�UR\0�9%\\\nW��Rs��=R;�h��:�o\\�[b��EmB0m.T#�I�V�	��N\n��{��u�?U}�P7�@���2��9���1�;�R9���z�\r�n[V.�i��،J�P��g����\\�[�m!9����NGD�~��])�fO���}�b60(s�?zd�<�׮��գ�\Z�*5�R�̰�T�s�6�Oc��8>{�z_\Zao��C����l*�IHQZ�e��\'h�>磻M�Ƈa]��PގҔ>T�@eD����n��5��{���������dG���M`c\0� �&������vP�U��OmyR��M���ų���Ys�\0�\0c��W�*�.�=6�ʢJ�h�� �$\"k�ʄ�X�0;�:9��+t��^�y��캎-�(��~��Z?���^�ˏGզ�}��n�n�V�Fi* ���kiX����9�i��g��mkyp����43[:��6���dG#ϩ9M	�	(0\\JX2?��Ҥ��$�9��ʓ�-�5�V�`ƑwE�N���*Tx.HS�]<$� d��	�q��j6�_�C����f}S�Ȭ!��X$�=�?~�4;���l�gþ��5y7#�LEDmu��R�R}��P��x��GO[-Ih�`oU�]8��P�Ԓ$�߉#�g�F=2�[�����ش+v���f=M��\0Fy,��B��kp�x�R���F��4�J�bM�l��W|�MS�F���e��{n��u�� �9?�v��*=Fӗl����)I���E<㆟�PVsܗ#�I�\0l�����U^��S��OVSC����}*{��la\\|�\\[�Z!�*���nU�9n�	Rr�c֮M�ưf&��y��iE�����?��l�㫇V�wK���6֋�5����B.2�緶��W�x����j���]��q�\0�N)�4`�,�%n,���}���:9)z=�zr�u;fܣB�E���%ǒ��(`������ث\0��/��R�ۄ���l�����v�u�2>���eզk���Y����(�Q�,���I(�3�#��B�����4ZF�i�\ZUćR��I����g$gǂۿH�`�m�=Aݵ-nkU*�v��UG\Z@KhG Tp\0�l}�[.���\0�k��&��WiT��ZS�-��V���`� :�q�Ơ�<N%mb�m.�9>��恭2�����KkWt�Rt�^bcI�.Cl-$qq����\n���N�@�C���������_�҂$GZ̈�=�6��\0@8>X������M�[�m\r���}>v��+�\\��.3hQ��Btqt��HǓ�C�Zl�µ_n���m�q���ޞ���{P��K�Z~n��\0��o%HW1�aF��0�n�X���>=���y�ԇ�\n�#�.��N�p5z}��\Z�_��%SbQ%����6r?�z���|�kW��M�$\ZsWSr!��̲�n%hR~�2H��u�_���ԭ�nn�<�dU^m!X�\0�sד*��7��\\4�p(��Q%�PPf�캕-��|�dwʼtF��~d��֗XJ�Z�1�W�+F�qH�Zھ�5Ί���jUl�\nBy˫4�\\�\0�����@��L9��T܅N|�ZfT�,SR�!>Ԋ��ZҠI�p����=ri~�ZMһ�I���x�[��pȐ�f7�E�ܡ����2�s�\'��U7��W�Fn�U\n�E:�M�_��dFI�KY��* ����&1��)+J��\0\"��j�^Rt\0Pg�ӷޛv�ʃl�n�(�\ns��X���.�}�tA��Z��@J����~�N��j���/ȶ��Z��\0���{���e�{n��ܖ\\J��\r���͔�ۦ�1�3����������;c=;��z���l~J�F�U����,��\'�T0H��n!���ɧ��� ��4��+\\1cp�@����On(��Ҫ[�zVғA���V=�|���m�⩮#�� ���}�S����X��c�A��U�\n�Um���`=]|���W�1������ݜ��m�}���y����9C�P�>��G��	�\"\0�8�9�`�&�ի�=Y��O`��\Z8t�=��;��%R�$�S�)OT28���̶��RPL����P�^�.��f�}0�\0���ޡFԊ>�E��yT�H��U��?GS�\"zZ*m���uIN;�F2\0�O��\\�(�A����[j��.|�1Z����9).d�W\0[BTH=����V��S\"�5Zef�������$�b�P\\}�\08�#%���@�TF3�u�Z�+T�{kZeE��a��L������w�E�A��*�p*P��r�n���P^�1���ɗ��n�Ld��k��=�u���n�K�ǹ��gAQ��[]I�p�8�\0ˇ�9VH�{����t�@.}�i4�(W �˗,V;&t�PuI��JR3�_~��kj���ZҢ)�E�OnKM��BO�@�q�t�}{��?�Ջ+�5�M6��ò~X������y�D~{���e�Ҡ��V�XcM[��4֢=\r�y˦���~�|�XC1�Q���rN�>�=�Jq�Ӫ�ESR��O��F�=�q�}�c�R�JӝX��v����!HM6b���H[g*��Go8��nwsz�X�=/�Wm;Y�]�Z���c�i�`�E�h%KFR�Osն�\"����e�d��>�5��c��,Ӎ8ʀH3�0O=�qA�����75�j��Z�9��Tg=�4�d���.%$�>q�tת�ih\\����G�V�Iq2`Iq��Gq ���#��C�Z�S����>�I�P⋀y��=�JO��}�(qN�P`�t��H�\"��� �G_?��/R��*^��V����u�P�T����`c�==����͚h��O���ֶ��(Ws�yR)��*P۝R�����%�T�\\��%I�pޥZ�֫���?c��+�Q\'G�8r�h��N��w\r�6���<~:K���E{Tm��i��#��2ԨT����l΀�A�%,������Z��Z�ڮ.~+f\ZN�Gc�џ�̇�bVn�ᶫ~�I.�IJAH�Gm�Յ�x�٫]�KdZ��U9��˚�	 �9i{*��A	�x����R�?u�����\0h�T��*E^�5k����Ȩ�܌$q@%��t�\nE:�f��_�i�s%�f�%Ke�Ǹ��(�V;���z\")0&��F�؏GM���%����HC�Ϟ]N���L�O���%�/l�Ui|�4���~�k&n�=���(��l�u*��J���X�3��\'�m���J�H������3W��n�&CKE,)$��ۥ�R[�r\"�X�Y�N*�P�ʒG�|�:�t�X5��8�A⸉¾�4��\0�~���]�\Zqb�f�0�N�$���\n�w�7���n���*γ�e�b[��BM,��//��<B^*@N\0)!��$�;�g���m>�W��4�i�\n\Za�K-��l��T�v����F}�t�b5\"[��sŦIq\r�&D�6�@�Z\r�8�S�����:d�����\"��[A4��Հ>����t�v�᠏H�mį� ���%�����;�V��J��;:�����}�.O�R�%g(�V�H��Ҝ�v�aR7CҺMZ��\'U�R��u�m��p8��^�\'�pzt��ez��ݦ]U�u���6�Ҙ��qj/��u�A��)�b�	:�Z%2��kB�XC�	�d̗\Z;�R�u�e��� vIm��Wu}�W0��L�Ɋ���\Z�u�_�$��V��-�ڶ&�W�{�d���<�9��PT�+�����ȵ=,6K��Y�\r�^���ᵥ?Hu�y�i����:��Z�IH��Ҡ��5�~տ���\"2Kx<HR�����D�\"����-(MQ?�q�`y\'��H�!)�ۨ����g\r���ֿ�J@RF�ם�z:^��v��kfM�K�����>�9�]N*T�O\"˥`�9=(�&��Ki��xm>�H��z�%�T[��Qz����d\'��XP=�GU6׬�P�_�_���~\\kʱ6\\��#(�1��d$�\nB�?p�~�2��tꕙH��N��;����=m���y�}�rAq�+�P�D��H����������e*ijQ)EJ�=�8����(�U\n���4��*r!���炇�>����TwOc�(��h5vj56�H}�ˁJRP�QW葎�펳Ysz�=�fgO�uN�)���Ii��#=��t�<t�N�O^�tGC�R��.Z|�5���5�Am��\\��{�E	=�)iH�:�oj�\ZSᡑ�[��Ax�^Q#���ln�Xen>��:M����#S P�Ɏ��ӪB���y�� �<���8ܷ�f��߼��z�l��Q��:���R������O�S-{N+6��=\n�#݄�/:���\0�\\J��g@�\np�k\r��	�\0\n�R��?�ԗ�\n�OLf�	�b�ס�w_a�vU��e-$^)\08�\rJP���\r@�q�\\��n��l�4�o�����_؂�۱��z5�r����7�Z�n����`̌��Ge��r3�)$3�?���%]�Zz��(,N�*�\nOb�}m���SU���m��Ma<�74�$Ȧ=�怵!\'�\0���(}��Jq��Lz������7e�nl�q���;POP�#�T��.��{�cz�K>���]J�����(�ޜ��`�％��%	O۾~����oG�,�[Z���:��C��\n\\�����\0nt���(�{˅(��A�Ïd�w�{������n�)�v�i����n���H�O��-��+[R�Y>NH����Z���,j�i�J�!�&O{�&���i.c(\n���x��\0�[JeC��؂+�.�_پ��v�A�֖�����j��5����]\Z����\r�!��4�`����)W̧�������DZ�a���FSg[��θ�τ��z�����\Z�[��f9Os�`Fs���\rV���V�F��YC\r�r\Zr$6�y����!K�$��@��A-�*�n�pO�7�Oj��/�옵Yΰ�]�HU�b��e�\n\\?)#=���Rj{�R��K׫�Y�d��}(����ЭH۔zf�4��Z�-*�W�:*��T�%MT�TB�	Kq)�8�?������w;�J��uZ\Z��f�>���v[y6��t6�;���Z���|i.����I��\nTx��v�S�G�|�L��Ɵe�T��ҰFA�\0�܈��Zm\0��fѺ7)kʌ#A�[�ͦ���>ҪG��8���e-����^�\ZI܃1�k��9l`\r3�O_J�%����ZQ�[:{\Zd���m\"�Zqɗ��+I�A�1�sֈ�07oiY56-:�td6y�+���pG���:���=W�4j�&LV�Ϸ�)]F�O���\0�3����O�Cu�$�-���TL�k�6��M�c�?o�=\'��BÈ<�n�r�É�}ӃoNޢ������\Z�_��ݩU�V�锄��;�P�����i!�̴��(�k(Wjn�ԏZ��[IwmV4����-R�YeQ��t �����H\nIJ��YI#��g���)��e��ny�\\��FqDd��S�S\r���vɭnFҝ5�����[uj�)�d���a��O2��q�0���M1x�� ��ΑX{����XEۚZR�R���!׵y��ի���?M��ϑmZ#�g]���0\"�Q�R��\ns�$c����:E��*���GnH�����uPP\'6��T5�)_�\0VB�R�;��Mԝq�-�֭Q���`��A?��o�\'�]�V Em�M�3O����^�,3*9��统�}�x�;�:yP��A�O1�����1еͥ(���n)�\0luRω�\"�jv��#�P�P�W����=v�[�3u��Y�@ ��x�\0�������&�� `�HF;�;��3��!�J��o��\Z.T��0A��P�e\\s���ė�1q����^\\��G���t\\��T�����o�A�|�\0^�J�\"<ڬKҖ����;L��<�!J���u`��&3�w0��:�n��AZ��P��R�:g������k��k�$})p�E���H�5oX�~������uFG ��1���@��(��Ҳ<��Wu�����R�R��\0�ł\n[(�Zyg%!J=�uvo�۟T��-A���أJ�I�D%L�)Kn�������mK�ɽ#��r���{iEO�C����/�g�t�`c\0��g�_N!k|ϧӤך�{�g\r�l�ugn�����GHsŷ�T����اV�&�t��j=��1��Ͳ��R������?N��ת���ѣ�I�+Q��\">�j%!I)2]J]�xA#�O%�z��\0���G�ivl�`:�zuY,��Jr���TG̨����*���CC�����\\�S\"�c�K��p�TZm�9B�����?\'4�I<�\0)�9������N�4�6�nP)�\Z�Z%f4v��dG��2�6�n�Ej�A��Bs�\0s�4O��Tږݫv��>��}3ԉ���*��Z\ZXvt%(���-�%.�K�.�W2�r�~n��<��W�e�oJ4�Le-kS)��=1��԰�$���*+p%KJp��7�\n����h�T*5\n�]����$�-��]� })��0�cǹ��\'C�G�n�NI}��Q��;��yO�\0����ͩi��{Y��X���hZ��-���~.�q�{ḁ;m�~�W\\U%A+R�$�|���ӂ@P���ťt���\n����3)(P9*)}\nk�%_Ӥ�D#I�]����p{�(z�-IWQ���t��j�a��6�s�\nb��\"�HⰣ���\0n��S�=�weN��\0URy�p\\�W���q����=���*�Ym^Lׂ*p_h��S���?l���.�L����T�A\n=Ռ�\0[`�)��85ʬE���xL(ȏ�^~���s��4�]��R�#\n+$�~rz2tn���j^�i�n*;��N���䲇䡥9��R�G�:i;��^�nco?�N�*��\0��RM��V�7�羇��T�A*W�G̐0B�\0�z�����:��^�o�q�����S(��eJ$7(O6��[��#���p�0T�����{�O3�+�߾~��Wm��5|�[(d\'[�p&���%SУ덵z�u�J��OhG�t��Jm����%��4�m��u�󟜗���]n�� \\���#$������:��bm���k��x�w��֜W�j�A�9JeEUbsBKNsJԅq����\nz�~�m�\0U�7��m�%�5���~j��岦���쒇R��+R��d�qw&��S.��ƀ}�}뗋Z5�q�+筁	R���w\'}@xH;�z��_�&и��䢚���lC⒒T�BI?��\ZQvK�k�\\s��V# �%$�=�*W���CF�oh\r���Ԫ|�+s�.�\"+�qmߑ�>ݗۮ�ݩ��#-��\0�*J>�@��?�Ч�)W\Z�q[�϶�1�ءcK&u0&}(��;��Io��V��UԶ���>��2S�\n���O:q�)��X���%1hl��\rD��)hlvS�J\n��������^���ǭ�\\ز�w$�I������\'�J�]@P��*K���h0��U�m.�-.���P�g>:#�d��W�\0�O�=�/�E��J�n�S\"�� �)���}B��n�e�w�&���7%m*\r3Rf*y�Y�%|P���|�T��Ӎ�j��}P-�5�V�I\\�)�=�*H$e����8�>T��h6;�v]=5{j�n��֝�O.��x�w�\r���-)�h�JI ���m�Ҋ����Kf��]���bHAe�[��l)?�6�Ĝ�\0����\0I�v!�\nY�w�c��I4�z�d�m)q�.gB\nӆ��!*88�c�蘸��*B�9���i�\0p�����y�:��ZR8�R[�\0I���P���۰t��9��\"R�	R9a+���x��^!���	�u�^J�[��-K�!�I�I�Wf}�?�6���I����r޸��-ە�.F���*cn���\n�A�>�um�bi��(q\n�\0J��W�ѡ\\���sS��%�`��������\'��JKRk�>�/[��3�[9�j%\Zz�ϤG����G�K����)��x�����~�7�J�\0�ͩ)����\n ���ۤ���ĵ�D�r뭴x�)Q�G���?l+�ɶs����I\nX��S�q������&��{rt�y�=�j���V��B�\\���R�YH��ݐU\Z[�Ake)$�U�p�A�z���v�;��j\r��u:ͻ>�%��j�$4�][%�\0p�U��#�x\'c=ez�_����iu�.ƿꒋp+m-+z���JK8�ҒTCj�J�\'�ClZ�Ϸ��w��.�F��z��$GR��H^�XBҵ\0��d��*�~���?_�]�����wm #Z$(鐕6�>1F^��Pt�Ĳ���&�G�H�o�Lv�P���8�l����@�8�mG�\0$�_������!��/�d)� 8�<��H�RP�T��(��EV�=z�M����\nER�ջ�:��c�c{pԠq����{�X?l����z��GxZe���v��b��!�B����[nD��NE���$�9�ԫ�ZRJf�^���s�����o�Z���N�uBd(��0Ě�F���/�(���	h�3���\ZqIbV�G����U�oy��Zk���5�.LVe��Sˏ4�����K;X4�m�U�*�\r^Cι�$�K\\�	�������U��]U�赫uN��c�+A�\n��c�T�Z�ԡ���cA�P�_��ԅ\\�N	�I$��A�Q�q�P.�Uo�f�.߷�u�v�	R��F�m���p d��DӤ5뉨��v�/�K��6�aX�VA��]�{�B�º�*�0R���D�l��ZS�^?���Luf�Jk�®@Ԑ�ej$\0{y�;�>�n����)擙��W2O��_�M��Lo�Q�*v���ɍC2>|pmj\ni��~E˶\nH�mt5�)�ٕ�5��7�{\n���d?e�������\'?!���:V#T6����Kf]^$&�1��uQ���RU��.��\'�貱��X(wti�%ѯM9�E�23�b��X�W���c���z��bT(P:���[�ھ�\0l{�۶^2�^	���ڍ1l2�\'��_��[R��F\nrO~���j�6�cM�����H�){��,#��\0r\0�J���J�_Z�+��*�HgZڊ\"U�u��!��䩅�$��(|�)9�ߧg�~���\n�%\n�*�X)u�/{��\'($��*�߯_��XLL����#���','Jabrane'),('Collaborateur',6,'C4444','Elaazouzia Marrakech','1985-05-01','Elhouch@norsys.fr','Agadir','Elhouch','0666857495','collaborateur4','�����Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�(\0\0\0\0\0\0\01\0\0\0\0\0\0\0�2\0\0\0\0\0\0\0Їi\0\0\0\0\0\0\0�\0\0\0\0\0\0\n��\0\0\'\0\n��\0\0\'Adobe Photoshop CS5 Windows\02014:05:23 10:54:40\0\0�\0\0\0\0\00221�\0\0\0\0��\0\0�\0\0\0\0\0\0\0`�\0\0\0\0\0\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0j\0\0\0\0\0\0r(\0\0\0\0\0\0\0\0\0\0\0\0\0z\0\0\0\0\0\0\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0����\0Adobe_CM\0��\0Adobe\0d�\0\0\0��\0�\0			\n\r\r\r��\0\0`\0`\"\0��\0\0��?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r��C%�S���cs5���&D�TdE£t6�U�e���u��F\'���������������Vfv��������7GWgw��������\05\0!1AQaq\"2����B#�R��3$b�r��CScs4�%���&5��D�T�dEU6te����u��F���������������Vfv��������\'7GWgw�������\0\0\0?\0�T�I%)$�IJI%��:�=#�6j�L�w�E%3�g��=|��KO�i����>��%��4q��0qk�Xv��V.��|έ�������\Z;�����3��T�}#3�jQE��E��{ۻ��������f�˝s��n{���=��;J�{��	�����ڛ�ẳ-\'� �\0� C��Qc�#��F$l�5�0�\\\r����T�\r��oY�(XU$IC�g�^�<Q��K̾��K2z�ì�5�\Z���?�r�>��V�.?Ͱ�/2锿\')�O\"����N�O�ښeA|#f��~�\\�e�+:�Q��ݤ�/e�@����ȯP}�:�\0e6$��ɓ���#E4�R��~*F\"c��i�C)�1kD��vH����\n�!�b���YiPr���A0t�d������s뭖��J��͵�����\0�o���{,��\Z[���Z��k�aˬ�e�د�SU��x���\0ELe�k{�;���@t�*]�_^�֚���+g�$�w�����k������F��]������ەg,�v;��9�}�ά���4<\'r��U���w>��qqA#�\rƪ?E��Q���ja����T��R�\n���B)P�2��P���X%S%����|}i���A����\0}W�����F���:#]�/�}d�w��������\0�Yg�\\�=j�jy:�Ϣ��T���2\n�j��ȡ�/�5;\\J>o�+�h-�`���f$��5\'���Xv��5�?��:�{3��t�ꛚ�z�f=ùT�5��1:&�Ǫ^e�T\\�y�Ѫ���Z�\0���GP%�Y��R�2Ѱ�<� H��@:7�d�S�GuR����ՠ��������\0YqŹu��a�c�Z�⸞��2�C쩭�1�2�ɂ4�½7�`�q��2�\Z|@ܼ�\"�-t��!Fq=>IH^���U�5ދ����U\\�r.�A�et�f�����s*-��o$i�M�De�.9�����7u�>����֏���{��Rp�L^C��j���E��d�+��׫5����(���e��y�^�¾�\Z\0!�v��H��%�zm.�ly�K>���HV��i����	�q�f;DWS}ǀO�K���u���:�C���V2�&�<1�/]�ձ��u6<n#p�/%�l�g���9��\\�X�$��Y���f�8���<D���.�p���k]����i�u���y�=��n�t����T�@nMK&Q�p��B�C\0�,W6J��z������H�C@ǓR��$�ш�lk\Z	.Fm�-lc@nѾ��c|�O�Q����/����hPhotoshop 3.0\08BIM\0\0\0\0\0Z\0%G\0\0�\n\08BIM%\0\0\0\0\0���Eh~�!r@��aU�8BIM:\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0P\0R\0N\0_\0P\0Z\0 \0(\0H\0P\0 \0L\0a\0s\0e\0r\0J\0e\0t\0 \0P\02\00\05\05\0d\0n\0)\0\0\08BIM;\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@o�\0\0\0\0\0\0\0\0\0Grn doub@o�\0\0\0\0\0\0\0\0\0Bl  doub@o�\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\08BIM�\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?�\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0���\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0p\0\0�����������������������\0\0\0\0�����������������������\0\0\0\0�����������������������\0\0\0\0�����������������������\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\09\0\0\0\0\0\0\0\0\0\0\0\0\0\0`\0\0\0`\0\0\0\0a\08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`\0\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0`\0\0\0\0Rghtlong\0\0\0`\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0`\0\0\0\0Rghtlong\0\0\0`\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?�\0\0\0\0\0\08BIM\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0*\0\0\0\0\0\0`\0\0\0`\0\0 \0\0l\0\0\0\0\0����\0Adobe_CM\0��\0Adobe\0d�\0\0\0��\0�\0			\n\r\r\r��\0\0`\0`\"\0��\0\0��?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r��C%�S���cs5���&D�TdE£t6�U�e���u��F\'���������������Vfv��������7GWgw��������\05\0!1AQaq\"2����B#�R��3$b�r��CScs4�%���&5��D�T�dEU6te����u��F���������������Vfv��������\'7GWgw�������\0\0\0?\0�T�I%)$�IJI%��:�=#�6j�L�w�E%3�g��=|��KO�i����>��%��4q��0qk�Xv��V.��|έ�������\Z;�����3��T�}#3�jQE��E��{ۻ��������f�˝s��n{���=��;J�{��	�����ڛ�ẳ-\'� �\0� C��Qc�#��F$l�5�0�\\\r����T�\r��oY�(XU$IC�g�^�<Q��K̾��K2z�ì�5�\Z���?�r�>��V�.?Ͱ�/2锿\')�O\"����N�O�ښeA|#f��~�\\�e�+:�Q��ݤ�/e�@����ȯP}�:�\0e6$��ɓ���#E4�R��~*F\"c��i�C)�1kD��vH����\n�!�b���YiPr���A0t�d������s뭖��J��͵�����\0�o���{,��\Z[���Z��k�aˬ�e�د�SU��x���\0ELe�k{�;���@t�*]�_^�֚���+g�$�w�����k������F��]������ەg,�v;��9�}�ά���4<\'r��U���w>��qqA#�\rƪ?E��Q���ja����T��R�\n���B)P�2��P���X%S%����|}i���A����\0}W�����F���:#]�/�}d�w��������\0�Yg�\\�=j�jy:�Ϣ��T���2\n�j��ȡ�/�5;\\J>o�+�h-�`���f$��5\'���Xv��5�?��:�{3��t�ꛚ�z�f=ùT�5��1:&�Ǫ^e�T\\�y�Ѫ���Z�\0���GP%�Y��R�2Ѱ�<� H��@:7�d�S�GuR����ՠ��������\0YqŹu��a�c�Z�⸞��2�C쩭�1�2�ɂ4�½7�`�q��2�\Z|@ܼ�\"�-t��!Fq=>IH^���U�5ދ����U\\�r.�A�et�f�����s*-��o$i�M�De�.9�����7u�>����֏���{��Rp�L^C��j���E��d�+��׫5����(���e��y�^�¾�\Z\0!�v��H��%�zm.�ly�K>���HV��i����	�q�f;DWS}ǀO�K���u���:�C���V2�&�<1�/]�ձ��u6<n#p�/%�l�g���9��\\�X�$��Y���f�8���<D���.�p���k]����i�u���y�=��n�t����T�@nMK&Q�p��B�C\0�,W6J��z������H�C@ǓR��$�ш�lk\Z	.Fm�-lc@nѾ��c|�O�Q����/��8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\05\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0��\r�http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:DocumentID=\"47E830FBC91C5BA70327C40763970AA1\" xmpMM:InstanceID=\"xmp.iid:F0C2BE9657E2E311A086D2C5024B2C0E\" xmpMM:OriginalDocumentID=\"47E830FBC91C5BA70327C40763970AA1\" dc:format=\"image/jpeg\" photoshop:ColorMode=\"3\" xmp:CreateDate=\"2014-05-06T07:53:38+02:00\" xmp:ModifyDate=\"2014-05-23T10:54:40+02:00\" xmp:MetadataDate=\"2014-05-23T10:54:40+02:00\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\"> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:EFC2BE9657E2E311A086D2C5024B2C0E\" stEvt:when=\"2014-05-23T10:54:27+02:00\" stEvt:softwareAgent=\"Adobe Photoshop CS5 Windows\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:F0C2BE9657E2E311A086D2C5024B2C0E\" stEvt:when=\"2014-05-23T10:54:40+02:00\" stEvt:softwareAgent=\"Adobe Photoshop CS5 Windows\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>��\0Adobe\0d@\0\0\0��\0�\0��\0\0`\0`\0��\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0\0\0\0	\0\n\0	u!\"\01A2#	QBa$3Rq�b�%C���&4r\n��5\'�S6��DTsEF7Gc(UVW\Z�����d�t��e�����)8f�u*9:HIJXYZghijvwxyz�������������������������������������������������������\0m!1\0\"AQ2aqB�#�R�b3	�$��Cr��4%�ScD�&5T6Ed\'\ns��Ft����UeuV7��������)\Z��������������(GWf8v��������gw��������HXhx��������9IYiy��������*:JZjz����������\0\0\0?\0��ߺ�^��׽��u�~��{ߺ�\\K��\0��\'�O�u���O����u�\"{G�1u^T��*e5{�sTĤ�&�۴�\\�RU�3�b�\Z�n=�Δ�3���9\\���Aֻ���\0\n���Kb:�y`�Z�.g~g��Y<��)J��\rU\"1U\"�g��\"��=��r����z3[M�4�4�X�\0\r)�֧��p�\0§vN��8�]E�;+%��]ч]���clVȥ�+~�i��	?�#��b[ܰmC���`j�n?/�u��x|��]Ӽ��=�x���y��[#/$M\r&b���Ʀ\Z�4�����e�֥T��{	���CV^?�סs�^�}oD�\Z3�R����e\')L�=�U-n&�\'R��]���n(�銬��n�&�ǅconA�83\n �ͤ�A%���Q�Zt䠂��f�\n�r0�a&BV���\0�y&^���r}����sr��V��/�u����ߺ�^��׽��u�~��tO�u����\0��7�H�;Cr�j�s��͏�_S��4�$oS,��^5m-K�էJ/��ުO��	f�#����\0/�z��|��q�?0��pv7h�j��%Rq8�na���̴x\\5r=\"��#駃Ө���F-�j�\n����k+ȝ��ztP�>��\rOW����8�Q#��$P��2����M�>�Ԁ@�;5j��������eL�\\�yuK)��� [�\n�@���Y�\0u�-*$\'�9�\07Hl���p5�;����v��%$��>3��j��4�H�7ӏAN�bss��Q��3�*�E]JŌu4� �O�E*|o��p�O����h&Zш�O�W����)��x�\'�YG&ޒ\Zfic��H꒕��5�M�����%��h��g��\0?BAq��I��\0c�����ߺ�^��׽��u�~��c��/���\0��^G��>�F��������C��o���9*���\\\r���PH��੠`k낤�Sɝ�Vie)��D\Z��]*14�F���ނ�\'��\\:���!&SG�wJ��՝u1�0ΈHiM�`Z�\'�I��] ��F��m6rHGp��{�e��N��[n�!���{B�H��$��E*#�ϱݽ��[��&����[�Y+�b�@@�������ݔ�����=����_ä�M:x���h��Tv�?ԞG��i�J���*~}%���T]�7�O� �[���\0_�Z�\Zӄ5W�K��奭���%Z�\'�T2��hL��ؽ����,��\n�G_���z\\�y+�t�\nʍ�\Z����6�ȔV�>��,�WA�ݸP�Z�q{]lm����_�m	�I�	^=L]Ňe+a��A�{X/a�K�6�y�����\Z��-o���>�/�����e�z�E������^��U@˳��c/\n�SOJ��<h�����㍽����\nr�1��χ�OY[��q!>\Z�Y�����:ї�F��v�fn��=��Fv���.{#��M������T6+�0rF�!�V쭩KOa.e�)n��x�\0��(I��}Jܡ���y}e����R�C�51��i�Fʧ�H�0SP��D����MN�l�ҧ����=�K�!o��.;���y\'�#��Z�3���Re6�fm����y[�����(\Z)ϊ�3�Q���\'��\0�{�믋���I���Gq:Xj��xuNUb�����b�Y���X��\0��Z��=5��&��V�\'Y�������a��ğ�Ǥ�J�\n��7��JH-��� П.��R6l�O�1p���d>�Җ#gS$$�\'�#��6���@����k�w]����S����M��~M�\0�s����V�~�u,I\r�Z�K|eJI�o���@��ٴw-��Ϣ[�R��gϏ��OM#�H7�&������]�� ���z`Y5�O˩��$U���nX��\0���w��F������_���������nL�ŭ��{Rb���jm��Ģˢc���dw�IԱǈ��R��HA<�0�/.g��4(�MEsA����ɬ����߲Y%�O�c1�����\\��i��ۏov\'a�*���1)��*��j6]3���U	(�:D� UD�k�O����|rZ .�$4ࢴ<>Cҝ�6H6y漲��O\n��d`@�\nM~�\r�AS[\r��#ODq��VE�05DPJ��U\0�oR�G������o�r�J����{sY�p�|R<�z�O��\'֛�-��8=�\0���R�2�o#��*\\T��&��m�YMI�EF���9ZR�b���ymm������j�����2�6���n�����҅���q��}iֹ�$��}%8����rn���\\Z��<:�V9ci���c����!�����4����Ea��)��TN�Z�4�6�T0OL�_��ӫ�n/�^��I\rN���J��B�1�ZJ�m$܉=cI*�����k��\'��9Y<Z~]���&�� ����Q�ʪ�Wׂ>��i��ˊ��U8Ӥ_[���\'�@�x��m�q3�U1��t�s����Ɯװ!�b6���O��5��;���]d����\0��ll_]�����q����Bp:��d���\n�<+G�YI��A{.y������_k���K�תs�&��=e�]�IOS\'�ߛ����٢`��YM����� �#��d�[m;���C	�����}�\0k���ȳ\ZT\n�oJ({[iUm�ɚ��W���TPcUi&Lm&:����8�MM\\�-�*�a~mQ������Z/��gRm�-����~��+���X�����3x��sW���)u�F	�+�(�\"����#m�D���>��٦k��(z{j}����5�m�����I	��Ư,$�\0R�\"Û�>�7�bKk��`�tCe�����j�)����}����ۿsm��p;�/��k;-&BtRW�,G�{��䷚�h�ֲ�	��ki���Q��c����wYNY��-dW7\0���@����毗E����+�Qx�6�>�\"���o{&�;A�w)�z�\nt)a�[8\'���8��=X1^:���ܞ=��q�,��	Q�*�ew7���\0�M��y�Wbj�>��\n�{�Ǥ�^4R\r�*/�����_p�ʮ�j��Q��If\"��� Ao���_ds��­���zP�tG��zӟ���y)�\0�6��3j=�C�|�<�)h�+j�5r���Ň�i����(�6K�������:?ۭ���_�P@���hNz4�#{�V���(v^\'=G����ssg�6YY��rlE�B���PI�٬��>��j��q�U�%G�Z�\0����W7�����A�to����5�Z��P�S�\"ESP6��ە��CY,)L�l�Bh�i�UI�{���]�\n/��z��c:�r�GL�\0�GHn��d콿��C��Ň�����#O% 5\n1��ؘ��Ȓ���U��U�ZM���	*qO���K,n���9\0��玵p�]�#���*i5Y��1�E������ٞC�|嫕~Z�<�?�:Ğ{��8ܳ�8:.����!7\Z�BI��ϳ���=�h�>�lr�C�U�^-`t�7����}�%���J-Z!���;��3:5��L#������\0�=��{I�������ߚl�,q4�U!T�����N����	�d����~�{ڙg2)aͯp.x�\r��X�Ե/�u*tm�H�-(z�Oˤt;�M\Z�t\n�\r�N}�2ܼ�(�O�R��!�[�����y��K8#J؆�O��k�\0���eiCԀ*>������~F�5�ۚ~}i��ݶ�?-��2S�G��={�	P�]\"�}��p�1�=PTS��5��}������r�H�����uia<�M�X�7H���@��8ҽ\Z�孿3�\0!���_[��~l�ϐ��YSMGY6V�g��G��4SOM_S���]Ы>�rT�r�դV6�H���p�Z��|~]9c���/�i�m�?�5������t�%_W�kg�e�rB,%�}Q ����B�)��[��ޙ<Id\Z~C���vM���4[Y�����\0:\n��S\r���Q��KM���tƩ\Z\nu��\0��%��{(%�:33��xt�ȁ�wZ\r$_��g\Zu�/�J�7?pn��6�5���]4Դ�Z��A�9rޫ}�(^��b�b����\Z�i]?���i̡T�U@���}�����&�\0�\ny���ޥ�+�MjE��[�r[�e��kӐ|qצ\\�(l��\r�\n���\0O~��q�R�����r>�\0��ı�\Z��3��?��������Dk���i�/���YJ����DL��2�[�>�zo�=�m�7��c����i�vՇG9��|�n39���H�bA?�\0���Z	v�����L���Ds�0PK7���?B��\0_�tܾ�E���H������I+����_�Q���Wnl���d��Q�����UO����k�J����d`r/����,�$����δTy�\0�]d.�<�{\0|s�������/�>��Y�ݛG��vu~����ܛ*����Ty�Js@ۇndl�SW�G�T�P�9V��H�m�v��\ns���\0c���{�\'o۪6ֲG�Dg�s�:�����0]���\0sp9��c#��%��S�MSB�jV)m�:�c\"��2@\"��\r��;Rq���Y�\\�˜�6شq����=\0ݡ�����B�4���n�#s�Q��)��k�����nR�8�>����˪��c�+��wiR��3�)�a�@��s��-�?���1��/�s�3y��^�Ld�z���Bp�L�ZޤP�����=�t�,���$�-Q ���\0[MC��=���Q�|b����d��f\0ݦW�zX;qn	���V�[�q=�����\\TK��F*9e#�}��b�<�\'�p�P8t�l��G\"�Ա��A�����(+Ztػ:)��Ч����!vRH�܀.���{�`<�Z����=	m��壒L}=Ulw��\0�E,�&��2����>�?\'�	 ��;�9F�\0W�FI�q5ƔO�?�.�o�#���]�2������b2( X�iN顫�N�V(劮MM�����Os6��Ý#� �\n�O�H\0y������]l��F�T\\$D�3QB��_=��K���\"�A������!\'�������?�k�vK�\Z���\0��\r��f�i9[�\'�E�;+#���H�is�Z�\'@\r5<�4,.\r����o웛�3ػR�	����wUV�Nz�������N_#CoU6*h(Y\0��uQ��`�m@��Z��E�\"��l��,z���!�px�?�S��#�.��y��䫩<t�X��MT�s��è�ǫ��K[�\Z�3�%�m6M�P�������<v@U$��D\\6�������ď�Q��\\g���±q�im\'�fw67�\\�z\'8�:g������^%_�#��\0���}����3�4���ѱ���tscY~�5�Pޥ<h��}�y��C�4�s�I�?Qv�=Dш�Q��_P����$�e�4�ꪵ��ԉ4d���V�fWv�n,�J�v&�f�\Z�9_���P����V��5徠{���\n��1��ϣM����O�Fy���W���eG�۩S4tQ���U?�z����Y�d����(ZhP^G-e�n|��{A�}jR͗(XXXK�^F�� %t�,�#�=��7_�^���m������\'�����#y)XD��dWr���@ҜŞ����V�{|5.�(��҇����z����nP�\0�\r�����i �\0���#�(�yn�\"`�|�JH�T��䪔#ƠX��[p�se���+qV�7�])��>���1�X�m�xkq���E<��_���8���3���h��RT`J3}4�>��o�!�x��_�:s���]�+�P����[\rd�=��k>�Q�$�����Q��0xsc��q+Gr�{N>u�%���Fp�Δ���\0mE��u&&\"HiayP\n���I;S�\0dg-�8Q�[���]	�q��\'�Q\"�[`4�2}z�\n�p�f[*�U�A嵻����A��c����fD&�%:�C���]q�Y���5\Z�YE��������MQ��A���\0г�z��u�,VOUW]��bU�\'��[�Њ.6����Est���6?gF�v��N�c�&���.�����x]ź*q�T������ˣ���O���ʕ\'�E6�K?���Yt���ۃOIM]K��究�;��h)p�f\'�Hc�3TIU��t�Y�� [�ٮ^#�|O��Fp� ��`=�7��6�q�2�m����%=����U�L������l�L~�ҐY,�w���v��K���X�W�_��z�w�oΌ���l����UY��c�V쒠I��,���omLr�̔ȱ�W%�5&8�}Ně6س)��թЃ��`��~�AO��\0M��N��^�;r�!��We7V楩����\'%@���O\\0�^�I��V��E��N@��u�O#�5\Z��:K�vȘT�� �#��#���sٙu\n�H�G�X!\r0@�彌��L�2�\0�����c��ys�z1?�Ti(�`�$��Yle����O:��=�9�S�����k�`�:�|~!�6�͚�GEI\n2*j3�B����r����R����z���8�W���Q�s;&jLjEy�	*.�9��F�-o����g�(`:�y�rg�N#Ϣf�RYCD��r�nHr��?���w����؃�	͈�B�!�Q�Ϫ�,:nK��*?��{��ֈ�A�zY���\0�\'o�p>��z�aR����?�}���*��Q薢���-&�UC��g�>���dh�cAк&�f��e��d��u��','Safaa');
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
INSERT INTO `PARTENAIRE` VALUES (1,'al afaq marrakech','fondation.ocp@gmail.com','Fondation OCP','0566858172','Fondation'),(2,'Geliz Imm3 APP34 Marrakech','fondation.mohamedv@gmail.com','Fondation Mohamed V','0566258493','Fondation'),(3,'48, Rue de la Sablière, Libourne','agrisud.international@gmail.com','Agrisud International','+330557251706','Association');
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
INSERT INTO `PROJET` VALUES (1,'2017-03-03','2017-08-15','Professionnalisation de très petites exploitations agricoles familiales et valoriser les productions fruitières. Sensibiliser des producteurs agricoles à l’environnement en promouvant des pratiques agroécologiques','Création de TPE agricoles au Maroc',1,NULL,2);
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
