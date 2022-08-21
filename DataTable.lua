if AZP == nil then AZP = {} end
if AZP.KeyStoneMaster == nil then AZP.KeyStoneMaster = {} end

AZP.KeyStoneMaster.KeyList =
{
    [227] = {Name =   "Kara-L", NameFull =      "Return to Karazhan: Lower"},
    [234] = {Name =   "Kara-U", NameFull =      "Return to Karazhan: Upper"},
    [369] = {Name =  "Mecha-J", NameFull = "Operation: Mechagon - Junkyard"},
    [370] = {Name =  "Mecha-W", NameFull = "Operation: Mechagon - Workshop"},
    [169] = {Name =  "I-Docks", NameFull =                     "Iron Docks"},
    [166] = {Name = "Grimrail", NameFull =                 "Grimrail Depot"},
    [391] = {Name = "T-Street", NameFull =    "Tazavesh, Streets of Wonder"},
    [392] = {Name = "T-Gambit", NameFull =     "Tazavesh, So'Leah's Gambit"},
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
}

AZP.KeyStoneMaster.iLevelBonusIDs = {1550, 1553, 1556, 1560, 1563, 1566, 1569, 1573, 1576, 1579, 1582, 1586,}

    -- [1550] = {Rank =  1, iLevel = 236, Mythic =  2},
    -- [1553] = {Rank =  2, iLevel = 239, Mythic =  3},
    -- [1556] = {Rank =  3, iLevel = 242, Mythic =  4},
    -- [1560] = {Rank =  4, iLevel = 246, Mythic =  5},
    -- [1563] = {Rank =  5, iLevel = 249, Mythic =  6,  7},
    -- [1566] = {Rank =  6, iLevel = 252, Mythic =  8,  9},
    -- [1569] = {Rank =  7, iLevel = 255, Mythic = 10, 11},
    -- [1573] = {Rank =  8, iLevel = 259, Mythic = 12, 13},
    -- [1576] = {Rank =  9, iLevel = 262, Mythic = 14, 15},
    -- [1579] = {Rank = 10, iLevel = 265, Mythic = },
    -- [1582] = {Rank = 11, iLevel = 268, Mythic = },
    -- [1586] = {Rank = 12, iLevel = 272, Mythic = },

AZP.KeyStoneMaster.ItemIDs =
{
[240] = -- OffHand, 1H Agi/Str
    {
        BonusIDs = {8203, 8204, 8205, 8206, 8207, 8208, 8209, 8210, 8211, 8212, 8213, 8214,},
        ItemIDs = {
            -- Grimrail
            110052, 110053,
            -- Iron Docks
            110058, 110055,
            -- Mechagon
            169066, 168963, 169052, 168962, 169608, 169058,
            -- Tazavesh
            185824, 185819, 185777, 185823, 185778, 185780,
            185812,
        },
    },
[241] = -- 2H (Gun + Staff + 2h STR Mace)
    {
        BonusIDs = {8189, 8190, 8191, 8192, 8193, 8194, 8195, 8196, 8197, 8198, 8199, 8200,},
        ItemIDs = {
            -- Grim Rail
            110051, 110054,
            -- Iron Docks
            110059, 110056, 110060, 
            -- Mechagon
            169050, 168973, 169035, 169077, 
            -- Tazavesh
            185810, 185779, 185822, 185783,
        }
    },
[242] = -- 1H Int
    {
        BonusIDs = {8231, 8232, 8233, 8234, 8235, 8236, 8237, 8238, 8239, 8240, 8241, 8242,},
        ItemIDs = {
            -- Iron Docks
            110057,
            -- Mechagon
            168955, 169062,
            -- Tazavesh
            185821, 185841,
        }
    },
[243] = -- Head, Legs, Chest
    {
        BonusIDs = {8245, 8246, 8247, 8248, 8249, 8250, 8251, 8252, 8253, 8254, 8255, 8256,},
        ItemIDs = {
            --Grimrail
            109898, 109885, 109884, 109886, 109903, 109900, 109894, 109895, 109892, 109890,
            109897, 109902, 109891, 109896, 109899, 109901, 109889, 109888, 109887, 109893,
            109823, 109810, 109811, 109808, 109805, 109820, 109821, 109818, 109816, 109812,
            109806, 109809, 109807, 109817, 109822, 109815, 109814, 109813, 109804, 109819,
            -- Iron Docks
            109979, 109976, 109977, 109974, 109971, 109987, 109988, 109970, 109975, 109972,
            109985, 109983, 109978, 109973, 109984, 109989, 109982, 109781, 109980, 109986,
            -- Karazhan
            142134, 142126, 142150, 142142, 142304, 142296,
            142300, 142151, 142135, 142197, 142127, 142202, 142143,
            142123, 142131, 142147, 142139,
            -- Mechagon
            169070, 169065, 169051, 168988, 169071, 168966, 168968, 168974,
            168979, 169073, 169072, 168981,
            -- Tazavesh
            185795, 185796, 185776, 185797,
            185801, 185799, 185800, 185798,
            185785, 185784, 185782, 185786,
        }
    },
[244] = -- Back, Wrist, Finger, Neck
    {
        BonusIDs = {8273, 8274, 8275, 8276, 8277, 8278, 8279, 8280, 8281, 8282, 8283, 8284,},
        ItemIDs = {
            -- Grimrail
            109882, 109869, 109864, 109868, 109866, 109870, 109881, 109865, 109878, 109879,
            109876, 109875, 109871, 109867, 109883, 109880, 109874, 109873, 109872, 109877,
            109957, 109962, 109959, 109969, 109955, 109951, 109965, 109968, 109963, 109958,
            109954, 109956, 109964, 109967, 109961, 109966, 109952, 109950, 109960, 109953,
            109779, 109768, 109773, 109783, 109775, 109771, 109761, 109760, 109766, 109763,
            109782, 109765, 109772, 109764, 109767, 109774, 109759, 109776, 109781, 109770,
            109762, 109780, 109778, 109769, 109777,
            -- Karazhan
            142206, 142170, 142215,
            142130, 142146, 142154, 142138, 142198,
            142173, 142171, 142172,
            142207, 142174,
            -- Mechagon
            168970, 169064,
            168989, 168978, 168967, 169069,
            169158, 169157, 169076, 169156, 169159, 169160, 168977, 169161,
            -- Tazavesh
            185781, 185843,
            185814, 185817, 185816, 185815,
            185840, 185813,
            185820, 185842,
        }
    },
[245] = -- Trinket, Hands, Feet, Waist, Shoulder
    {
        BonusIDs = {8259, 8260, 8261, 8262, 8263, 8264, 8265, 8266, 8267, 8268, 8269, 8270,},
        ItemIDs = {
            -- Grimrail
            109996, 110001,
            109862, 109849, 109850, 109861, 109845, 109848, 109844, 109846, 109858, 109859,
            109856, 109855, 109851, 109847, 109863, 109860, 109854, 109853, 109852, 109857,
            109829, 109842, 109830, 109824, 109826, 109831, 109828, 109825, 109839, 109840,
            109837, 109836, 109832, 109827, 109843, 109841, 109835, 109834, 109833, 109838,
            -- Iron Docks
            110017, 110002, 109997,
            109938, 109935, 109936, 109948, 109931, 109945, 109946, 109943, 109942, 109937,
            109933, 109930, 109932, 109949, 109947, 109941, 109940, 109934, 109939, 109944,
            -- Karazhan
            142157, 142159, 142165, 142167, 142158, 142162, 142161, 142168, 142160, 142169, 142164,
            142141, 142133, 142149, 142299, 142205, 142125,
            142298, 142204, 142140, 142132, 142124, 142148,
            142196, 142153, 142145, 142137, 142129,
            142201, 142136, 142128, 142152, 142144,
            -- Mechagon
            168965, 169344, 169769,
            169063, 169054, 168985, 168980, 168971, 168969, 169059, 169061,
            169049, 169055, 168982, 168964, 168972, 168975, 169056, 169053,
            169057, 168983, 168986, 168958, 168957, 168976, 169060, 169067,
            168987, 168984, 169074, 169075,
            -- Tazavesh
            185836, 185845, 185846, 190958, 190652,
            185792, 185793, 185794, 185791,
            185788, 185787, 185789, 185790,
            185808, 185806, 185807, 185809,
            185802, 185804, 185805, 185803,
        }
    },
[246] = -- Shield
    {
        BonusIDs = {8217, 8218, 8219, 8220, 8221, 8222, 8223, 8224, 8225, 8226, 8227, 8228,},
        ItemIDs = {
            169068, --Mechagon
            185811 -- Tazavesh
        }
    },

}