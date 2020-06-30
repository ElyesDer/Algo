//
//  main.swift
//  algo
//
//  Created by 360medlink Tunisia on 5/28/20.
//  Copyright © 2020 360medlink Tunisia. All rights reserved.
//

import Foundation
import NaturalLanguage


print("Hello, Algorithm")

var raw = "ASSOCIAT\nBIZERTE\n2050\nBorhéne DHAOUADI\nPrésident\nFondateur\nCoworking Business Center - CBC\nAvenue de I'Environnement Zarzouna\n(+216) 23 40 41 79\n7021 - Bizerte - Tunisie\n2\nborhene@bizertesmartcity.com\ncontact@bizerte2050.com\n------------------------ detectFields - Raw data ---------------------------\nlevio\nAFFAIRES ET TECHNOLOGIES\nJonathan Chouinard\nConseiller stratégique\n1015, Av Wilfrid-Pelletier, local 530\nChargé de projet\nQuébec (Québec) G1W 0C4\njonathan.chouinard@levio.ca\nT 418 914-3623\nwww.levio.ca\nC 418 931-8789\n------------------------ detectFields - Raw data ---------------------------\nMed Cheker Amdouni\nGraphic Designer\nPixartprinting SpA\nImmeuble Les 2 Lacs, Bloc 9,\nRue du Lac de Constance,\norinting\nLes Berges du Lac 1053,\nTunis\nmedcheker.amdouni@pixartprinting.com\n8\n------------------------ detectFields - Raw data ---------------------------\nCrea\nCUISINE\n...et vos envies prennent vie\nHichem HARBAOUI\nGérant\nN'1 Rue Bechir Bachrouch, Khaznadar 2017\n-\n(+2161 71 515 470\n(+216) 23 559 990\nhichem.harbaoui@live.fr fl Créa Cuisine\n11216 52 490 435\n------------------------ detectFields - Raw data ---------------------------\nAhmed Ayed\nConsultant\nProfessional Services\naxefinance\n+216 71 963 229\nFocus • Expertise • Value\nE ahmed.ayed@axefinance.com\n------------------------ detectFields - Raw data ---------------------------\nRyosuke Nagao\nCEO\nnagao@impetus.jp\nLead Translator\nIMPETUS\nLinguistic Consultation\nImpetus Co.\n5-31-5-1004 Honkomagome,\nBunkyo-ku, Tokyo, JAPAN\n------------------------ detectFields - Raw data ---------------------------\nSeifeddine Khelifi\nExpert Senior\nDéveloppement des Ventes\nboredoo\nImmeuble Zenith, Les Jardins du Lac\n1053, Les Berges du Lac, Tunis, Tunisie\nM : +216 22 126 4661T : +216 36 126 466\nseifeddine.khelifi@ooredoo.tn\n------------------------ detectFields - Raw data ---------------------------\n6 Leb:\n961 9 213 414\nLeb:\n961 3 075791\nKSA: + 966556450046\nD Beirut - Lebanon & Riyadh - KSA\nS dkiame\nwww.intech-mena.com\ndkiame@intech-mena.com\n------------------------ detectFields - Raw data ---------------------------\nLAZHAR NSIRI\nSUBSIDIARY DIRECTOR\nWYPLAY TUNISIA\nInsiri@wyplay.com\nFrench Mobile +33 6 19 43 30 48\nTunisia +216 97 07 06 42\nwwpoy\n------------------------ detectFields - Raw data ---------------------------\n360\\nWael Mallek\nMEDLINK\nGeneral Manager of\nTunisian operations\nHealthcare\nMobile Applications\nwaelm@360medlink.com\nmobile. +216 98 70 92 14\noffice. +1 514 448 2175\nwww.360medlink.com\nMontreal - New York I Paris I Barcelona\nTunis\n------------------------ detectFields - Raw data ---------------------------\nAnis ADDALA\n00\nDirecteur Commercial Afrique\nHead Of Sales and Business Dev. Africa\nva\nTel Fax : +216 71 267 090/ +216 71 267 091\nMobile : +216 22 111 000 /+213 56 167 27 31\n~\nanis.addala@novatel-it.com\nwww.novatel-it.com\nNOVATEL\nIn\nFarah Lake building, Rue de la Feuille d'Erable,\nBureau B2.2, 1053 les Berges du Lac2, Tunis, Tunisie\n------------------------ detectFields - Raw data ---------------------------\nJOE CHAHOUD\nGENERAL MANAGER/CTO\nmobile:\n+961 70 294 835\nSkype ID: joechahoud\nemail:\njchahoud@intech-mena.com\nTel/Fax:\n+961 213 414\nWebiste:\nwww.intech-mena.com\n------------------------ detectFields - Raw data ---------------------------\nBéchir BOUFADEN\nDirecteur Commercial\n(+216) 98 358 956\n(+216) 28 546 460\nctfec@ctfexpo.com\nbechir.boufaden@ctfexpo.com\nwww.ctfexpo.com\nLes Jardins d'El Menzah\n2094 El Mnihla Ariana\n(+216) 70 734 290\n(+216) 70 734 291\n------------------------ detectFields - Raw data ---------------------------\n62A\nAdel Ghouma\nMENA Manager\n+48 791 046 584\nG2A.com\naghouma@g2a.com\nG2A.co\n------------------------ detectFields - Raw data ---------------------------\nréinventez votre vie\nIlyes KHEMIRI\nDirecteur Commercial\nDéco-pierre\n23 Rue Feyrouz Cite El Fawz\nEnnasr 3 - Tunis\nFb: Déco-pierre\nTel.: 29 403 488\nE-mail:decopierre2013@gmail.com\n21 031 700\n------------------------ detectFields - Raw data ---------------------------\nN\nSage\nIntégrateur\nNOVASOFT\nde Solutions\nElyes TALMOUDI\nGérant\nPortable: 20 279 500\nTél.: +(216) 71 860 636\nFax: +(216) 71 862 627\nAdresse: Bur B1,\nRésidence El Mouna\nRue du lac Malaren, les berges du lac, Tunis\nE-mail: elytal.bmda@topnet.tn\n------------------------ END Raw data ---------------------------\n------------------------ detectFields - Raw data ---------------------------\nMaiborn\nWolff\nMenrl\"t PROF. Sadok Chekir\nDiplom Ingenieur\nIT Architect\nsadok.chekir@maibornwolff.de\nMobil +49 151 544 22 153\nMaibornWolff GmbH\nTheresienhohe 13 - 80339 Munchen\nmaibornwolff.de\n------------------------ detectFields - Raw data ---------------------------\nTechlimed\nINFORMATION LINGUISTICS TECHNOLOGY\nDr. Ramzi ABBES\nPresident & C.E.O.\n42, rue de 1'Université - 69007 Lyon France\nPhone : +33 (0)4 78 58 32 35\nMobile : +33 (0)6 22 47 28 74\nSkype : ramziabbes\nEmail: ramzi.abbes@techlimed.com\ntechlimed.com"

//raw = "prof. Habib Zaghal\nINFORMATION LINGUISTICS TECHNOLOGY"
//******************************        PRE PROCESS         ******************************//

raw = "Tel : 24608993 / 24 655 509"

/*
 "Tel : 24608993 / 24 655 509 Phone 24608993 Fax 24 655 509 Tel : 24608993/BO 24 655 509 T. 24608993 / 24 655 509",
 
 "Phone 24608993 Fax 24 655 509",
 
 "Tel : 24608993/BO 24 655 509",
 
 "Tel 24608993 - 24 655 509",
 
 "T. 24608993 / 24 655 509",
 */

var raws = [
    
    "Giorgio Subiotto\nPartner\nOgier\nD +1 345 815 1872\nT +1 345 949 9876\nM +1 345 516 9071\n89 Nexus Way\nE giorgio.subiotto@ogier.com\nComano Bay\nGrand Cayman\nRegulatory information con be found at ogier.com\nCayman Islands KY1-9009",
    
    "Insurance\nTA\nHealth\nPensions\nLife\nBRITCAY\nErica Smith\nPersonal Insurance Representative\nBRITISH CAYMANIAN INSURANCE COMPANY LIMITED\nPersonal & Business Insurance\nBritCay House, 236 Eastern Avenue, George Town, Grand Cayman\nP.O. Box 74, Grand Cayman KY1-1102, Cayman Islands\ntel. (345) 949 8699 dir. (345) 914 9866 fax. (345) 949 8411\nErica.Smith@britcay.ky www.britcay.ky\n",
    
    "Béchir BOUFADEN\nDirecteur Commercial\n(+216) 98 358 956\n(+216) 28 546 460\nctfec@ctfexpo.com\nbechir.boufaden@ctfexpo.com\nwww.ctfexpo.com\nLes Jardins d'El Menzah\n2094 El Mnihla Ariana\n(+216) 70 734 290\n(+216) 70 734 291\n",
    
    
    
    "CAYMAN ISLANDS\nHELICOPTERS\nA LIL HRS TE\nCLE SHINER\nJerome Begot\nP.O. Box 738, Grand Cayman, KYI-1103, Cayman Islands\nPhone: 345 943-4354\nCell: (345) 926-6967\nE-mail jbhelicopters@candw.ky OR cihelicopters@yahoo.com\nwww.caymanislandshelicopters.com\n",
    
    
    "DOCTEUR MIKE MARANGONE\nCHIRURGIEN-DENTISTE\nDIPLOMÉ DE LA FACULTÉ DE\nchiRuRGie DENTAIRE DE CLERmOnT-FERRAND\nTÉL. 04 50 42 63 60\nCENTRE D'AUMARD\nFAX 04 50 28 01 30 45, AV. VOLTAIRE\n01210 FERNEY-VOLTAIRE\n",
    
    
    "Jean-Vincent FERRANDI\nE.S.C. -M.BA.H.E.C.- C.PA.-I.H.E.D.N. - STANFORD E.P.\nASSET MANAGEMENT\nP.C. Box 157\n233 Conch Pointe Road\nWEST BAY\nKY1 1401 GRAND CAYMAN\nTél. - Fax 1 345 949 68 38\nCAYMAN ISLANDS, B.W.I.\nE-mail jvetd@ferrandi.org",
    
    
    
    
    
    "B Atelier Beaumarchals\nMailre Arlison Bollier 9\nCordonnier . Bottier . Maroquinier\nRéparation en Maroquinerie\n30 rue de Turbigo\nOuvert du lundi au samedi\n75003 Paris\nde 10:00 a 19:30\nTel: 01 44 93 51 15\n",
    
    
    
    "will be group\nBernard Attali\nPrésident/Conseil en investissement financier\nMembre de la CNCIF D012068\nExpert financier membre de la CNCEF\nGOUVEINANCL & VALEUES\nbernard.attali@willbegroup.com\n+33(0)7 86 76 69 74\n+33(0)1 42 33 13 33\nChargé d'enseignement\nEDHEC (Lille)\nESSEC\nPARIS 22 RUE DE LARCADE\nIAE (Aix-en-Provence)\n75008 - T. 33(0)1 42 33 13 33\nParis 2 Panthéon ASSAS\nGENEVA RUE DE LATHENEE 40\n1206 - T 41(0) 22 588 65 30\nBRUSSELS 209A, AVENUE LOUISE\n1050 - T. • 32 (0) 2 627 55 70\ngouval.com\n",
    
    
    
    
    
    "Seifeddine Khelifi\nExpert Senior\nDéveloppement des Ventes\nboredoo\nImmeuble Zenith, Les Jardins du Lac\n1053, Les Berges du Lac, Tunis, Tunisie\nM : +216 22 126 4661T : +216 36 126 466\nseifeddine.khelifi@ooredoo.tn\n",
    
    
    
    
    
    "Sup PIOR AUTO\nBODY\nAUTO REPAIR\nSHOP\nMark Demercado\n14 Sherwood Drive P.O. Box 11389 KY1-1008\nTel: 949-9570 / Fax: 946-1300. Email: sa@candw.ky\nwww.superiorautocayman.com",
    
    
    
    
    
    
    
    "Anis ADDALA\n00\nDirecteur Commercial Afrique\nHead Of Sales and Business Dev. Africa\nva\nTel Fax : +216 71 267 090/ +216 71 267 091\nMobile : +216 22 111 000 /+213 56 167 27 31\n~\nanis.addala@novatel-it.com\nwww.novatel-it.com\nNOVATEL\nIn\nFarah Lake building, Rue de la Feuille d'Erable,\nBureau B2.2, 1053 les Berges du Lac2, Tunis, Tunisie\n",
    
    
    
    "alister\nAVOCATS\nProf. Dr. Jochen BAUERREIS\nAvocat & Rechtsanwalt\nAvocat spécialise en droit des relations internationales\nDirecteur du Magistere Juristes d'Affaires Franco-Allemands\n11, rue du Parc\n67205 Strasbourg. Oberhausbergen\nTel. : +33 (0)3 68 00 14 10\nFax : +33 (0)3 68 00 14 11\njochen.bauerreis@alister-avocats.com\n",
    
    "Med Cheker Amdouni\nGraphic Designer\nPixartprinting SpA\nImmeuble Les 2 Lacs, Bloc 9,\nRue du Lac de Constance,\norinting\nLes Berges du Lac 1053,\nTunis\nmedcheker.amdouni@pixartprinting.com\n8\n",
    
    
    
    
    
    
    
    
    
    "Maiborn\nWolff\nMenrl\"t\nSadok Chekir\nDiplom Ingenieur\nIT Architect\nsadok.chekir@maibornwolff.de\nMobil +49 151 544 22 153\nMaibornWolff GmbH\nTheresienhohe 13 - 80339 Munchen\nmaibornwolff.de\n",
    
    
    
    
    "01.0\nHONDA\nCAR CITY\nCHRYSLER\n$ SUZUKI\nSALES SERVICE PARTS REPAIR\nJeep\nCiana Hedge\nMITSUBISHI\nMOTORS\nService Advisor\nMart\n10 Durham Drive\nPh: 345.949.5525 ext: 4104\nPO Box 10440\nFax: 345.949.8615\nGrand Cayman, KY1-1104,\nciana.hedge@carcitycayman.com\nCAYMAN ISLANDS\n",
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     "WILL\nr. Droit Creatif - Azan & Associes\nWilliam Azan\nAvocat Associé\n92, Avenue de Saint-Mandé - 75012 PARIS\nTel.: 33(0)1 42 56 08 20 - Port. : 06 86 86 32 50 william.azan@uwill.fr\n",
     
     
    
    
    
    
    "ILY\ne\nA\nSearch\nBRYAN, GARNIER & Co\nFrancois Arpels\nManaging Director\nBryan, Garnier & Co\nCorporate Finance\n26, avenue des Champs-Elysees\n75008 Paris\nTel\n+33 (0)1 70 36 57 43\nFax\n+33 (011 56 66 75 21\nMobile: +33 (0)6 73 12 98 64\ne-mail - farpels@bryangarnier.com\n",
    
    
    
    
    " Search\nJackie Beji\nOffice: 345-949-9838\nSales & Rental Agent\nFax: 345-949-9839\nProperty Manager\nCell: 345-925-5652\n1\nRITCH\nREALTY LTD.\nCIREBA MEMBER\nEmail: jackie@ritchrealty.ky Web: www.ritchrealty.ky\n32 Earth Close off West Bay Road, Tropic Centre II Building Suite #9\nPO Box 31223 Grand Cayman, Cayman Islands KYI-1205\n"

    ,
    
    
    
    
    
    
  
    
    "~ Inceptio\nKarim BAHI\nCoach de groupes\n& organisations\n5, Rue 7214 - EI Menzah 9 A - 1013 Tunis - Tunisie\n+ 216 21 57 85 57• E-mail : kbahi@inceptio.tn",
    
    "ELECTRIFY\nHaythem Chedid\nNETWORK\nCOO\n+33 7 58 17 16 53\n+216 25 99 66 93\nwww.electrify.network\nhaythem.chedid@electrify.network\n65 Boulevard Vaugirard, PARIS, FRANCE",
    
    
    "SERCO\nSocieté d' expertise, de revision comptable et d'organisation\nMembre de 'Ordre des Experts Comptables de Tunisie\nKais ZOUARI\nkais.zouari@serco.tn\nPartner\nSERCO Tunis\n11, rue d'irak,\nSERCO Stax\n1002 Tunis - Tunisie\nImmeuble\nEl Borj - Rue Ennacirio, B2-2\n3027 Sfax El\nJodida - Tunisie\nPhone : +216 71 84 94 47\nPhone : +216 74 40 05 24\nMob. : +216 98 32 05 66\nMob. : +216 98 32 05 66\nFox: +216 71 792 021\nFax : +216 74 40 05 23\nwww.serco.in",
    
    
    "TEAMLOG\nDEPARTEMENT MULTIMEDIA\nPASCAL ADAM\nINGENIEUR DAFFAIRES\n4, Allée Moulin Berger - 69130 Ecully\nTel. 04 72 52 25 52\nPortable 06 74 68 52 93 - Fax 04 72 52 25 50\nPascal.Adam@teamlog.fr",
    
    
    "WE\nCAPTURE\nWHAT\nMOVES\nDr Eric Angelini\nVP Global Regulatory Affairs\n& Products Safety\nMANE\nTel. direct line + 33 4 92 42 49 01\nFax + 33 4 93 42 54 25\nMobile + 33 6 82 93 81 75\n620, route de Grasse\nF-06620 Le Bar-sur-Loup\neric.angelini@mane.com\nwww.mane.com\n",
    
    
    "CAYMAN ISLANDS HELICOPTERS\nPL GENOT\nHELICOPTERE\nJerome Begot\nP.O. Box 738, Grand Cayman, KY1-1103,\nCayman Islands\nPhone: 345 943-4354\nCell: (345) 926-6967\nE-mail jbhelicopters@candw.ky OR\ncihelicopters@yahoo.com\nwww.caymanislandshelicopters.com\n",
    
    
    
    
    
    
    "DeM\nAsad Zahur\nChairman\naz@hnmglobal.co\n1603 Jumeirah Business Centre 4 ILT N cluster, PO BOX 454381 DUBAI, UAE\nTel: +9714-4304314, Fax: +9714-4304574\n",
    
    
    
    
    
    
    
    
    
    
    "nWael Mallek\nMEDLINK\nGeneral Manager of\nTunisian operations\nHealthcare\nMobile Applications\nwaelm@360medlink.com\nmobile. +216 98 70 92 14\noffice. +1 514 448 2175\nwww.360medlink.com\nMontreal - New York I Paris I Barcelona\nTunis\n",
    
    "Michel Auclair\nAssocie\nco\nauclair dupont\nCONSEIL EN ENTREPRISES\nTel: (687) 24 10 30\nGrand Theatre\nFax: (687) 24 10 45\n0 u0 SIEN attes\nmail michelaudair@auclairdupont.nc\nanATo2 ess4s Noume Cece\nwww.aucairdupont.nc\n",
    
    
    
    
    
    
    
    
    
     
    
    "Ecole d e\nManagement\nStrasbourg\nUNIVERSITE DE STRASBOURG\nWilfrid AZAN\nMattre de conferences\nen Sciences de gestion\n61 avenue de la Foret-Noire\n67085 Strasbourg Cedex\nTel. +33 (0)3 68 85 89 25\nazancunistra.i\nwww.em-strasbourg.eu\n",
    
    
    
    
    
    
    
    
    
    
    
    
    "IF\nTRADE\nENGINEERING\nMassimiliano Avogadri\nBusiness development bureau\nwww.ffengineerltd.com\nm.avogadri@ffengineerItd.com\nSkype: Massimiliano.avogadri\nF&F Engineering Ltd\n7th Floor 52-54 Gracechurch Street EC3V.OEH London (UK)\n",
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    "levio\nAFFAIRES ET TECHNOLOGIES\nJonathan Chouinard\nConseiller stratégique\n1015, Av Wilfrid-Pelletier, local 530\nChargé de projet\nQuébec (Québec) G1W 0C4\njonathan.chouinard@levio.ca\nT 418 914-3623\nwww.levio.ca\nC 418 931-8789\n",
    
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    "A\nCREDIT AGRICOLE\nNORD DE FRANCE\nBALLE-DERLY Carine\nResponsable dunite Contentleux entreprises, professionnels et agriculteurs\nDGA/CTX - CONTENTIEUX\n62000 ARRAS\nTel\n03 21 07 59 38-Fax 03 21 07.76.84\ncarna balie dedyfca nordoofrance.f\n",
    
    
    
    
     
     
      
     
     
     
    "ASSOCIAT\nBIZERTE\n2050\nBorhéne DHAOUADI\nPrésident\nFondateur\nCoworking Business Center - CBC\nAvenue de I'Environnement Zarzouna\n(+216) 23 40 41 79\n7021 - Bizerte - Tunisie\n2\nborhene@bizertesmartcity.com\ncontact@bizerte2050.com\nBizerte\nSmart City\nWe realize it\nwww.bizertesmartcity.com\n",
    
    
    
    
    
    
    
    "Med Cheker Amdouni\nGraphic Designer\nPixartprinting SpA\nImmeuble Les 2 Lacs, Bloc 9,\nRue du Lac de Constance,\norinting\nLes Berges du Lac 1053,\nTunis\nmedcheker.amdouni@pixartprinting.com\n8\n",
    
    
    /*
    
    
    "Ryosuke Nagao\nCEO\nnagao@impetus.jp\nLead Translator\nIMPETUS\nLinguistic Consultation\nImpetus Co.\n5-31-5-1004 Honkomagome,\nBunkyo-ku, Tokyo, JAPAN\n",
    
    
    
    "6 Leb:\n961 9 213 414\nLeb:\n961 3 075791\nKSA: + 966556450046\nD Beirut - Lebanon & Riyadh - KSA\nS dkiame\nwww.intech-mena.com\ndkiame@intech-mena.com\n",
    
    "LAZHAR NSIRI\nSUBSIDIARY DIRECTOR\nWYPLAY TUNISIA\nInsiri@wyplay.com\nFrench Mobile +33 6 19 43 30 48\nTunisia +216 97 07 06 42\nwwpoy\n",
    
    
    
    
    
    
    
    
    
    "réinventez votre vie\nIlyes KHEMIRI\nDirecteur Commercial\nDéco-pierre\n23 Rue Feyrouz Cite El Fawz\nEnnasr 3 - Tunis\nFb: Déco-pierre\nTel.: 29 403 488\nE-mail:decopierre2013@gmail.com\n21 031 700\n",
    
    
    "62A\nAdel Ghouma\nMENA Manager\n+48 791 046 584\nG2A.com\naghouma@g2a.com\nG2A.co\n",
    
    
   
    
    
    
    
    
    
    
    
    
    
    "Crea\nCUISINE\n...et vos envies prennent vie\nHichem HARBAOUI\nGérant\nN'1 Rue Bechir Bachrouch, Khaznadar 2017\n-\n(+2161 71 515 470\n(+216) 23 559 990\nhichem.harbaoui@live.fr fl Créa Cuisine\n11216 52 490 435\n",
    
    
    "Ahmed Ayed\nConsultant\nProfessional Services\naxefinance\n+216 71 963 229\nFocus • Expertise • Value\nE ahmed.ayed@axefinance.com\n",
    
    
    
    
    
    
    "Techlimed\nINFORMATION LINGUISTICS TECHNOLOGY\nRamzi ABBES\nPresident & C.E.O.\n42, rue de 1'Université - 69007 Lyon France\nPhone : +33 (0)4 78 58 32 35\nMobile : +33 (0)6 22 47 28 74\nSkype : ramziabbes\nEmail: ramzi.abbes@techlimed.com\ntechlimed.com\n",
    
    
    
    "N\nSage\nIntégrateur\nNOVASOFT\nde Solutions\nElyes TALMOUDI\nGérant\nPortable: 20 279 500\nTél.: +(216) 71 860 636\nFax: +(216) 71 862 627\nAdresse: Bur B1,\nRésidence El Mouna\nRue du lac Malaren, les berges du lac, Tunis\nE-mail: elytal.bmda@topnet.tn\n",
    
    
    
    
    
    
      
       
       
       "JOE CHAHOUD\nGENERAL MANAGER/CTO\nmobile:\n+961 70 294 835\nSkype ID: joechahoud\nemail:\njchahoud@intech-mena.com\nTel/Fax:\n+961 213 414\nWebiste:\nwww.intech-mena.com\n",
       
       "Edouard ALCAY\nAOCPATRIMOINE\n3, reu aubourg (faint Whore\no14‡43017\nz5008 ..\n#7. 133 trepho-tons\n.Mas.\n88\ne-mail: ealray2aocpatrimoine.com\n","Alexanommo.png\nFRANKLIN\nLAW FIRM\nStéphanie Alexandrino\nMember of the Bars of Paris\nand Luxembourg\n26, avenue Kléber 75116 Paris\nTel.: +33 (0)1 45 02 79 09\nFax: +33 (0)1 45 02 79 01\nwww.franklin-paris.com-salexandrino@n-pr.\n",
       
       
      
       
       "Pries\nGrégory Antoine\nConsultants Network\n+33 6 07 39 37 12 - contact@1001pommes.com\n",
       
       
       
       
       
       
       
       
       "start inoost\nKevin Aserraf\nAnalyste\nkevin@startinpost.com\nTél. : +33 1011 70 60 90 36\nMob. +33 (0)6 66 85 89 26\nwww.startinpost.com\nTOUR CRISTAL\n11 QUAI ANDRE CITROEN- 75015 PARIS\n",
       
       
       
       */
       
       
 
 
    
]

/*
 raws = [
 
 "Edouard ALCAY\nAOCPATRIMOINE\n3, reu aubourg (faint Whore\no14‡43017\nz5008 ..\n#7. 133 trepho-tons\n.Mas.\n88\ne-mail: ealray2aocpatrimoine.com\n","Alexanommo.png\nFRANKLIN\nLAW FIRM\nStéphanie Alexandrino\nMember of the Bars of Paris\nand Luxembourg\n26, avenue Kléber 75116 Paris\nTel.: +33 (0]1 45 02 79 09\nFax: +33 (0]1 45 02 79 01\nwww.franklin-paris.com-salexandrino@n-pr.\n",
 
 
 "WE\nCAPTURE\nWHAT\nMOVES\nDr Eric Angelini\nVP Global Regulatory Affairs\n& Products Safety\nMANE\nTel. direct line + 33 4 92 42 49 01\nFax + 33 4 93 42 54 25\nMobile + 33 6 82 93 81 75\n620, route de Grasse\nF-06620 Le Bar-sur-Loup\neric.angelini@mane.com\nwww.mane.com\n","ILY\ne\nA\nSearch\nBRYAN, GARNIER & Co\nFrancois Arpels\nManaging Director\nBryan, Garnier & Co\nCorporate Finance\n26, avenue des Champs-Elysees\n75008 Paris\nTel\n+33 (0)1 70 36 57 43\nFax\n+33 (011 56 66 75 21\nMobile: +33 (0)6 73 12 98 64\ne-mail - farpels@bryangarnier.com\n","DeM\nAsad Zahur\nChairman\naz@hnmglobal.co\n1603 Jumeirah Business Centre 4 ILT N cluster, PO BOX 454381 DUBAI, UAE\nTel: +9714-4304314, Fax: +9714-4304574\n","Michel Auclair\nAssocie\nco\nauclair dupont\nCONSEIL EN ENTREPRISES\nTel: (687) 24 10 30\nGrand Theatre\nFax: (687) 24 10 45\n0 u0 SIEN attes\nmail michelaudair@auclairdupont.nc\nanATo2 ess4s Noume Cece\nwww.aucairdupont.nc\n",
 
 
 "WILL\nr. Droit Creatif - Azan & Associes\nWilliam Azan\nAvocat Associé\n92, Avenue de Saint-Mandé - 75012 PARIS\nTel.: 33(0)1 42 56 08 20 - Port. : 06 86 86 32 50 william.azan@uwill.fr\n","A\nCREDIT AGRICOLE\nNORD DE FRANCE\nBALLE-DERLY Carine\nResponsable dunite Contentleux entreprises, professionnels et agriculteurs\nDGA/CTX - CONTENTIEUX\n62000 ARRAS\nTel\n03 21 07 59 38-Fax 03 21 07.76.84\ncarna balie dedyfca nordoofrance.f\n","B Atelier Beaumarchals\nMailre Arlison Bollier 9\nCordonnier . Bottier . Maroquinier\nRéparation en Maroquinerie\n30 rue de Turbigo\nOuvert du lundi au samedi\n75003 Paris\nde 10:00 a 19:30\nTel: 01 44 93 51 15\n","will be group\nBernard Attali\nPrésident/Conseil en investissement financier\nMembre de la CNCIF D012068\nExpert financier membre de la CNCEF\nGOUVEINANCL & VALEUES\nbernard.attali@willbegroup.com\n+33(0)7 86 76 69 74\n+33(0)1 42 33 13 33\nChargé d'enseignement\nEDHEC (Lille)\nESSEC\nPARIS 22 RUE DE LARCADE\nIAE (Aix-en-Provence)\n75008 - T. 33(0)1 42 33 13 33\nParis 2 Panthéon ASSAS\nGENEVA RUE DE LATHENEE 40\n1206 - T 41(0) 22 588 65 30\nBRUSSELS 209A, AVENUE LOUISE\n1050 - T. • 32 (0) 2 627 55 70\ngouval.com\n","Pries\nGrégory Antoine\nConsultants Network\n+33 6 07 39 37 12 - contact@1001pommes.com\n","CAYMAN ISLANDS HELICOPTERS\nPL GENOT\nHELICOPTERE\nJerome Begot\nP.O. Box 738, Grand Cayman, KYI-1103,\nCayman Islands\nPhone: 345 943-4354\nCell: (345) 926-6967\nE-mail jbhelicopters@candw.ky OR\ncihelicopters@yahoo.com\nwww.caymanislandshelicopters.com\n",
 "alister\nAVOCATS\nProf. Dr. Jochen BAUERREIS\nAvocat & Rechtsanwalt\nAvocat spécialise en droit des relations internationales\nDirecteur du Magistere Juristes d'Affaires Franco-Allemands\n11, rue du Parc\n67205 Strasbourg. Oberhausbergen\nTel. : +33 (0)3 68 00 14 10\nFax : +33 (0)3 68 00 14 11\njochen.bauerreis@alister-avocats.com\n","IF\nTRADE\nENGINEERING\nMassimiliano Avogadri\nBusiness development bureau\nwww.ffengineerltd.com\nm.avogadri@ffengineerItd.com\nSkype: Massimiliano.avogadri\nF&F Engineering Ltd\n7th Floor 52-54 Gracechurch Street EC3V.OEH London (UK)\n","start inoost\nKevin Aserraf\nAnalyste\nkevin@startinpost.com\nTél. : +33 1011 70 60 90 36\nMob. +33 (0]6 66 85 89 26\nwww.startinpost.com\nTOUR CRISTAL\n11 QUAI ANDRE CITROEN- 75015 PARIS\n","TEAMLOG\nDEPARTEMENT MULTIMEDIA\nPASCAL ADAM\nINGENIEUR DAFFAIRES\n4, Allée Moulin Berger - 69130 Ecully\nTel. 04 72 52 25 52\nPortable 06 74 68 52 93 - Fax 04 72 52 25 50\nPascal.Adam@teamlog.fr",
 
 
 "Ecole d e\nManagement\nStrasbourg\nUNIVERSITE DE STRASBOURG\nWilfrid AZAN\nMattre de conferences\nen Sciences de gestion\n61 avenue de la Foret-Noire\n67085 Strasbourg Cedex\nTel. -33 (013 68 85 89 25\nazancunistra.i\nwww.em-strasbourg.eu\n",
 
 
 ]
 
 */



//var bcDataArray = raw.split(separator: "\n")

//testPrint(tag: "RAW", title: "Separatop,", content: bcDataArray)

//var namedEntityHolder : [EntityType : NamedEntity] = [:]

//var prefixedEntities : [PrefixHolder] = []

RecognitionTools.loadTitles(completion: {
    success in
    if success {
        raws.forEach { (raw) in
            var bcDataArray = raw.split(separator: "\n").map {String($0).stripped }
            bcDataArray = bcDataArray.filter({ !$0.isEmpty })
            var namedEntityHolder : [NamedEntity] = []
            var prefixedEntities : [PrefixHolder] = []
            
            var extracted : [Int] = []
            var mutableRaw = raw
            //var namedEntityResult : [NamedEntity] = []
            
            
            // remove special remable chars

//            testPrint(tag: "BC DATA BEFORE", title: " :: ", content: bcDataArray)
//
//            testPrint(tag: "", title: "OPERATION BEGIN", content: "")

            // TODO : MAKE SURE YOU SPLIT PREFIXES FROM VALUES , FOR BVETTER RESULT
            RecognitionTools.preProcessRaw(raw: &mutableRaw , prefixedEntities : &prefixedEntities , bcDataArray: &bcDataArray, remove : true)

//            testPrint(tag: "preProcessRaw", title: "RESULT", content: prefixedEntities)
//
//            testPrint(tag: "BC DATA AFTER", title: " :: ", content: bcDataArray)

            extractEmails(raw : &mutableRaw, bcDataArray: bcDataArray, namedEntityHolder : &namedEntityHolder, prefixedEntities: prefixedEntities)
            extractWebsite(raw : &mutableRaw, bcDataArray: bcDataArray, namedEntityHolder : &namedEntityHolder, prefixedEntities: prefixedEntities)

            // we need this process remove without position bcz sometime email line and website , can contain otehr data
            //RecognitionTools.preProcessRemoveExtracted(bcDataArray : &bcDataArray, namedEntityHolder : namedEntityHolder)
//            RecognitionTools.preProcessRemoveExtractedWithPosition(bcDataArray : &bcDataArray, namedEntityHolder : namedEntityHolder)

            // make it third

            // TODO : DONE - MAKE SURE YOU SPLIT PREFIXES FROM VALUES , FOR BVETTER RESULT
            // TODO : MAYBBEE REMOVE PHONES FROM DATA ARRAY
            extractPhones(bcDataArray : bcDataArray , namedEntityHolder : &namedEntityHolder, prefixedEntities : prefixedEntities)


            // lets preprocess data before continue
            //RecognitionTools.preProcessRemoveExtracted(bcDataArray : &bcDataArray, namedEntityHolder : namedEntityHolder)
            
            RecognitionTools.preProcessRemoveExtractedWithPosition(bcDataArray : &bcDataArray, namedEntityHolder : namedEntityHolder)

//            testPrint(tag: "BC DATA AFTER", title: " :: ", content: bcDataArray)
            extractFullName(bcDataArray : bcDataArray , namedEntityHolder : &namedEntityHolder, prefixedEntities : prefixedEntities)

            RecognitionTools.preProcessRemoveExtractedWithPosition(bcDataArray : &bcDataArray, namedEntityHolder : namedEntityHolder)
//            RecognitionTools.preProcessRemoveExtracted(bcDataArray : &bcDataArray, namedEntityHolder : namedEntityHolder)
            
            extractTitles(bcDataArray : bcDataArray , namedEntityHolder : &namedEntityHolder, prefixedEntities : prefixedEntities)
            
            extractCompany(bcDataArray : bcDataArray , namedEntityHolder : &namedEntityHolder, prefixedEntities : prefixedEntities)

            

            
//            RecognitionTools.preProcessRemoveExtracted(bcDataArray : &bcDataArray, namedEntityHolder : namedEntityHolder, forceRemove : true)
            RecognitionTools.preProcessRemoveExtractedWithPosition(bcDataArray : &bcDataArray, namedEntityHolder : namedEntityHolder)

            


            //RecognitionTools.preProcessRemoveExtracted(bcDataArray : &bcDataArray, namedEntityHolder : namedEntityHolder, forceRemove : true)
//            ///////////////////////////////// @ ZONE
//            // THIS IS MOVED HERE , BECASE WE NEED TO WORK ON ENTIRE BCDATA ARRAY
            
            
            RecognitionTools.removePrefixOccurence(bcDataArray: &bcDataArray)
            testPrint(tag: "BC DATA TO PROCESS ADDRESS", title: " REMOVED EXTRACT ", content: bcDataArray)
            
            
            
            
            var addressNamedEntity : AddressNamedEntity = AddressNamedEntity(value: "")

            // we have NamedEntityHolder which contains , Validated PHONES , so lets extract Country in those phones and put dem in add

            addressNamedEntity.extractZipCode(bcDataArray: &bcDataArray, namedEntityHolder: &namedEntityHolder, prefixes: prefixedEntities)

            let dispatchGroup = DispatchGroup()
            dispatchGroup.enter()
            addressNamedEntity.extractCityORNDState(bcDataArray : &bcDataArray , completion: {success in
                //print("City & states extraction done")
                dispatchGroup.leave()
            })
            
            
            testPrint(tag: "AFTER ZIP CITY STATE EXTRACTION", title: " REMOVED EXTRACT ", content: bcDataArray)
//
//            // now lets compute @
//
//
            addressNamedEntity.computeAddress(bcDataArray : &bcDataArray , namedEntityHolder : &namedEntityHolder, prefixes : prefixedEntities)
            
            
            
            // PLEASE DONT FORGET TO POST PROCESS
            addressNamedEntity.postProcessYourSelf()

            _ = dispatchGroup.wait()
            dispatchGroup.notify(queue: .main){
                print ("MAIN : Every tink done will not return")
            }

            print("<HZHHZ")
            print("STATE ; \(addressNamedEntity.state)")
            print("CITY : \(addressNamedEntity.city)")
            print("STREET : \(addressNamedEntity.street)")
            print("SECONDADD @ : \(addressNamedEntity.adress_second)")
            print("ZIP  = \(addressNamedEntity.zip)")
            print("COUNTRY COED : \(addressNamedEntity.country_code)")
            print("COUNTRY :  \(addressNamedEntity.country)")
            print("POBOX :  \(addressNamedEntity.pobox)")

            


            /////////////////////////////// END @ ZONZ
            testPrint(tag: "BEFORE RESULT PROCESS", title: "CLEANING", content: "")
            namedEntityHolder.forEach { (named) in
                print("Extracted \(named.type) : \(named.value)  - \(named.score)")
            }


            RecognitionTools.postProcessResult (bcDataArray : &bcDataArray, namedEntityHolder : &namedEntityHolder)


            testPrint(tag: "AFTER RESULT PROCESS", title: "CLEANING", content: "")
            namedEntityHolder.forEach { (named) in
                print("Extracted \(named.type) : \(named.value)  - \(named.score)")
            }
            
            
            testPrint(tag: "", title: "OPERATION END", content: "")
        }
        
        
        
        
        
        
        exit(EXIT_SUCCESS)
    }
})

RunLoop.main.run()


func extractWebsite(raw : inout String, bcDataArray : [String] , namedEntityHolder : inout [NamedEntity], prefixedEntities : [PrefixHolder]) -> Void {
    var computeResultHolder : [NamedEntity] = []
    bcDataArray.enumerated().forEach { (index) in
        let namedEntity = NamedEntity(value: index.element, type: .website, position: index.offset)
        computeResultHolder.append(contentsOf: namedEntity.computeWebsite(namedEntityHolder: namedEntityHolder, prefixes : prefixedEntities))
    }
    
    
    
    namedEntityHolder.append(contentsOf: computeResultHolder)
    // TODO : Preprocessing will use email if website not found with this OR NO NEED , bcz our regex is baddass that extract from email by his own
}


func extractEmails(raw : inout String, bcDataArray : [String] , namedEntityHolder : inout [NamedEntity], prefixedEntities : [PrefixHolder]) -> Void {
    var computeResultHolder : [NamedEntity] = []
    bcDataArray.enumerated().forEach { (index) in
        let namedEntity = NamedEntity(value: index.element, type: .email, position: index.offset)
        computeResultHolder.append(contentsOf: namedEntity.computeEmails(namedEntityHolder: namedEntityHolder, prefixes : prefixedEntities))
    }
    
    namedEntityHolder.append(contentsOf: computeResultHolder)
}


func extractPhones( bcDataArray : [String] , namedEntityHolder : inout [NamedEntity], prefixedEntities : [PrefixHolder] ) -> Void {
    var computeResultHolder : [NamedEntity] = []
    
    // lets instantiate from here so we can depass  memory usage problem
    let phoneNumberKit = PhoneNumberKit { () -> Data? in
        return try? PhoneNumberKit.defaultMetadataCallback()
    }
    
    
    for (index,entity) in bcDataArray.enumerated() {
        let namedEntity = NamedEntity(value: entity.description, type: .phone, position: index)
        
        computeResultHolder.append(contentsOf: namedEntity.computePhoneNumber(namedEntityHolder: namedEntityHolder, prefixes : prefixedEntities, phoneNumberKit: phoneNumberKit))
    }
    
    
    //    bcDataArray.forEach { (entity) in
    //        let namedEntity = NamedEntity(value: entity.description)
    //
    //        computeResultHolder.append(contentsOf: namedEntity.computePhoneNumber(namedEntityHolder: namedEntityHolder, prefixes : prefixedEntities, phoneNumberKit: phoneNumberKit))
    //    }
    
    let phoneExtracted = prefixedEntities.filter({ (prefixOfTypePhone) -> Bool in
        return prefixOfTypePhone.type == .phone && prefixOfTypePhone.value.preprocess.isPhoneNumber
    })
    
    if computeResultHolder.count < phoneExtracted.count  {
        computeResultHolder.append(contentsOf: phoneExtracted.map({NamedEntity(value: $0.value, type: $0.type )}))
    }
    
    computeResultHolder.forEach { (named) in
        print("Extracted PHONES \(named.value)  -- : \(named.score)    -- : \(named.type)  --  AT POSITION : \(named.position)")
    }
    
    
    // this needs review .phone , .mobile,... BECAUSE IT CONTAINS SCORE
    postProcessResult(type: .phone , result: computeResultHolder , namedEntityHolder: &namedEntityHolder)
    //testPrint(tag : "Result", title : "", content : namedEntityHolder[.fullname]?.value)
    //testPrint(tag : "Result", title : "", content : namedEntityHolder[.fullname]?.score)
}

func extractFullName( bcDataArray : [String] , namedEntityHolder : inout [ NamedEntity], prefixedEntities : [PrefixHolder]) -> Void {
    
    var computeResultHolder : [NamedEntity] = []
    
    for (index,entity) in bcDataArray.enumerated() {
        let namedEntity = NamedEntity(value: entity.description , type: .fullname, position: index)
        computeResultHolder.append(namedEntity.computeFullName(namedEntityHolder: namedEntityHolder, countDataArray: bcDataArray.count))
    }
    
    
    postProcessResult(type: .fullname , result: computeResultHolder , namedEntityHolder: &namedEntityHolder)
    
    computeResultHolder.forEach { (named) in
        print("Extracted \(named.value)  --   : \(named.score)    --   : \(named.type)  -- AT POSITION : \(named.position) ")
    }
    // TODO : POST PROCESS Result,  * remove found fields from raw values etc..
}

func extractTitles( bcDataArray : [String] , namedEntityHolder : inout [NamedEntity], prefixedEntities : [PrefixHolder]) -> Void {
    var computeResultHolder : [NamedEntity] = []
    
    
    for (index,line) in bcDataArray.enumerated() {
        let namedEntity = NamedEntity(value: line.description, type: .title, position: index)
        computeResultHolder.append(namedEntity.computeTitle(namedEntityHolder: namedEntityHolder))
    }
    
    
    //    bcDataArray.forEach { (entity) in
    //        let namedEntity = NamedEntity(value: entity.description , type: .title)
    //        computeResultHolder.append(namedEntity.computeTitle(namedEntityHolder: namedEntityHolder))
    //    }
    
    computeResultHolder.forEach { (item) in
        print("TITLE Value : \(item.value)  -- Score : \(item.score)  -- AT POSTION \(item.position)")
    }
    
    postProcessResult(type: .title , result: computeResultHolder, namedEntityHolder: &namedEntityHolder)
    
}

func extractCompany( bcDataArray : [String] , namedEntityHolder : inout [NamedEntity], prefixedEntities : [PrefixHolder]) -> Void {
    
    var computeResultHolder : [NamedEntity] = []
    bcDataArray.enumerated().forEach { (entity) in
        let namedEntity = NamedEntity(value: entity.element.description, type: .company, position: entity.offset )
        computeResultHolder.append(namedEntity.computeCompany(namedEntityHolder: namedEntityHolder, countDataArray: bcDataArray.count))
    }
    
    
    if computeResultHolder.filter({ (namedEntityCompany) -> Bool in
        namedEntityCompany.score > 35
    }).count < 1 {
        // considered LoW
        // IF SCORE IS CONSIDERED LOW - / 30 , then maybe process email and website to get something from them
        let namedEntity = NamedEntity(value: "" , type: .company)
        computeResultHolder.append(contentsOf: namedEntity.computeCompanyFromWebsiteOrEmail(namedEntityHolder: namedEntityHolder))
    }
    
    computeResultHolder.forEach { (item) in
        print("COMPANY Value : \(item.value)  -- Score : \(item.score)")
    }
    
    // TODO : POST PROCESS Result,  * remove found fields from raw values etc..
    postProcessResult(type: .company , result: computeResultHolder, namedEntityHolder: &namedEntityHolder)
}

func postProcessResult(type : EntityType, result : [NamedEntity], namedEntityHolder : inout [NamedEntity]) {
    
    
    //namedEntityHolder[type] = result.sorted(by: {$0.score > $1.score }).first
    
    switch type {
        
    case .title : do {
        // process titles with score SUPP TO : 50
        result
            .sorted(by: {$0.score > $1.score })
            .filter({$0.score > 50})
            .forEach { (proposedTitle) in
                if let firstTitle = namedEntityHolder.filter({$0.type == .title}).first { // contains(where: {$0.type == .title}) {
                    // we already have a title
                    // check position
                    if abs( firstTitle.position - proposedTitle.position ) == 1 {
                        namedEntityHolder.append(NamedEntity(value: proposedTitle.value, type: .title2, position: proposedTitle.position))
                    }
                }else{
                    // we put it in title 2
                    namedEntityHolder.append(NamedEntity(value: proposedTitle.value, type: .title, position: proposedTitle.position))
                }
        }
        
        
        // TODO Fix minimal score
        if !namedEntityHolder.contains(where: { (namedEntity) -> Bool in
            namedEntity.type == .title
        }) {
            // NO TITLE SORTED
            
            let sortedTitle = result
                .sorted(by: {$0.score > $1.score })
                .filter({$0.score > -10})
                .first
            
            namedEntityHolder.append(NamedEntity(value: sortedTitle?.value ?? "", type: .title))
        }
        
        
        
        }
        
    case .phone : do {
        namedEntityHolder.append(contentsOf: result)
        }
    default:
        namedEntityHolder.append(result.sorted(by: { $0.score > $1.score && $0.score > 0 }).first ?? NamedEntity(value: ""))
        break
    }
    
    //    if type != .phone {
    //        namedEntityHolder.append(result.sorted(by: {$0.score > $1.score }).first ?? NamedEntity(value: ""))
    //    }else{
    //        // IS PHONE :
    //
    //        namedEntityHolder.append(contentsOf: result)
    //    }
    
    
    //    let phoneCharsSepartors = [
    //        "/",
    //        "\\"
    //    ]
    
    
    
}

func extractAdress(bcDataArray : inout [String] , namedEntityHolder : inout [NamedEntity], prefixedEntities : [PrefixHolder]) -> Void {
    var computeResultHolder : [NamedEntity] = []
    
    //RecognitionTools.detectFullAddress(dataArray: &bcDataArray, addressEntityHolder: &<#AddressNamedEntity#>)
    
    computeResultHolder.forEach { (item) in
        print("Address Value : \(item.value)  -- Score : \(item.score)")
    }
    
    // TODO : POST PROCESS Result,  * remove found fields from raw values etc..
    postProcessResult(type: .company , result: computeResultHolder, namedEntityHolder: &namedEntityHolder)
}

//******************************       PROCESS         ******************************//


enum PrefixType {
    case safe
    case unsafe
}

struct PrefixHolder {
    var key : String
    var value : String
    var type : EntityType = .unknown
}

func testPrint<T>(tag : String, title : String, content : T){
    //print("------------------------ \(tag) - \(title) ---------------------------\n")
    
    print("\n\(tag) - \(title)  : > \(content) \n")
    
    //print("\n------------------------ END \(title) --------------------------- \n\n")
}




struct CountryZip {
    let countryPrefix : String
    let zipREX : String
}
struct CountryPhonePrefix {
    let countryPrefix : String
    let phonePrefix : String
    let countryName : String
    let zipREX : String?
}

class CountriesWithCities : Codable{
    var id : Int
    var name : String
    var country_prefix : String
    
    init (id : Int, name : String, country_prefix : String){
        self.id = id
        self.name = name
        self.country_prefix = country_prefix
    }
}



/// State
struct StatesWithPrefixSuccess : Codable {
    let success : StatesWithPrefix
}
struct StatesWithPrefix : Codable{
    let statusCode : Int
    let message : String
    let data : [CountriesWithCities]
}

///Phone prefixes
struct PhonePrefixSuccess : Codable {
    let success : PhonePrefix
}
struct PhonePrefix : Codable{
    let statusCode : Int
    let message : String
    let data : [PhonePrefixes]
}

struct PhonePrefixes : Codable {
    let id : Int
    let key : String
    let value : String
    let type : String
}


struct CitiesWithPrefixSuccess : Codable {
    let success : CitiesWithPrefix
}
struct CitiesWithPrefix : Codable{
    let statusCode : Int
    let message : String
    let data : [CountriesWithCities]
}

struct CountriesSuccess : Decodable {
    let success : CountriesResponse
}
struct CountriesResponse : Decodable {
    let statusCode : Int
    let message : String
    let data : [Countries]
}
struct Countries : Decodable {
    let id : Int
    let name : String
    let country_prefix : String
    let phone_prefix : String
    let zip_regular_expression : String?
    
}
struct titlesPMSuccess : Codable {
    let success : titlesPMResponse
}
struct titlesPMResponse : Codable {
    let statusCode : Int
    let message : String
    let data : [titlesPM]
}
struct titlesPM : Codable {
    let id : Int
    let title_name : String
    let createdAt : String
    
    init() {
        id = 0
        title_name = ""
        createdAt = ""
    }
}
