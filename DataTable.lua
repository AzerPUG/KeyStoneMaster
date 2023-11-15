if AZP == nil then AZP = {} end
if AZP.KeyStoneMaster == nil then AZP.KeyStoneMaster = {} end

AZP.KeyStoneMaster.KeyList =
{
    [168] = {Name = "EBloom", NameFull = "The Everbloom"},
    [198] = {Name =  "DTick", NameFull = "Freehold"},
    [199] = {Name =    "BRH", NameFull = "Black Rook Hold"},
    [244] = {Name = "ADazar", NameFull = "Atal'Dazar"},
    [248] = {Name = "WManor", NameFull = "Waycrest Manor"},
    [456] = {Name =   "TotT", NameFull = "Throne of the Tides"},
    [463] = {Name =  "GFall", NameFull = "Dawn of the Infinite: Galakrond's Fall"},
    [464] = {Name =  "MRise", NameFull = "Dawn of the Infinite: Murozond's Rise"},

    --/script for i = 1, 10000 do if C_MythicPlus.GetSeasonBestAffixScoreInfoForMap(i) ~= nil then print("DungeonIndex:", i, "     - ", C_MythicPlus.GetSeasonBestAffixScoreInfoForMap(i)) end end
}

AZP.KeyStoneMaster.Affixes =
{
      [3] =   "Volcanic",
      [4] =   "Necrotic",
      [6] =     "Raging",
      [7] = "Bolstering",
      [8] =   "Sanguine",
      [9] =  "Tyranical",
     [10] =  "Fortified",
     [11] =   "Bursting",
     [12] =   "Grievous",
     [13] =  "Explosive",
     [14] =    "Quaking",
    [122] =  "Inspiring",
    [130] =  "Encrypted",
    [131] =   "Shrouded",
}

    -- dreanor/legion/bfa/sl
    -- [3147/3141/1656/1579] = {Rank =  1, iLevel = 262, Mythic =  2},
    -- [3150/3144/1659/1582] = {Rank =  2, iLevel = 265, Mythic =  3},
    -- [3153/3147/1662/1585] = {Rank =  3, iLevel = 268, Mythic =  4},
    -- [3157/3151/1666/1589] = {Rank =  4, iLevel = 272, Mythic =  5},
    -- [3160/3154/1669/1592] = {Rank =  5, iLevel = 275, Mythic =  6,  7},
    -- [3163/3157/1672/1595] = {Rank =  6, iLevel = 278, Mythic =  8,  9},
    -- [3166/3160/3132/1598] = {Rank =  7, iLevel = 281, Mythic = 10, 11},
    -- [3170/3164/3136/1602] = {Rank =  8, iLevel = 285, Mythic = 12, 13},
    -- [3173/3167/3139/1605] = {Rank =  9, iLevel = 288, Mythic = 14, 15},
    -- [3176/3170/3142/1608] = {Rank = 10, iLevel = 291, Mythic = },
    -- [3179/3173/3145/1611] = {Rank = 11, iLevel = 294, Mythic = },
    -- [3183/3177/3149/1615] = {Rank = 12, iLevel = 298, Mythic = },

local DreanorILevelBonusIDs = {3147, 3150, 3153, 3157, 3160, 3163, 3166, 3170, 3173, 3176, 3179, 3183}
local  LegionILevelBonusIDs = {3141, 3144, 3147, 3151, 3154, 3157, 3160, 3164, 3167, 3170, 3173, 3177}
local     BFAILevelBonusIDs = {1656, 1659, 1662, 1666, 1669, 1672, 3132, 3136, 3139, 3142, 3145, 3149}
local      SLILevelBonusIDs = {1579, 1582, 1585, 1589, 1592, 1595, 1598, 1602, 1605, 1608, 1611, 1615}
-- 262, 265, 268, 272, 275, 278, 281, 285, 288, 291, 294, 298

AZP.KeyStoneMaster.ItemIDs =
{
[240] = -- OffHand, 1H Agi/Str
    {
        {
            BonusIDs = {8203, 8204, 8205, 8206, 8207, 8208, 8209, 8210, 8211, 8212, 8213, 8214,},
            iLevelBonusIDs = DreanorILevelBonusIDs,
            ItemIDs = {
                -- Grimrail
                110052, 110053,
            }
        },
        {
            BonusIDs = {8203, 8204, 8205, 8206, 8207, 8208, 8209, 8210, 8211, 8212, 8213, 8214,},
            iLevelBonusIDs = DreanorILevelBonusIDs,
            ItemIDs = {
                -- Iron Docks
                110058, 110055,
            }
        },
        {
            BonusIDs = {8203, 8204, 8205, 8206, 8207, 8208, 8209, 8210, 8211, 8212, 8213, 8214,},
            iLevelBonusIDs = BFAILevelBonusIDs,
            ItemIDs = {
                -- Mechagon
                169066, 168963, 169052, 168962, 169608, 169058,
            }
        },
        {
            BonusIDs = {8203, 8204, 8205, 8206, 8207, 8208, 8209, 8210, 8211, 8212, 8213, 8214,},
            iLevelBonusIDs = SLILevelBonusIDs,
            ItemIDs = {
                -- Tazavesh
                185824, 185819, 185777, 185823, 185778, 185780,
                185812,
            }
        },
    },
[241] = -- 2H (Gun + Staff + 2h STR Mace)
    {
        {
            BonusIDs = {8189, 8190, 8191, 8192, 8193, 8194, 8195, 8196, 8197, 8198, 8199, 8200,},
            iLevelBonusIDs = DreanorILevelBonusIDs,
            ItemIDs = {
                -- Grim Rail
                110051, 110054,
            }
        },
        {
            BonusIDs = {8189, 8190, 8191, 8192, 8193, 8194, 8195, 8196, 8197, 8198, 8199, 8200,},
            iLevelBonusIDs = DreanorILevelBonusIDs,
            ItemIDs = {
                -- Iron Docks
                110059, 110056, 110060, 
            }
        },
        {
            BonusIDs = {8189, 8190, 8191, 8192, 8193, 8194, 8195, 8196, 8197, 8198, 8199, 8200,},
            iLevelBonusIDs = BFAILevelBonusIDs,
            ItemIDs = {
                -- Mechagon
                169050, 168973, 169035, 169077, 
            }
        },
        {
            BonusIDs = {8189, 8190, 8191, 8192, 8193, 8194, 8195, 8196, 8197, 8198, 8199, 8200,},
            iLevelBonusIDs = SLILevelBonusIDs,
            ItemIDs = {
                -- Tazavesh
                185810, 185779, 185822, 185783,
            }
        }
    },
[242] = -- 1H Int
    {
        {
            BonusIDs = {8231, 8232, 8233, 8234, 8235, 8236, 8237, 8238, 8239, 8240, 8241, 8242,},
            iLevelBonusIDs = DreanorILevelBonusIDs,
            ItemIDs = {
                -- Iron Docks
                110057,
            }
        },
        {
            BonusIDs = {8231, 8232, 8233, 8234, 8235, 8236, 8237, 8238, 8239, 8240, 8241, 8242,},
            iLevelBonusIDs = BFAILevelBonusIDs,
            ItemIDs = {
                -- Mechagon
                168955, 169062,
            }
        },
        {
            BonusIDs = {8231, 8232, 8233, 8234, 8235, 8236, 8237, 8238, 8239, 8240, 8241, 8242,},
            iLevelBonusIDs = SLILevelBonusIDs,
            ItemIDs = {
                -- Tazavesh
                185821, 185841,
            }
        }
    },
[243] = -- Head, Legs, Chest
    {
        {
            BonusIDs = {8245, 8246, 8247, 8248, 8249, 8250, 8251, 8252, 8253, 8254, 8255, 8256,},
            iLevelBonusIDs = DreanorILevelBonusIDs,
            ItemIDs = {
                --Grimrail
                109898, 109885, 109884, 109886, 109903, 109900, 109894, 109895, 109892, 109890,
                109897, 109902, 109891, 109896, 109899, 109901, 109889, 109888, 109887, 109893,
                109823, 109810, 109811, 109808, 109805, 109820, 109821, 109818, 109816, 109812,
                109806, 109809, 109807, 109817, 109822, 109815, 109814, 109813, 109804, 109819,
            }
        },
        {
            BonusIDs = {8245, 8246, 8247, 8248, 8249, 8250, 8251, 8252, 8253, 8254, 8255, 8256,},
            iLevelBonusIDs = DreanorILevelBonusIDs,
            ItemIDs = {
                -- Iron Docks
                109979, 109976, 109977, 109974, 109971, 109987, 109988, 109970, 109975, 109972,
                109985, 109983, 109978, 109973, 109984, 109989, 109982, 109781, 109980, 109986,
            }
        },
        {
            BonusIDs = {8245, 8246, 8247, 8248, 8249, 8250, 8251, 8252, 8253, 8254, 8255, 8256,},
            iLevelBonusIDs = LegionILevelBonusIDs,
            ItemIDs = {
                -- Karazhan
                142134, 142126, 142150, 142142, 142304, 142296,
                142300, 142151, 142135, 142197, 142127, 142202, 142143,
                142123, 142131, 142147, 142139,
            }
        },
        {
            BonusIDs = {8245, 8246, 8247, 8248, 8249, 8250, 8251, 8252, 8253, 8254, 8255, 8256,},
            iLevelBonusIDs = BFAILevelBonusIDs,
            ItemIDs = {
                -- Mechagon
                169070, 169065, 169051, 168988, 169071, 168966, 168968, 168974,
                168979, 169073, 169072, 168981,
            }
        },
        {
            BonusIDs = {8245, 8246, 8247, 8248, 8249, 8250, 8251, 8252, 8253, 8254, 8255, 8256,},
            iLevelBonusIDs = SLILevelBonusIDs,
            ItemIDs = {
                -- Tazavesh
                185795, 185796, 185776, 185797,
                185801, 185799, 185800, 185798,
                185785, 185784, 185782, 185786,
            }
        }
    },
[244] = -- Back, Wrist, Finger, Neck
    {
        {
            BonusIDs = {8273, 8274, 8275, 8276, 8277, 8278, 8279, 8280, 8281, 8282, 8283, 8284,},
            iLevelBonusIDs = DreanorILevelBonusIDs,
            ItemIDs = {
                -- Grimrail
                109882, 109869, 109864, 109868, 109866, 109870, 109881, 109865, 109878, 109879,
                109876, 109875, 109871, 109867, 109883, 109880, 109874, 109873, 109872, 109877,
                109957, 109962, 109959, 109969, 109955, 109951, 109965, 109968, 109963, 109958,
                109954, 109956, 109964, 109967, 109961, 109966, 109952, 109950, 109960, 109953,
                109779, 109768, 109773, 109783, 109775, 109771, 109761, 109760, 109766, 109763,
                109782, 109765, 109772, 109764, 109767, 109774, 109759, 109776, 109781, 109770,
                109762, 109780, 109778, 109769, 109777,
            }
        },
        {
            BonusIDs = {8273, 8274, 8275, 8276, 8277, 8278, 8279, 8280, 8281, 8282, 8283, 8284,},
            iLevelBonusIDs = LegionILevelBonusIDs,
            ItemIDs = {
                -- Karazhan
                142206, 142170, 142215,
                142130, 142146, 142154, 142138, 142198,
                142173, 142171, 142172,
                142207, 142174,
            }
        },
        {
            BonusIDs = {8273, 8274, 8275, 8276, 8277, 8278, 8279, 8280, 8281, 8282, 8283, 8284,},
            iLevelBonusIDs = BFAILevelBonusIDs,
            ItemIDs = {
                -- Mechagon
                168970, 169064,
                168989, 168978, 168967, 169069,
                169158, 169157, 169076, 169156, 169159, 169160, 168977, 169161,
            }
        },
        {
            BonusIDs = {8273, 8274, 8275, 8276, 8277, 8278, 8279, 8280, 8281, 8282, 8283, 8284,},
            iLevelBonusIDs = SLILevelBonusIDs,
            ItemIDs = {
                -- Tazavesh
                185781, 185843,
                185814, 185817, 185816, 185815,
                185840, 185813,
                185820, 185842,
            }
        }
    },
[245] = -- Trinket, Hands, Feet, Waist, Shoulder
    {
        {
            BonusIDs = {8259, 8260, 8261, 8262, 8263, 8264, 8265, 8266, 8267, 8268, 8269, 8270,},
            iLevelBonusIDs = DreanorILevelBonusIDs,
            ItemIDs = {
                -- Grimrail
                109996, 110001,
                109862, 109849, 109850, 109861, 109845, 109848, 109844, 109846, 109858, 109859,
                109856, 109855, 109851, 109847, 109863, 109860, 109854, 109853, 109852, 109857,
                109829, 109842, 109830, 109824, 109826, 109831, 109828, 109825, 109839, 109840,
                109837, 109836, 109832, 109827, 109843, 109841, 109835, 109834, 109833, 109838,
            }
        },
        {
            BonusIDs = {8259, 8260, 8261, 8262, 8263, 8264, 8265, 8266, 8267, 8268, 8269, 8270,},
            iLevelBonusIDs = DreanorILevelBonusIDs,
            ItemIDs = {
                -- Iron Docks
                110017, 110002, 109997,
                109938, 109935, 109936, 109948, 109931, 109945, 109946, 109943, 109942, 109937,
                109933, 109930, 109932, 109949, 109947, 109941, 109940, 109934, 109939, 109944,
            }
        },
        {
            BonusIDs = {8259, 8260, 8261, 8262, 8263, 8264, 8265, 8266, 8267, 8268, 8269, 8270,},
            iLevelBonusIDs = LegionILevelBonusIDs,
            ItemIDs = {
                -- Karazhan
                142157, 142159, 142165, 142167, 142158, 142162, 142161, 142168, 142160, 142169, 142164,
                142141, 142133, 142149, 142299, 142205, 142125,
                142298, 142204, 142140, 142132, 142124, 142148,
                142196, 142153, 142145, 142137, 142129,
                142201, 142136, 142128, 142152, 142144,
            }
        },
        {
            BonusIDs = {8259, 8260, 8261, 8262, 8263, 8264, 8265, 8266, 8267, 8268, 8269, 8270,},
            iLevelBonusIDs = BFAILevelBonusIDs,
            ItemIDs = {
                -- Mechagon
                168965, 169344, 169769,
                169063, 169054, 168985, 168980, 168971, 168969, 169059, 169061,
                169049, 169055, 168982, 168964, 168972, 168975, 169056, 169053,
                169057, 168983, 168986, 168958, 168957, 168976, 169060, 169067,
                168987, 168984, 169074, 169075,
            }
        },
        {
            BonusIDs = {8259, 8260, 8261, 8262, 8263, 8264, 8265, 8266, 8267, 8268, 8269, 8270,},
            iLevelBonusIDs = SLILevelBonusIDs,
            ItemIDs = {
                -- Tazavesh
                185836, 185845, 185846, 190958, 190652,
                185792, 185793, 185794, 185791,
                185788, 185787, 185789, 185790,
                185808, 185806, 185807, 185809,
                185802, 185804, 185805, 185803,
            }
        }
    },
[246] = -- Shield
    {
        {
            BonusIDs = {8217, 8218, 8219, 8220, 8221, 8222, 8223, 8224, 8225, 8226, 8227, 8228,},
            iLevelBonusIDs = BFAILevelBonusIDs,
            ItemIDs = {
                169068, --Mechagon
            }
        },
        {
            BonusIDs = {8217, 8218, 8219, 8220, 8221, 8222, 8223, 8224, 8225, 8226, 8227, 8228,},
            iLevelBonusIDs = SLILevelBonusIDs,
            ItemIDs = {
                185811 -- Tazavesh
            }
        }
    },

}