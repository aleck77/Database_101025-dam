USE 101025_DAM_OO;
/*
CREATE TABLE mytable(
   FIELD1        INTEGER  NOT NULL PRIMARY KEY 
  ,children      INTEGER  NOT NULL
  ,days_employed INTEGER 
  ,age           INTEGER  NOT NULL
  ,gender        VARCHAR(1) NOT NULL
  ,education     VARCHAR(9) NOT NULL
);
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (0,1,8437.673027760233,42,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (1,1,4024.803753850451,36,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (2,0,5623.422610230956,33,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (3,3,4124.747206540018,32,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (4,0,340266.07204682194,53,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (5,0,926.1858308789184,27,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (6,0,2879.202052139952,43,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (7,0,152.7795691752705,50,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (8,2,6929.865298973741,35,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (9,0,2188.7564450779378,41,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (10,2,4171.483646903305,36,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (11,0,792.7018870609315,14,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (12,0,NULL,65,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (13,0,1846.6419410560736,54,'F','ananas');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (14,0,1844.9561821875543,56,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (15,1,972.3644189900732,26,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (16,0,1719.9342261530542,35,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (17,0,2369.999720209008,33,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (18,0,400281.1369125588,53,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (19,0,10038.818548915877,48,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (20,1,1311.6041664289485,36,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (21,1,253.68516578402495,33,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (22,1,1766.6441376815046,24,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (23,0,272.9813850334044,21,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (24,1,338551.95291136915,57,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (25,0,363548.4893483957,67,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (26,0,NULL,41,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (27,0,529.1916346594236,28,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (28,1,717.2743239418727,26,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (29,0,NULL,63,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (30,1,335581.6685149753,62,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (31,0,1682.08343808475,47,'F','primary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (32,0,4649.910831728614,34,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (33,0,1548.63754364046,48,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (34,0,4488.067031277062,35,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (35,0,394021.0721837952,68,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (36,0,176.21668833712155,33,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (37,0,6448.810859676204,43,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (38,0,597.8818273051091,25,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (39,0,650.5877964026586,31,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (40,0,1030.3626056014652,30,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (41,0,NULL,50,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (42,0,1257.4961901986044,20,'F','ananas');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (43,0,4375.681384360526,43,'F','ananas');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (44,1,1362.0417275002387,26,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (45,1,1039.4517405766287,49,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (46,2,2262.712303593806,37,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (47,1,2689.1372742032745,33,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (48,0,3341.0678863600638,45,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (49,0,1181.443228272809,54,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (50,0,353731.4323382981,63,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (51,1,6953.631654563154,50,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (52,1,3554.6715257531628,28,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (53,0,4219.88338560805,61,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (54,0,3480.072792773725,27,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (55,0,NULL,54,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (56,0,370145.0872371805,64,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (57,0,2424.809748937992,44,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (58,0,335.31863038428764,36,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (59,0,4341.7867754100425,53,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (60,1,2534.462390327333,48,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (61,0,2986.20212028634,42,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (62,0,7845.6492334208915,48,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (63,0,1182.5477437277514,45,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (64,0,118.89141142450092,35,'M','ananas');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (65,0,NULL,21,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (66,0,916.4288292557608,28,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (67,0,NULL,52,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (68,2,2152.475526346754,46,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (69,0,779.2284491479346,23,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (70,1,2802.2266713967297,28,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (71,0,338113.5298924872,62,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (72,1,NULL,32,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (73,0,1631.9394026219366,14,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (74,1,5110.54370925475,45,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (75,1,2953.151947577933,38,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (76,1,2252.1927219941026,44,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (77,0,726.9437706256638,43,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (78,0,359722.94507371227,61,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (79,0,3278.296751179717,27,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (80,0,127.33494240597255,25,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (81,0,204.6731655316556,33,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (82,2,NULL,50,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (83,0,NULL,52,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (84,0,7125.21502761462,53,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (85,0,275.99384748839213,30,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (86,0,383933.5496643384,64,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (87,0,337659.5350035947,53,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (88,0,373129.7896543124,63,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (89,0,72.62578520446468,42,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (90,2,NULL,35,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (91,2,5010.9974361252725,39,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (92,1,1669.2796814947967,14,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (93,1,1446.6225418245374,32,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (94,1,NULL,34,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (95,0,541.8322411633181,51,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (96,0,NULL,44,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (97,0,NULL,47,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (98,0,364906.2057355492,54,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (99,0,346541.6188949218,0,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (100,0,605.0264409707586,49,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (101,0,391558.9618490568,65,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (102,0,1377.4472350796152,51,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (103,1,888.2833470851367,39,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (104,0,366323.6494289441,59,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (105,0,2098.6262962257147,62,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (106,1,300.64259328925505,29,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (107,0,1493.4491168729676,24,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (108,2,753.4670420858772,33,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (109,0,2147.472607702785,59,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (110,0,413.9826020927449,41,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (111,0,12930.541677797675,61,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (112,1,1841.3580944791947,28,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (113,0,6083.9947296293385,52,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (114,0,1599.8791614370475,26,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (115,1,2523.847898226973,38,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (116,1,540.0384252136863,50,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (117,0,3817.113294534001,41,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (118,2,2774.655137092032,33,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (119,0,382189.12905557256,60,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (120,0,NULL,46,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (121,0,NULL,29,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (122,0,171.1624207214407,55,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (123,2,5718.70890108714,39,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (124,0,1080.514782425162,38,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (125,0,191.1467457844417,64,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (126,1,2471.5485518184228,49,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (127,0,5229.55206892918,43,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (128,0,379035.9206190428,67,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (129,0,361010.32134996407,61,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (130,0,897.3228055367267,42,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (131,0,639.5647075616622,58,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (132,1,1306.4284560155902,45,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (133,0,344507.39278483123,64,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (134,1,4171.107677064886,46,'F','ananas');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (135,0,NULL,27,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (136,0,357880.1593788016,60,'M','primary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (137,1,1910.0375923185568,28,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (138,0,2572.053172717263,43,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (139,0,1765.5573866944574,29,'M','ananas');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (140,0,3017.782065456124,24,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (141,0,NULL,39,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (142,0,347947.8355073804,54,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (143,0,1893.2998286398856,48,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (144,1,2105.382664335544,45,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (145,0,NULL,62,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (146,0,1302.0260419746796,46,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (147,0,5772.479895574409,47,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (148,0,5050.292839852283,37,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (149,0,2664.273168317157,0,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (150,0,393711.519922678,71,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (151,0,896.462371368615,37,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (152,1,3597.776387865821,39,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (153,1,132.74853603066168,20,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (154,1,1803.9306052678608,41,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (155,0,1208.5961786776136,14,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (156,0,362366.8571652186,65,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (157,0,348414.02800940943,38,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (158,0,11001.589092067064,56,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (159,0,371052.6968127112,59,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (160,0,2063.2234729922893,45,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (161,1,1147.591637441718,39,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (162,0,3755.843042173655,62,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (163,0,7473.902957321618,50,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (164,2,2357.523213608679,27,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (165,2,1268.8706856224185,32,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (166,0,450.0613423824006,38,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (167,0,7219.276087439847,56,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (168,0,361970.2205052443,67,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (169,0,372110.89295327937,58,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (170,0,182.2267232528777,28,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (171,0,9566.241471478188,60,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (172,0,4652.167869366604,49,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (173,0,9099.945304784307,49,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (174,0,NULL,55,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (175,2,1734.7410117276208,38,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (176,0,364178.2549302824,60,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (177,2,2109.314690632105,48,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (178,0,395728.36139811255,59,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (179,0,1177.0553834454738,43,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (180,0,60.6373275553343,37,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (181,0,NULL,26,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (182,1,8164.333209415941,49,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (183,1,166.26503703628762,35,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (184,0,369682.2227151696,57,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (185,0,5026.2294602728525,32,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (186,0,225.1236894800484,34,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (187,0,876.8431101663022,46,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (188,0,99.19594695041458,48,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (189,1,NULL,30,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (190,0,335.5229563354112,26,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (191,0,336562.0164318586,60,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (192,0,2573.1367803783523,47,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (193,0,386330.8511360464,60,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (194,0,98.31216168444011,24,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (195,0,117.12788647939188,51,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (196,0,1589.7814009573162,37,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (197,0,12136.131380846336,59,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (198,0,1403.0808299019186,52,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (199,1,223.5470176888244,23,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (200,0,5532.372185033889,41,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (201,0,6542.460790155981,39,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (202,1,1575.3235775718508,38,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (203,0,2829.665755236844,56,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (204,0,334637.4644627627,61,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (205,1,NULL,31,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (206,0,363924.8816676821,54,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (207,0,1352.3179068855802,37,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (208,0,749.1756772991432,22,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (209,2,271.5705315052388,38,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (210,2,342167.21211236675,55,'F','primary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (211,0,577.2734342991156,41,'F','primary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (212,0,5863.259029756954,48,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (213,1,703.2435102199611,38,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (214,2,1321.0792231329488,41,'F','ananas');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (215,0,79.88034967664467,42,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (216,0,356.1311943614808,22,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (217,0,384569.9216399707,54,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (218,1,2924.5983864777645,34,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (219,0,597.2734021772915,21,'F','ananas');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (220,1,NULL,23,'F','ananas');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (221,0,383772.1713231299,65,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (222,0,145.541617523979,32,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (223,0,337679.3582702238,61,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (224,2,1024.9491604702278,41,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (225,0,434.9313375154888,52,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (226,1,2066.908426077889,30,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (227,1,1588.8316419325315,64,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (228,0,339193.0942916696,60,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (229,0,336747.83528374555,73,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (230,1,2049.211575996865,28,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (231,1,144.18585382423603,41,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (232,0,3803.807419355826,49,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (233,1,1475.697490068114,50,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (234,0,5865.31500734791,52,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (235,0,1031.9076040874072,50,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (236,0,395825.13252984686,59,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (237,2,2585.402858170127,37,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (238,0,708.0735831904608,44,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (239,0,5267.841785143054,43,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (240,0,4973.641484774767,47,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (241,0,NULL,47,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (242,0,NULL,58,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (243,0,464.6341336266803,49,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (244,0,879.5873497728171,48,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (245,0,1933.31899355189,50,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (246,1,1598.8702140303076,14,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (247,1,NULL,60,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (248,0,3132.180734195495,31,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (249,0,1615.9148140204693,29,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (250,0,NULL,54,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (251,0,380628.3793297923,71,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (252,1,5793.741211736386,35,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (253,0,357915.03630280367,63,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (254,2,940.6004540822236,44,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (255,0,6373.865375741792,45,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (256,0,1681.6645489757752,52,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (257,0,874.8530628222733,49,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (258,1,930.0835695908776,47,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (259,0,1611.5705027263714,29,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (260,1,1710.1403339177082,29,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (261,0,2658.4860825068777,51,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (262,0,1617.8403552782231,44,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (263,0,383664.7812096172,52,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (264,2,NULL,14,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (265,2,2888.5517238004663,48,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (266,0,330174.4847063083,59,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (267,0,333718.49112749967,68,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (268,2,2875.499547903885,29,'M','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (269,2,146.00066306283634,37,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (270,3,1872.663186426345,0,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (271,0,348537.5001330709,66,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (272,0,5538.96373102039,35,'M','primary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (273,0,396814.1840801792,57,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (274,2,1945.3766760759029,25,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (275,0,1481.2761428816516,44,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (276,0,8631.590122353682,64,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (277,1,2725.9705734796325,46,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (278,1,NULL,23,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (279,0,NULL,44,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (280,0,NULL,66,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (281,1,1912.6526781783864,44,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (282,2,4016.445178900168,33,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (283,0,384733.816032242,56,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (284,0,9488.078233698932,63,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (285,0,877.6474187514337,50,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (286,0,9854.773564031651,45,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (287,0,1382.864823354735,47,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (288,0,1303.9577949784834,28,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (289,1,710.680916165844,44,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (290,0,1006.2400540838852,35,'M','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (291,-1,4417.703587995504,46,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (292,0,3675.617929176691,56,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (293,0,360701.1265676916,65,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (294,4,2220.384764836021,36,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (295,0,884.5458974260507,27,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (296,0,741.1272798825229,43,'F','higher');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (297,0,471.7627961551879,45,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (298,1,1082.79895063531,44,'F','secondary');
INSERT INTO mytable(FIELD1,children,days_employed,age,gender,education) VALUES (299,0,1433.3817756275732,28,'F','higher');
*/
/*
1 Скопировать код по ссылке https://github.com/EkaterinaTerentyeva/for_sql_course/blob/main/summary_session.sql (если что копируем Ctrl+A, Ctrl+C) и вставить в Workbench (Ctrl+V)
2 Сверху дописать USE название_вашей_базы_данных;
3 Запустить запрос
4 Убедиться что в созданной таблице 300 строк
 
Описание таблицы
Данные по банковским заемщикам 
FIELD 1 - идентификатор клиента
children - количество детей
days_employed - трудовой стаж в днях
age - возраст
gender - пол
education - образование
 
Допущения
1 Максимальный возраст заемщика = 99 годам, минимальный = 18 годам
2 В году 300 рабочих дней
3 Работать можно по достижению 14 лет
 
Задание
Почистить данные (на английском этот этап называется primary data preprocessing) 
- удалить все строки с некорректными и противоречивыми значениями 
Полученный результат сохранить в виде представления (view)
*/
SELECT *
FROM mytable_view;

SELECT DISTINCT education
FROM mytable;

SELECT *
FROM mytable
WHERE age BETWEEN 18 AND 99 AND days_employed / 300 + 14 <= age 
AND children >= 0 AND days_employed >= 0 AND gender IN("F", "M")
AND education IN("higher", "secondary", "primary");

CREATE VIEW mytable_view AS
SELECT *
FROM mytable
WHERE age BETWEEN 18 AND 99 AND days_employed / 300 + 14 <= age 
AND children >= 0 AND days_employed >= 0 AND gender IN("F", "M")
AND education IN("higher", "secondary", "primary");