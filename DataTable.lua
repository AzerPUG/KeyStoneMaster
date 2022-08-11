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
    [223] =
    {
        BonusIDs = {7815, 7816, 7817, 7818, 7819, 7820, 7821, 7822, 7823, 7824, 7825, 7826,},
         ItemIDs =
                {
                    -- 2H Wep
                    178713, 178714, 178735, 178754, 178780, 178829, 178865, 178866, 178929, 179330,
                    179339, 179347, 179348, 180096, 180097, 180112, 185779, 185783, 185810, 185822,
                },
    },
    [224] =
    {
        BonusIDs = {7801, 7802, 7803, 7804, 7805, 7806, 7807, 7808, 7809, 7810, 7811, 7812,},
         ItemIDs =
                {
                    -- Wrist
                    178702, 178703, 178704, 178741, 178767, 178782, 178806, 178807, 178844, 178845,
                    178846, 178847, 178934, 179354, 180113, 180114, 185814, 185815, 185816, 185817,

                    -- Waist
                    178699, 178700, 178734, 178804, 178805, 178822, 178823, 178842, 178843, 178931,
                    178932, 179326, 179343, 180109, 180110, 180111, 185806, 185807, 185808, 185809,

                    -- Hands
                    178705, 178706, 178748, 178757, 178775, 178798, 178832, 178833, 178840, 178841,
                    178930, 179325, 179336, 180103, 180104, 180105, 185791, 185792, 185793, 185794,

                    -- Feet
                    178731, 178745, 178756, 178774, 178796, 178797, 178830, 178831, 178836, 178837,
                    179322, 179338, 179345, 179352, 180101, 180102, 185787, 185788, 185789, 185790,
                },
    },
    [225] =
    {
        BonusIDs = {7843, 7844, 7845, 7846, 7847, 7848, 7849, 7850, 7851, 7852, 7853, 7854,},
         ItemIDs =
                {
                    -- 1H Wep
                    178709, 178710, 178711, 178730, 178737, 178743, 178752, 178753, 178789, 178834,
                    178853, 178854, 178855, 178856, 178857, 178863, 178864, 178928, 179328, 180095,
                    185777, 185778, 185780, 185819, 185821, 185823, 185824, 185841,
                },
    },
    [226] =
    {
        BonusIDs = {7829, 7830, 7831, 7832, 7833, 7834, 7835, 7836, 7837, 7838, 7839, 7840,},
         ItemIDs =
                {
                    -- OffHand
                    178828, 178852, 178868, 185812, 178712, 178750, 178867, 185811,
                },
    },
    [227] =
    {
        BonusIDs = {7759, 7760, 7761, 7762, 7763, 7764, 7765, 7766, 7767, 7768, 7769, 7770,},
         ItemIDs =
                {
                    -- Chest
                    178698, 178744, 178792, 178793, 178794, 178795, 178813, 178814, 178815, 178835, 179335, 179346, 179353, 180098, 180099, 180100, 185782, 185784, 185785, 185786,

                    -- Legs
                    178701, 178739, 178761, 178762, 178778, 178800, 178801, 178818, 178819, 178838, 178839, 179324, 179337, 179351, 180107, 180108, 185798, 185799, 185800, 185801,
                },
    },
    [228] =
    {
        BonusIDs = {7773, 7774, 7775, 7776, 7777, 7778, 7779, 7780, 7781, 7782, 7783, 7784,},
         ItemIDs =
                {
                    -- Trinket
                    178708, 178715, 178742, 178751, 178769, 178770, 178771, 178772, 178783, 178808, 178809, 178810, 178811, 178825, 178826, 178849, 178850, 178861, 178862, 179331, 179342, 179350, 179356, 180116, 180117, 180118, 180119, 185836, 185845, 185846, 190652, 190958,

                    -- Shoulder
                    178695, 178696, 178697, 178733, 178740, 178740, 178749, 178763, 178764, 178779, 178802, 178803, 178820, 178821, 178858, 178859, 179344, 185802, 185803, 185804, 185805,

                    -- Head
                    178692, 178693, 178694, 178732, 178738, 178759, 178760, 178773, 178777, 178799, 178812, 178816, 178817, 178860, 180106, 185776, 185795, 185796, 185797,
                },
    },
    [229] =
    {
        BonusIDs = {7787, 7788, 7789, 7790, 7791, 7792, 7793, 7794, 7795, 7796, 7797, 7798,},
         ItemIDs =
                {
                    -- Finger
                    178736, 178781, 178824, 178848, 178869, 178870, 178871, 178872, 178933, 179340,
                    179355, 185813, 185840,

                    -- Back
                    178755, 178851, 179349, 180123, 185781, 185843,

                    -- Neck
                    178707, 178827, 180115, 185820, 185842,
                },
    },
}




    -- -- 228: Trinket / Shoulders / Head
    -- [7773] = {CurRank =  1, NextRankID = 7774, MaxRank = 12, Icon = AZP.ToolTips.Currencies.Valor, Amount = 400},
    -- [7774] = {CurRank =  2, NextRankID = 7775, MaxRank = 12, Icon = AZP.ToolTips.Currencies.Valor, Amount = 400},
    -- [7775] = {CurRank =  3, NextRankID = 7776, MaxRank = 12, Icon = AZP.ToolTips.Currencies.Valor, Amount = 400},
    -- [7776] = {CurRank =  4, NextRankID = 7777, MaxRank = 12, Icon = AZP.ToolTips.Currencies.Valor, Amount = 400},
    -- [7777] = {CurRank =  5, NextRankID = 7778, MaxRank = 12, Icon = AZP.ToolTips.Currencies.Valor, Amount = 400},
    -- [7778] = {CurRank =  6, NextRankID = 7779, MaxRank = 12, Icon = AZP.ToolTips.Currencies.Valor, Amount = 400},
    -- [7779] = {CurRank =  7, NextRankID = 7780, MaxRank = 12, Icon = AZP.ToolTips.Currencies.Valor, Amount = 400},
    -- [7780] = {CurRank =  8, NextRankID = 7781, MaxRank = 12, Icon = AZP.ToolTips.Currencies.Valor, Amount = 400},
    -- [7781] = {CurRank =  9, NextRankID = 7782, MaxRank = 12, Icon = AZP.ToolTips.Currencies.Valor, Amount = 400},
    -- [7782] = {CurRank = 10, NextRankID = 7783, MaxRank = 12, Icon = AZP.ToolTips.Currencies.Valor, Amount = 400},
    -- [7783] = {CurRank = 11, NextRankID = 7784, MaxRank = 12, Icon = AZP.ToolTips.Currencies.Valor, Amount = 400},
    -- [7784] = {CurRank = 12, NextRankID =  nil, MaxRank = 12, Icon = AZP.ToolTips.Currencies.Valor, Amount = nil},