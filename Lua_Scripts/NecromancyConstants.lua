local constants = {}

constants.rituals_data = {{
    name = "Makeshift communion",
    dbrowId = 7591,
    requiredDurability = 1,
    lightSourcesAmount = 4,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 1
    }},
    glyphs = {{
        npcId = 30434,
        npcName = "Elemental I",
        depletedId = 30435,
        itemId = 55638,
        amount = 1
    }, {
        npcId = 30446,
        npcName = "Commune I",
        depletedId = 30447,
        itemId = 55644,
        amount = 2
    }},
    input = {{
        itemId = 55243,
        itemName = "Grubby bones",
        amount = 1,
        slotId = 1
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 100.0
    }},
    reward_items = {},
    reward_input = {},
    customReward = "",
    souls = {1},
    EctoplasmRewardAmount = 3
}, {
    name = "Lesser communion",
    dbrowId = 7659,
    requiredDurability = 1,
    lightSourcesAmount = 4,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 5
    }},
    glyphs = {{
        npcId = 30434,
        npcName = "Elemental I",
        depletedId = 30435,
        itemId = 55638,
        amount = 1
    }, {
        npcId = 30446,
        npcName = "Commune I",
        depletedId = 30447,
        itemId = 55644,
        amount = 2
    }},
    input = {{
        itemId = 526,
        itemName = "Bones",
        amount = 1,
        slotId = 16
    }, {
        itemId = 532,
        itemName = "Big bones",
        amount = 1,
        slotId = 17
    }, {
        itemId = 534,
        itemName = "Baby dragon bones",
        amount = 1,
        slotId = 18
    }, {
        itemId = 6812,
        itemName = "Wyvern bones",
        amount = 1,
        slotId = 19
    }, {
        itemId = 55623,
        itemName = "Broken memento",
        amount = 1,
        slotId = 20
    }, {
        itemId = 55625,
        itemName = "Fragile memento",
        amount = 1,
        slotId = 21
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 175.0
    }},
    reward_items = {},
    reward_input = {},
    customReward = "",
    souls = {1, 2, 3, 4, 6, 8},
    EctoplasmRewardAmount = 3
}, {
    name = "Lesser necroplasm",
    dbrowId = 7653,
    requiredDurability = 1,
    lightSourcesAmount = 4,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 5
    }},
    glyphs = {{
        npcId = 30434,
        npcName = "Elemental I",
        depletedId = 30435,
        itemId = 55638,
        amount = 1
    }, {
        npcId = 30440,
        npcName = "Reagent I",
        depletedId = 30441,
        itemId = 55641,
        amount = 2
    }},
    input = {{
        itemId = 55598,
        itemName = "Weak necroplasm",
        amount = 200,
        slotId = 10
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 175.0
    }},
    reward_items = {{
        itemId = 55599,
        itemName = "Lesser necroplasm",
        amount = 100
    }},
    reward_input = {},
    customReward = "",
    souls = {},
    EctoplasmRewardAmount = 3
}, {
    name = "Lesser ensoul material",
    dbrowId = 7584,
    requiredDurability = 1,
    lightSourcesAmount = 4,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 20
    }},
    glyphs = {{
        npcId = 30434,
        npcName = "Elemental I",
        depletedId = 30435,
        itemId = 55638,
        amount = 2
    }, {
        npcId = 30452,
        npcName = "Change I",
        depletedId = 30453,
        itemId = 55647,
        amount = 1
    }},
    input = {{
        itemId = 55220,
        itemName = "Kili's tools",
        amount = 1,
        slotId = 59
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 225.0
    }},
    reward_items = {{
        itemId = 55221,
        itemName = "Kili's tools (ensouled)",
        amount = 1
    }},
    reward_input = {},
    customReward = "",
    souls = {},
    EctoplasmRewardAmount = 3
}, {
    name = "Lesser ensoul material",
    dbrowId = 7662,
    requiredDurability = 1,
    lightSourcesAmount = 4,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 20
    }},
    glyphs = {{
        npcId = 30434,
        npcName = "Elemental I",
        depletedId = 30435,
        itemId = 55638,
        amount = 2
    }, {
        npcId = 30452,
        npcName = "Change I",
        depletedId = 30453,
        itemId = 55647,
        amount = 1
    }},
    input = {{
        itemId = 55602,
        itemName = "Lesser unensouled bar",
        amount = 1,
        slotId = 35
    }, {
        itemId = 25835,
        itemName = "Spider silk hood",
        amount = 1,
        slotId = 36
    }, {
        itemId = 25837,
        itemName = "Spider silk robe top",
        amount = 1,
        slotId = 37
    }, {
        itemId = 25839,
        itemName = "Spider silk robe bottom",
        amount = 1,
        slotId = 38
    }, {
        itemId = 25843,
        itemName = "Spider silk gloves",
        amount = 1,
        slotId = 39
    }, {
        itemId = 25841,
        itemName = "Spider silk boots",
        amount = 1,
        slotId = 40
    }, {
        itemId = 1734,
        itemName = "Thread",
        amount = 1,
        slotId = 41
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 225.0
    }},
    reward_items = {},
    reward_input = {{
        slotId = 35,
        itemId = 55608,
        itemName = "Lesser ensouled bar",
        amount = 1
    }, {
        slotId = 36,
        itemId = 55614,
        itemName = "Lesser ensouled cloth",
        amount = 1
    }, {
        slotId = 37,
        itemId = 55614,
        itemName = "Lesser ensouled cloth",
        amount = 1
    }, {
        slotId = 38,
        itemId = 55614,
        itemName = "Lesser ensouled cloth",
        amount = 1
    }, {
        slotId = 39,
        itemId = 55614,
        itemName = "Lesser ensouled cloth",
        amount = 1
    }, {
        slotId = 40,
        itemId = 55614,
        itemName = "Lesser ensouled cloth",
        amount = 1
    }, {
        slotId = 41,
        itemId = 55620,
        itemName = "Lesser ensouled thread",
        amount = 1
    }},
    customReward = "",
    souls = {},
    EctoplasmRewardAmount = 3
}, {
    name = "Lesser essence",
    dbrowId = 7656,
    requiredDurability = 1,
    lightSourcesAmount = 4,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 24
    }},
    glyphs = {{
        npcId = 30434,
        npcName = "Elemental I",
        depletedId = 30435,
        itemId = 55638,
        amount = 2
    }, {
        npcId = 30452,
        npcName = "Change I",
        depletedId = 30453,
        itemId = 55647,
        amount = 2
    }},
    input = {{
        itemId = 7936,
        itemName = "Pure essence",
        amount = 200,
        slotId = 13
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 225.0
    }},
    reward_items = {{
        itemId = 55667,
        itemName = "Impure essence",
        amount = 40
    }},
    reward_input = {},
    customReward = "",
    souls = {},
    EctoplasmRewardAmount = 3
}, {
    name = "Empower vessel",
    dbrowId = 7585,
    requiredDurability = 1,
    lightSourcesAmount = 4,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 40
    }},
    glyphs = {{
        npcId = 30434,
        npcName = "Elemental I",
        depletedId = 30435,
        itemId = 55638,
        amount = 2
    }, {
        npcId = 30452,
        npcName = "Change I",
        depletedId = 30453,
        itemId = 55647,
        amount = 1
    }, {
        npcId = 30446,
        npcName = "Commune I",
        depletedId = 30447,
        itemId = 55644,
        amount = 1
    }},
    input = {{
        itemId = 55228,
        itemName = "Bucket of powerful slime",
        amount = 1,
        slotId = 60
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 225.0
    }},
    reward_items = {},
    reward_input = {},
    customReward = "",
    souls = {},
    EctoplasmRewardAmount = 3
}, {
    name = "Ensoul trumpet",
    dbrowId = 7583,
    requiredDurability = 1,
    lightSourcesAmount = 4,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 45
    }},
    glyphs = {{
        npcId = 30434,
        npcName = "Elemental I",
        depletedId = 30435,
        itemId = 55638,
        amount = 2
    }, {
        npcId = 30452,
        npcName = "Change I",
        depletedId = 30453,
        itemId = 55647,
        amount = 1
    }, {
        npcId = 30446,
        npcName = "Commune I",
        depletedId = 30447,
        itemId = 55644,
        amount = 1
    }},
    input = {{
        itemId = 49768,
        itemName = "Everlight trumpet",
        amount = 1,
        slotId = 61
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 225.0
    }},
    reward_items = {{
        itemId = 55215,
        itemName = "'No Gums' Murray's trumpet",
        amount = 1
    }},
    reward_input = {},
    customReward = "",
    souls = {},
    EctoplasmRewardAmount = 3
}, {
    name = "Ensoul material",
    dbrowId = 7663,
    requiredDurability = 1,
    lightSourcesAmount = 6,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 60
    }},
    glyphs = {{
        npcId = 30434,
        npcName = "Elemental I",
        depletedId = 30435,
        itemId = 55638,
        amount = 1
    }, {
        npcId = 30436,
        npcName = "Elemental II",
        depletedId = 30437,
        itemId = 55639,
        amount = 2
    }, {
        npcId = 30454,
        npcName = "Change II",
        depletedId = 30455,
        itemId = 55648,
        amount = 2
    }},
    input = {{
        itemId = 55604,
        itemName = "Unensouled bar",
        amount = 1,
        slotId = 42
    }, {
        itemId = 4089,
        itemName = "Mystic hat",
        amount = 1,
        slotId = 43
    }, {
        itemId = 4091,
        itemName = "Mystic robe top",
        amount = 1,
        slotId = 44
    }, {
        itemId = 4093,
        itemName = "Mystic robe bottom",
        amount = 1,
        slotId = 45
    }, {
        itemId = 4095,
        itemName = "Mystic gloves",
        amount = 1,
        slotId = 46
    }, {
        itemId = 4097,
        itemName = "Mystic boots",
        amount = 1,
        slotId = 47
    }, {
        itemId = 43977,
        itemName = "Springsheared wool",
        amount = 1,
        slotId = 48
    }, {
        itemId = 43975,
        itemName = "Summerdown wool",
        amount = 1,
        slotId = 49
    }, {
        itemId = 43981,
        itemName = "Fallfaced wool",
        amount = 1,
        slotId = 50
    }, {
        itemId = 43979,
        itemName = "Winterwold wool",
        amount = 1,
        slotId = 51
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 740.0
    }},
    reward_items = {},
    reward_input = {{
        slotId = 42,
        itemId = 55610,
        itemName = "Ensouled bar",
        amount = 1
    }, {
        slotId = 43,
        itemId = 55616,
        itemName = "Ensouled cloth",
        amount = 1
    }, {
        slotId = 44,
        itemId = 55616,
        itemName = "Ensouled cloth",
        amount = 1
    }, {
        slotId = 45,
        itemId = 55616,
        itemName = "Ensouled cloth",
        amount = 1
    }, {
        slotId = 46,
        itemId = 55616,
        itemName = "Ensouled cloth",
        amount = 1
    }, {
        slotId = 47,
        itemId = 55616,
        itemName = "Ensouled cloth",
        amount = 1
    }, {
        slotId = 48,
        itemId = 55621,
        itemName = "Ensouled thread",
        amount = 1
    }, {
        slotId = 49,
        itemId = 55621,
        itemName = "Ensouled thread",
        amount = 1
    }, {
        slotId = 50,
        itemId = 55621,
        itemName = "Ensouled thread",
        amount = 1
    }, {
        slotId = 51,
        itemId = 55621,
        itemName = "Ensouled thread",
        amount = 1
    }},
    customReward = "",
    souls = {},
    EctoplasmRewardAmount = 7
}, {
    name = "Greater communion",
    dbrowId = 7660,
    requiredDurability = 1,
    lightSourcesAmount = 6,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 60
    }},
    glyphs = {{
        npcId = 30436,
        npcName = "Elemental II",
        depletedId = 30437,
        itemId = 55639,
        amount = 2
    }, {
        npcId = 30446,
        npcName = "Commune I",
        depletedId = 30447,
        itemId = 55644,
        amount = 1
    }, {
        npcId = 30448,
        npcName = "Commune II",
        depletedId = 30449,
        itemId = 55645,
        amount = 2
    }},
    input = {{
        itemId = 536,
        itemName = "Dragon bones",
        amount = 1,
        slotId = 22
    }, {
        itemId = 6729,
        itemName = "Dagannoth bones",
        amount = 1,
        slotId = 23
    }, {
        itemId = 30209,
        itemName = "Airut bones",
        amount = 1,
        slotId = 24
    }, {
        itemId = 14793,
        itemName = "Ourg bones",
        amount = 1,
        slotId = 25
    }, {
        itemId = 4834,
        itemName = "Ourg bones",
        amount = 1,
        slotId = 26
    }, {
        itemId = 35008,
        itemName = "Hardened dragon bones",
        amount = 1,
        slotId = 27
    }, {
        itemId = 51858,
        itemName = "Dragonkin bones",
        amount = 1,
        slotId = 28
    }, {
        itemId = 55627,
        itemName = "Spirit memento",
        amount = 1,
        slotId = 29
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 740.0
    }},
    reward_items = {},
    reward_input = {},
    customReward = "",
    souls = {10, 12, 14, 16, 16, 18, 20, 24},
    EctoplasmRewardAmount = 7
}, {
    name = "Greater necroplasm",
    dbrowId = 7654,
    requiredDurability = 1,
    lightSourcesAmount = 6,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 60
    }},
    glyphs = {{
        npcId = 30434,
        npcName = "Elemental I",
        depletedId = 30435,
        itemId = 55638,
        amount = 1
    }, {
        npcId = 30436,
        npcName = "Elemental II",
        depletedId = 30437,
        itemId = 55639,
        amount = 2
    }, {
        npcId = 30442,
        npcName = "Reagent II",
        depletedId = 30443,
        itemId = 55642,
        amount = 2
    }},
    input = {{
        itemId = 55599,
        itemName = "Lesser necroplasm",
        amount = 200,
        slotId = 11
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 740.0
    }},
    reward_items = {{
        itemId = 55600,
        itemName = "Greater necroplasm",
        amount = 100
    }},
    reward_input = {},
    customReward = "",
    souls = {},
    EctoplasmRewardAmount = 7
}, {
    name = "Greater ensoul material",
    dbrowId = 7664,
    requiredDurability = 1,
    lightSourcesAmount = 6,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 80
    }},
    glyphs = {{
        npcId = 30436,
        npcName = "Elemental II",
        depletedId = 30437,
        itemId = 55639,
        amount = 3
    }, {
        npcId = 30454,
        npcName = "Change II",
        depletedId = 30455,
        itemId = 55648,
        amount = 2
    }},
    input = {{
        itemId = 55606,
        itemName = "Greater unensouled bar",
        amount = 1,
        slotId = 52
    }, {
        itemId = 24992,
        itemName = "Hood of subjugation",
        amount = 1,
        slotId = 53
    }, {
        itemId = 24995,
        itemName = "Garb of subjugation",
        amount = 1,
        slotId = 54
    }, {
        itemId = 24998,
        itemName = "Gown of subjugation",
        amount = 1,
        slotId = 55
    }, {
        itemId = 25007,
        itemName = "Gloves of subjugation",
        amount = 1,
        slotId = 56
    }, {
        itemId = 25004,
        itemName = "Boots of subjugation",
        amount = 1,
        slotId = 57
    }, {
        itemId = 29864,
        itemName = "Algarum thread",
        amount = 1,
        slotId = 58
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 1776.0
    }},
    reward_items = {},
    reward_input = {{
        slotId = 52,
        itemId = 55612,
        itemName = "Greater ensouled bar",
        amount = 1
    }, {
        slotId = 53,
        itemId = 55618,
        itemName = "Greater ensouled cloth",
        amount = 1
    }, {
        slotId = 54,
        itemId = 55618,
        itemName = "Greater ensouled cloth",
        amount = 1
    }, {
        slotId = 55,
        itemId = 55618,
        itemName = "Greater ensouled cloth",
        amount = 1
    }, {
        slotId = 56,
        itemId = 55618,
        itemName = "Greater ensouled cloth",
        amount = 1
    }, {
        slotId = 57,
        itemId = 55618,
        itemName = "Greater ensouled cloth",
        amount = 1
    }, {
        slotId = 58,
        itemId = 55622,
        itemName = "Greater ensouled thread",
        amount = 1
    }},
    customReward = "",
    souls = {},
    EctoplasmRewardAmount = 7
}, {
    name = "Greater essence",
    dbrowId = 7657,
    requiredDurability = 1,
    lightSourcesAmount = 6,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 80
    }},
    glyphs = {{
        npcId = 30436,
        npcName = "Elemental II",
        depletedId = 30437,
        itemId = 55639,
        amount = 2
    }, {
        npcId = 30454,
        npcName = "Change II",
        depletedId = 30455,
        itemId = 55648,
        amount = 3
    }},
    input = {{
        itemId = 7936,
        itemName = "Pure essence",
        amount = 400,
        slotId = 14
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 1776.0
    }},
    reward_items = {{
        itemId = 55667,
        itemName = "Impure essence",
        amount = 100
    }},
    reward_input = {},
    customReward = "",
    souls = {},
    EctoplasmRewardAmount = 7
}, {
    name = "Powerful communion",
    dbrowId = 7661,
    requiredDurability = 1,
    lightSourcesAmount = 10,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 90
    }},
    glyphs = {{
        npcId = 30438,
        npcName = "Elemental III",
        depletedId = 30439,
        itemId = 55640,
        amount = 4
    }, {
        npcId = 30448,
        npcName = "Commune II",
        depletedId = 30449,
        itemId = 55645,
        amount = 2
    }, {
        npcId = 30450,
        npcName = "Commune III",
        depletedId = 30451,
        itemId = 55646,
        amount = 2
    }},
    input = {{
        itemId = 48075,
        itemName = "Dinosaur bones",
        amount = 1,
        slotId = 30
    }, {
        itemId = 18832,
        itemName = "Frost dragon bones",
        amount = 1,
        slotId = 31
    }, {
        itemId = 35010,
        itemName = "Reinforced dragon bones",
        amount = 1,
        slotId = 32
    }, {
        itemId = 55629,
        itemName = "Robust memento",
        amount = 1,
        slotId = 33
    }, {
        itemId = 55631,
        itemName = "Powerful memento",
        amount = 1,
        slotId = 34
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 3300.0
    }},
    reward_items = {},
    reward_input = {},
    customReward = "",
    souls = {30, 40, 50, 60, 75},
    EctoplasmRewardAmount = 15
}, {
    name = "Powerful necroplasm",
    dbrowId = 7655,
    requiredDurability = 1,
    lightSourcesAmount = 10,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 90
    }},
    glyphs = {{
        npcId = 30436,
        npcName = "Elemental II",
        depletedId = 30437,
        itemId = 55639,
        amount = 2
    }, {
        npcId = 30438,
        npcName = "Elemental III",
        depletedId = 30439,
        itemId = 55640,
        amount = 4
    }, {
        npcId = 30444,
        npcName = "Reagent III",
        depletedId = 30445,
        itemId = 55643,
        amount = 2
    }},
    input = {{
        itemId = 55600,
        itemName = "Greater necroplasm",
        amount = 200,
        slotId = 12
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 3300.0
    }},
    reward_items = {{
        itemId = 55601,
        itemName = "Powerful necroplasm",
        amount = 100
    }},
    reward_input = {},
    customReward = "",
    souls = {},
    EctoplasmRewardAmount = 15
}, {
    name = "Powerful essence",
    dbrowId = 7658,
    requiredDurability = 1,
    lightSourcesAmount = 10,
    requiredLevels = {{
        skillId = 28,
        skillName = "Necromancy",
        requiredLevel = 95
    }},
    glyphs = {{
        npcId = 30438,
        npcName = "Elemental III",
        depletedId = 30439,
        itemId = 55640,
        amount = 4
    }, {
        npcId = 30454,
        npcName = "Change II",
        depletedId = 30455,
        itemId = 55648,
        amount = 2
    }, {
        npcId = 30456,
        npcName = "Change III",
        depletedId = 30457,
        itemId = 55649,
        amount = 2
    }},
    input = {{
        itemId = 7936,
        itemName = "Pure essence",
        amount = 800,
        slotId = 15
    }},
    reward_xp = {{
        skillId = 28,
        skillName = "Necromancy",
        xp = 4420.0
    }},
    reward_items = {{
        itemId = 55667,
        itemName = "Impure essence",
        amount = 300
    }},
    reward_input = {},
    customReward = "",
    souls = {},
    EctoplasmRewardAmount = 15
}}

constants.input_items = {{
    itemId = 526,
    itemName = "Bones",
    stackable = false
}, {
    itemId = 532,
    itemName = "Big bones",
    stackable = false
}, {
    itemId = 534,
    itemName = "Baby dragon bones",
    stackable = false
}, {
    itemId = 536,
    itemName = "Dragon bones",
    stackable = false
}, {
    itemId = 1734,
    itemName = "Thread",
    stackable = true
}, {
    itemId = 4089,
    itemName = "Mystic hat",
    stackable = false
}, {
    itemId = 4091,
    itemName = "Mystic robe top",
    stackable = false
}, {
    itemId = 4093,
    itemName = "Mystic robe bottom",
    stackable = false
}, {
    itemId = 4095,
    itemName = "Mystic gloves",
    stackable = false
}, {
    itemId = 4097,
    itemName = "Mystic boots",
    stackable = false
}, {
    itemId = 4834,
    itemName = "Ourg bones",
    stackable = false
}, {
    itemId = 6729,
    itemName = "Dagannoth bones",
    stackable = false
}, {
    itemId = 6812,
    itemName = "Wyvern bones",
    stackable = false
}, {
    itemId = 7936,
    itemName = "Pure essence",
    stackable = false
}, {
    itemId = 14793,
    itemName = "Ourg bones",
    stackable = false
}, {
    itemId = 18832,
    itemName = "Frost dragon bones",
    stackable = false
}, {
    itemId = 24992,
    itemName = "Hood of subjugation",
    stackable = false
}, {
    itemId = 24995,
    itemName = "Garb of subjugation",
    stackable = false
}, {
    itemId = 24998,
    itemName = "Gown of subjugation",
    stackable = false
}, {
    itemId = 25004,
    itemName = "Boots of subjugation",
    stackable = false
}, {
    itemId = 25007,
    itemName = "Gloves of subjugation",
    stackable = false
}, {
    itemId = 25835,
    itemName = "Spider silk hood",
    stackable = false
}, {
    itemId = 25837,
    itemName = "Spider silk robe top",
    stackable = false
}, {
    itemId = 25839,
    itemName = "Spider silk robe bottom",
    stackable = false
}, {
    itemId = 25841,
    itemName = "Spider silk boots",
    stackable = false
}, {
    itemId = 25843,
    itemName = "Spider silk gloves",
    stackable = false
}, {
    itemId = 29864,
    itemName = "Algarum thread",
    stackable = true
}, {
    itemId = 30209,
    itemName = "Airut bones",
    stackable = false
}, {
    itemId = 35008,
    itemName = "Hardened dragon bones",
    stackable = false
}, {
    itemId = 35010,
    itemName = "Reinforced dragon bones",
    stackable = false
}, {
    itemId = 43975,
    itemName = "Summerdown wool",
    stackable = false
}, {
    itemId = 43977,
    itemName = "Springsheared wool",
    stackable = false
}, {
    itemId = 43979,
    itemName = "Winterwold wool",
    stackable = false
}, {
    itemId = 43981,
    itemName = "Fallfaced wool",
    stackable = false
}, {
    itemId = 48075,
    itemName = "Dinosaur bones",
    stackable = false
}, {
    itemId = 49768,
    itemName = "Everlight trumpet",
    stackable = false
}, {
    itemId = 51858,
    itemName = "Dragonkin bones",
    stackable = false
}, {
    itemId = 55220,
    itemName = "Kili's tools",
    stackable = false
}, {
    itemId = 55228,
    itemName = "Bucket of powerful slime",
    stackable = false
}, {
    itemId = 55243,
    itemName = "Grubby bones",
    stackable = false
}, {
    itemId = 55598,
    itemName = "Weak necroplasm",
    stackable = true
}, {
    itemId = 55599,
    itemName = "Lesser necroplasm",
    stackable = true
}, {
    itemId = 55600,
    itemName = "Greater necroplasm",
    stackable = true
}, {
    itemId = 55602,
    itemName = "Lesser unensouled bar",
    stackable = false
}, {
    itemId = 55604,
    itemName = "Unensouled bar",
    stackable = false
}, {
    itemId = 55606,
    itemName = "Greater unensouled bar",
    stackable = false
}, {
    itemId = 55623,
    itemName = "Broken memento",
    stackable = false
}, {
    itemId = 55625,
    itemName = "Fragile memento",
    stackable = false
}, {
    itemId = 55627,
    itemName = "Spirit memento",
    stackable = false
}, {
    itemId = 55629,
    itemName = "Robust memento",
    stackable = false
}, {
    itemId = 55631,
    itemName = "Powerful memento",
    stackable = false
}}

constants.makeXData = {{
    itemId = 55638,
    itemName = "Elemental I",
    requiredItems = {{
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 3
    }}
}, {
    itemId = 55639,
    itemName = "Elemental II",
    requiredItems = {{
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 3
    }, {
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    itemId = 55640,
    itemName = "Elemental III",
    requiredItems = {{
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 3
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    itemId = 55647,
    itemName = "Change I",
    requiredItems = {{
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 1
    }}
}, {
    itemId = 55648,
    itemName = "Change II",
    requiredItems = {{
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 1
    }}
}, {
    itemId = 55649,
    itemName = "Change III",
    requiredItems = {{
        itemId = 55597,
        itemName = "Powerful ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 1
    }}
}, {
    itemId = 55644,
    itemName = "Commune I",
    requiredItems = {{
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 4
    }}
}, {
    itemId = 55645,
    itemName = "Commune II",
    requiredItems = {{
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 4
    }}
}, {
    itemId = 55646,
    itemName = "Commune III",
    requiredItems = {{
        itemId = 55597,
        itemName = "Powerful ghostly ink",
        stackable = true,
        amount = 4
    }}
}, {
    itemId = 55641,
    itemName = "Reagent I",
    requiredItems = {{
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    itemId = 55642,
    itemName = "Reagent II",
    requiredItems = {{
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 3
    }}
}, {
    itemId = 55643,
    itemName = "Reagent III",
    requiredItems = {{
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 3
    }}
}, {
    itemId = 55659,
    itemName = "Attraction I",
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    itemId = 55660,
    itemName = "Attraction II",
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55597,
        itemName = "Powerful ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 1
    }}
}, {
    itemId = 55661,
    itemName = "Attraction III",
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 2
    }, {
        itemId = 55597,
        itemName = "Powerful ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    itemId = 55656,
    itemName = "Protection I",
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 1
    }}
}, {
    itemId = 55657,
    itemName = "Protection II",
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    itemId = 55658,
    itemName = "Protection III",
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 2
    }, {
        itemId = 55597,
        itemName = "Powerful ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    itemId = 55650,
    itemName = "Multiply I",
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 1
    }}
}, {
    itemId = 55651,
    itemName = "Multiply II",
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    itemId = 55652,
    itemName = "Multiply III",
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 2
    }, {
        itemId = 55597,
        itemName = "Powerful ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    itemId = 55653,
    itemName = "Speed I",
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 1
    }}
}, {
    itemId = 55654,
    itemName = "Speed II",
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    itemId = 55655,
    itemName = "Speed III",
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 2
    }, {
        itemId = 55597,
        itemName = "Powerful ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    itemId = 55662,
    itemName = "Basic ritual candle",
    requiredItems = {{
        itemId = 55634,
        itemName = "Basic ritual candle",
        stackable = true,
        amount = 1
    }}
}, {
    itemId = 55663,
    itemName = "Candle",
    requiredItems = {{
        itemId = 33,
        itemName = "White candle (lit)",
        stackable = false,
        amount = 1
    }}
}, {
    itemId = 55664,
    itemName = "Regular ritual candle",
    requiredItems = {{
        itemId = 55635,
        itemName = "Regular ritual candle",
        stackable = true,
        amount = 1
    }}
}, {
    itemId = 55665,
    itemName = "Greater ritual candle",
    requiredItems = {{
        itemId = 55636,
        itemName = "Greater ritual candle",
        stackable = true,
        amount = 1
    }}
}, {
    itemId = 55666,
    itemName = "Greater flaming skull",
    requiredItems = {{
        itemId = 55637,
        itemName = "Greater flaming skull",
        stackable = true,
        amount = 1
    }}
}}

constants.lights = {{
    slot = 1,
    itemId = 55662,
    npcId = 30482,
    depletedId = 30483,
    requiredId = 55634,
    stackable = true
}, {
    slot = 2,
    itemId = 55663,
    npcId = 30484,
    depletedId = 30485,
    requiredId = 33,
    stackable = false
}, {
    slot = 3,
    itemId = 55664,
    npcId = 30486,
    depletedId = 30487,
    requiredId = 55635,
    stackable = true
}, {
    slot = 4,
    itemId = 55665,
    npcId = 30488,
    depletedId = 30489,
    requiredId = 55636,
    stackable = true
}, {
    slot = 5,
    itemId = 55666,
    npcId = 30490,
    depletedId = 30491,
    requiredId = 55637,
    stackable = true
}}

constants.alternations = {{
    npcId = 30476,
    depletedId = 30477,
    npcName = "Attraction I",
    itemId = 55659,
    itemName = "Attraction I",
    requiredLevel = 61,
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    npcId = 30478,
    depletedId = 30479,
    npcName = "Attraction II",
    itemId = 55660,
    itemName = "Attraction II",
    requiredLevel = 95,
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55597,
        itemName = "Powerful ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 1
    }}
}, {
    npcId = 30480,
    depletedId = 30481,
    npcName = "Attraction III",
    itemId = 55661,
    itemName = "Attraction III",
    requiredLevel = 107,
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 2
    }, {
        itemId = 55597,
        itemName = "Powerful ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    npcId = 30470,
    depletedId = 30471,
    npcName = "Protection I",
    itemId = 55656,
    itemName = "Protection I",
    requiredLevel = 36,
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 1
    }}
}, {
    npcId = 30472,
    depletedId = 30473,
    npcName = "Protection II",
    itemId = 55657,
    itemName = "Protection II",
    requiredLevel = 69,
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    npcId = 30474,
    depletedId = 30475,
    npcName = "Protection III",
    itemId = 55658,
    itemName = "Protection III",
    requiredLevel = 101,
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 2
    }, {
        itemId = 55597,
        itemName = "Powerful ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    npcId = 30458,
    depletedId = 30459,
    npcName = "Multiply I",
    itemId = 55650,
    itemName = "Multiply I",
    requiredLevel = 30,
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 1
    }}
}, {
    npcId = 30460,
    depletedId = 30461,
    npcName = "Multiply II",
    itemId = 55651,
    itemName = "Multiply II",
    requiredLevel = 66,
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    npcId = 30462,
    depletedId = 30463,
    npcName = "Multiply III",
    itemId = 55652,
    itemName = "Multiply III",
    requiredLevel = 103,
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 2
    }, {
        itemId = 55597,
        itemName = "Powerful ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    npcId = 30464,
    depletedId = 30465,
    npcName = "Speed I",
    itemId = 55653,
    itemName = "Speed I",
    requiredLevel = 45,
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55594,
        itemName = "Basic ghostly ink",
        stackable = true,
        amount = 1
    }}
}, {
    npcId = 30466,
    depletedId = 30467,
    npcName = "Speed II",
    itemId = 55654,
    itemName = "Speed II",
    requiredLevel = 81,
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 1
    }, {
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55595,
        itemName = "Regular ghostly ink",
        stackable = true,
        amount = 2
    }}
}, {
    npcId = 30468,
    depletedId = 30469,
    npcName = "Speed III",
    itemId = 55655,
    itemName = "Speed III",
    requiredLevel = 102,
    requiredItems = {{
        itemId = 55336,
        itemName = "Ectoplasm",
        stackable = true,
        amount = 2
    }, {
        itemId = 55597,
        itemName = "Powerful ghostly ink",
        stackable = true,
        amount = 2
    }, {
        itemId = 55596,
        itemName = "Greater ghostly ink",
        stackable = true,
        amount = 2
    }}
}}

constants.active_overloads = {{
    name = "Overloaded",
    structId = 23129,
    statusId = 26093,
    minBoost = 3,
    levelPercentage = 15
}, {
    name = "Overload Salve Active",
    structId = 29605,
    statusId = 33198,
    minBoost = 3,
    levelPercentage = 15
}, {
    name = "Supreme Overload Potion Active",
    structId = 29606,
    statusId = 33210,
    minBoost = 4,
    levelPercentage = 16
}, {
    name = "Supreme Overload Salve Active",
    structId = 29607,
    statusId = 33222,
    minBoost = 4,
    levelPercentage = 16
}, {
    name = "Elder Overload Active",
    structId = 36922,
    statusId = 49039,
    minBoost = 5,
    levelPercentage = 17
}}

constants.necromancyBoosts = {{
    minBoost = 1,
    levelPercentage = 8,
    itemIds = {{
        itemId = 55273,
        itemName = "Necromancy flask (1)"
    }, {
        itemId = 55314,
        itemName = "Necromancy potion (1)"
    }, {
        itemId = 55271,
        itemName = "Necromancy flask (2)"
    }, {
        itemId = 55312,
        itemName = "Necromancy potion (2)"
    }, {
        itemId = 55269,
        itemName = "Necromancy flask (3)"
    }, {
        itemId = 55310,
        itemName = "Necromancy potion (3)"
    }, {
        itemId = 55267,
        itemName = "Necromancy flask (4)"
    }, {
        itemId = 55308,
        itemName = "Necromancy potion (4)"
    }, {
        itemId = 55265,
        itemName = "Necromancy flask (5)"
    }, {
        itemId = 55263,
        itemName = "Necromancy flask (6)"
    }}
}, {
    minBoost = 2,
    levelPercentage = 12,
    itemIds = {{
        itemId = 55285,
        itemName = "Super necromancy flask (1)"
    }, {
        itemId = 55322,
        itemName = "Super necromancy (1)"
    }, {
        itemId = 55283,
        itemName = "Super necromancy flask (2)"
    }, {
        itemId = 55320,
        itemName = "Super necromancy (2)"
    }, {
        itemId = 55281,
        itemName = "Super necromancy flask (3)"
    }, {
        itemId = 55318,
        itemName = "Super necromancy (3)"
    }, {
        itemId = 55279,
        itemName = "Super necromancy flask (4)"
    }, {
        itemId = 55316,
        itemName = "Super necromancy (4)"
    }, {
        itemId = 55277,
        itemName = "Super necromancy flask (5)"
    }, {
        itemId = 55275,
        itemName = "Super necromancy flask (6)"
    }}
}, {
    minBoost = 3,
    levelPercentage = 15,
    itemIds = {{
        itemId = 55297,
        itemName = "Extreme necromancy flask (1)"
    }, {
        itemId = 55330,
        itemName = "Extreme necromancy (1)"
    }, {
        itemId = 55295,
        itemName = "Extreme necromancy flask (2)"
    }, {
        itemId = 55328,
        itemName = "Extreme necromancy (2)"
    }, {
        itemId = 55293,
        itemName = "Extreme necromancy flask (3)"
    }, {
        itemId = 55326,
        itemName = "Extreme necromancy (3)"
    }, {
        itemId = 55291,
        itemName = "Extreme necromancy flask (4)"
    }, {
        itemId = 55324,
        itemName = "Extreme necromancy (4)"
    }, {
        itemId = 55289,
        itemName = "Extreme necromancy flask (5)"
    }, {
        itemId = 55287,
        itemName = "Extreme necromancy flask (6)"
    }}
}, {
    minBoost = 3,
    levelPercentage = 15,
    itemIds = {{
        itemId = 15335,
        itemName = "Overload (1)"
    }, {
        itemId = 23536,
        itemName = "Overload flask (1)"
    }, {
        itemId = 15334,
        itemName = "Overload (2)"
    }, {
        itemId = 23535,
        itemName = "Overload flask (2)"
    }, {
        itemId = 15333,
        itemName = "Overload (3)"
    }, {
        itemId = 23534,
        itemName = "Overload flask (3)"
    }, {
        itemId = 15332,
        itemName = "Overload (4)"
    }, {
        itemId = 23533,
        itemName = "Overload flask (4)"
    }, {
        itemId = 23532,
        itemName = "Overload flask (5)"
    }, {
        itemId = 23531,
        itemName = "Overload flask (6)"
    }}
}, {
    minBoost = 5,
    levelPercentage = 17,
    itemIds = {{
        itemId = 49042,
        itemName = "Elder overload salve (1)"
    }, {
        itemId = 49044,
        itemName = "Elder overload salve (2)"
    }, {
        itemId = 49046,
        itemName = "Elder overload salve (3)"
    }, {
        itemId = 49048,
        itemName = "Elder overload salve (4)"
    }, {
        itemId = 49050,
        itemName = "Elder overload salve (5)"
    }, {
        itemId = 49052,
        itemName = "Elder overload salve (6)"
    }, {
        itemId = 49054,
        itemName = "Elder overload salve (6)"
    }}
}, {
    minBoost = 3,
    levelPercentage = 15,
    itemIds = {{
        itemId = 33236,
        itemName = "Holy overload potion (1)"
    }, {
        itemId = 33238,
        itemName = "Holy overload potion (2)"
    }, {
        itemId = 33240,
        itemName = "Holy overload potion (3)"
    }, {
        itemId = 33242,
        itemName = "Holy overload potion (4)"
    }, {
        itemId = 33244,
        itemName = "Holy overload potion (5)"
    }, {
        itemId = 33246,
        itemName = "Holy overload potion (6)"
    }}
}, {
    minBoost = 5,
    levelPercentage = 17,
    itemIds = {{
        itemId = 49029,
        itemName = "Elder overload potion (1)"
    }, {
        itemId = 49031,
        itemName = "Elder overload potion (2)"
    }, {
        itemId = 49033,
        itemName = "Elder overload potion (3)"
    }, {
        itemId = 49035,
        itemName = "Elder overload potion (4)"
    }, {
        itemId = 49037,
        itemName = "Elder overload potion (5)"
    }, {
        itemId = 49039,
        itemName = "Elder overload potion (6)"
    }}
}, {
    minBoost = 3,
    levelPercentage = 15,
    itemIds = {{
        itemId = 33248,
        itemName = "Searing overload potion (1)"
    }, {
        itemId = 33250,
        itemName = "Searing overload potion (2)"
    }, {
        itemId = 33252,
        itemName = "Searing overload potion (3)"
    }, {
        itemId = 33254,
        itemName = "Searing overload potion (4)"
    }, {
        itemId = 33256,
        itemName = "Searing overload potion (5)"
    }, {
        itemId = 33258,
        itemName = "Searing overload potion (6)"
    }}
}, {
    minBoost = 3,
    levelPercentage = 15,
    itemIds = {{
        itemId = 33188,
        itemName = "Overload salve (1)"
    }, {
        itemId = 33190,
        itemName = "Overload salve (2)"
    }, {
        itemId = 33192,
        itemName = "Overload salve (3)"
    }, {
        itemId = 33194,
        itemName = "Overload salve (4)"
    }, {
        itemId = 33196,
        itemName = "Overload salve (5)"
    }, {
        itemId = 33198,
        itemName = "Overload salve (6)"
    }}
}, {
    minBoost = 4,
    levelPercentage = 16,
    itemIds = {{
        itemId = 33200,
        itemName = "Supreme overload potion (1)"
    }, {
        itemId = 33202,
        itemName = "Supreme overload potion (2)"
    }, {
        itemId = 33204,
        itemName = "Supreme overload potion (3)"
    }, {
        itemId = 33206,
        itemName = "Supreme overload potion (4)"
    }, {
        itemId = 33208,
        itemName = "Supreme overload potion (5)"
    }, {
        itemId = 33210,
        itemName = "Supreme overload potion (6)"
    }}
}, {
    minBoost = 4,
    levelPercentage = 16,
    itemIds = {{
        itemId = 33212,
        itemName = "Supreme overload salve (1)"
    }, {
        itemId = 33214,
        itemName = "Supreme overload salve (2)"
    }, {
        itemId = 33216,
        itemName = "Supreme overload salve (3)"
    }, {
        itemId = 33218,
        itemName = "Supreme overload salve (4)"
    }, {
        itemId = 33220,
        itemName = "Supreme overload salve (5)"
    }, {
        itemId = 33222,
        itemName = "Supreme overload salve (6)"
    }}
}, {
    minBoost = 3,
    levelPercentage = 15,
    itemIds = {{
        itemId = 48229,
        itemName = "Aggroverload (1)"
    }, {
        itemId = 48231,
        itemName = "Aggroverload (2)"
    }, {
        itemId = 48233,
        itemName = "Aggroverload (3)"
    }, {
        itemId = 48235,
        itemName = "Aggroverload (4)"
    }, {
        itemId = 48237,
        itemName = "Aggroverload (5)"
    }, {
        itemId = 48239,
        itemName = "Aggroverload (6)"
    }}
}, {
    minBoost = 3,
    levelPercentage = 15,
    itemIds = {{
        itemId = 50867,
        itemName = "Holy aggroverload (1)"
    }, {
        itemId = 50869,
        itemName = "Holy aggroverload (2)"
    }, {
        itemId = 50871,
        itemName = "Holy aggroverload (3)"
    }, {
        itemId = 50873,
        itemName = "Holy aggroverload (4)"
    }, {
        itemId = 50875,
        itemName = "Holy aggroverload (5)"
    }, {
        itemId = 50877,
        itemName = "Holy aggroverload (6)"
    }, {
        itemId = 50879,
        itemName = "Holy aggroverload (6)"
    }, {
        itemId = 50909,
        itemName = "Holy aggroverload (6)"
    }}
}, {
    minBoost = 2,
    levelPercentage = 12,
    itemIds = {{
        itemId = 28205,
        itemName = "Super Zamorak brew (1)"
    }, {
        itemId = 28225,
        itemName = "Super Zamorak brew flask (1)"
    }, {
        itemId = 28203,
        itemName = "Super Zamorak brew (2)"
    }, {
        itemId = 28223,
        itemName = "Super Zamorak brew flask (2)"
    }, {
        itemId = 28201,
        itemName = "Super Zamorak brew (3)"
    }, {
        itemId = 28221,
        itemName = "Super Zamorak brew flask (3)"
    }, {
        itemId = 28199,
        itemName = "Super Zamorak brew (4)"
    }, {
        itemId = 28219,
        itemName = "Super Zamorak brew flask (4)"
    }, {
        itemId = 28217,
        itemName = "Super Zamorak brew flask (5)"
    }, {
        itemId = 28215,
        itemName = "Super Zamorak brew flask (6)"
    }}
}}

constants.ELITE_XP_TABLE = {0, 0, 830, 1861, 2902, 3980, 5126, 6380, 7787, 9400, 11275, 13605, 16372, 19656, 23546,
                            28134, 33520, 39809, 47109, 55535, 65209, 77190, 90811, 106221, 123573, 143025, 164742,
                            188893, 215651, 245196, 277713, 316311, 358547, 404634, 454796, 509259, 568254, 632019,
                            700797, 774834, 854383, 946227, 1044569, 1149696, 1261903, 1381488, 1508756, 1644015,
                            1787581, 1939773, 2100917, 2283490, 2476369, 2679917, 2894505, 3120508, 3358307, 3608290,
                            3870846, 4146374, 4435275, 4758122, 5096111, 5449685, 5819299, 6205407, 6608473, 7028964,
                            7467354, 7924122, 8399751, 8925664, 9472665, 10041285, 10632061, 11245538, 11882262,
                            12542789, 13227679, 13937496, 14672812, 15478994, 16313404, 17176661, 18069395, 18992239,
                            19945833, 20930821, 21947856, 22997593, 24080695, 25259906, 26475754, 27728955, 29020233,
                            30350318, 31719944, 33129852, 34580790, 36073511, 37608773, 39270442, 40978509, 42733789,
                            44537107, 46389292, 48291180, 50243611, 52247435, 54303504, 56412678, 58575824, 60793812,
                            63067521, 65397835, 67785643, 70231841, 72737330, 75303019, 77929820, 80618654, 83370445,
                            86186124, 89066630, 92012904, 95025896, 98106559, 101255855, 104474750, 107764216,
                            111125230, 114558777, 118065845, 121647430, 125304532, 129038159, 132849323, 136739041,
                            140708338, 144758242, 148889790, 153104021, 157401983, 161784728, 166253312, 170808801,
                            175452262, 180184770, 185007406, 189921255, 194927409}

constants.REGULAR_XP_TABLE = {0, 83, 174, 276, 388, 512, 650, 801, 969, 1154, 1358, 1584, 1833, 2107, 2411, 2746, 3115,
                              3523, 3973, 4470, 5018, 5624, 6291, 7028, 7842, 8740, 9730, 10824, 12031, 13363, 14833,
                              16456, 18247, 20224, 22406, 24815, 27473, 30408, 33648, 37224, 41171, 45529, 50339, 55649,
                              61512, 67983, 75127, 83014, 91721, 101333, 111945, 123660, 136594, 150872, 166636, 184040,
                              203254, 224466, 247886, 273742, 302288, 333804, 368599, 407015, 449428, 496254, 547953,
                              605032, 668051, 737627, 814445, 899257, 992895, 1096278, 1210421, 1336443, 1475581,
                              1629200, 1798808, 1986068, 2192818, 2421087, 2673114, 2951373, 3258594, 3597792, 3972294,
                              4385776, 4842295, 5346332, 5902831, 6517253, 7195629, 7944614, 8771558, 9684577, 10692629,
                              11805606, 13034431, 14391160, 15889109, 17542976, 19368992, 21385073, 23611006, 26068632,
                              28782069, 31777943, 35085654, 38737661, 42769801, 47221641, 52136869, 57563718, 63555443,
                              70170840, 77474828, 85539082, 94442737, 104273167}

constants.GLYPHS_1 = {30429, 30429, 30432, 30428, 30428, 30492, 30498, 30428, 30428, 30428, 30434, 30435, 30436, 30437,
                      30438, 30439, 30440, 30441, 30442, 30443, 30444, 30445, 30446, 30447, 30448, 30449, 30450, 30451,
                      30452, 30453, 30454, 30455, 30456, 30457, 30458, 30459, 30460, 30461, 30462, 30463, 30464, 30465,
                      30466, 30467, 30468, 30469, 30470, 30471, 30472, 30473, 30474, 30475, 30476, 30477, 30478, 30479,
                      30480, 30481, 30428}
constants.GLYPHS_2 = {30428, 30429, 30432, 30428, 30428, 30492, 30498, 30428, 30428, 30428, 30434, 30435, 30436, 30437,
                      30438, 30439, 30440, 30441, 30442, 30443, 30444, 30445, 30446, 30447, 30448, 30449, 30450, 30451,
                      30452, 30453, 30454, 30455, 30456, 30457, 30458, 30459, 30460, 30461, 30462, 30463, 30464, 30465,
                      30466, 30467, 30468, 30469, 30470, 30471, 30472, 30473, 30474, 30475, 30476, 30477, 30478, 30479,
                      30480, 30481, 30428}

constants.GLYPHS_3 = {30431, 30431, 30433, 30430, 30430, 30430, 30499, 30430, 30430, 30430, 30430, 30430, 30430, 30430,
                      30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430,
                      30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430,
                      30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430,
                      30430, 30430, 30482, 30483, 30484, 30485, 30486, 30487, 30488, 30489, 30490, 30491, 30430}

constants.GLYPHS_4 = {30430, 30431, 30433, 30430, 30430, 30430, 30499, 30430, 30430, 30430, 30430, 30430, 30430, 30430,
                      30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430,
                      30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430,
                      30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430, 30430,
                      30430, 30430, 30482, 30483, 30484, 30485, 30486, 30487, 30488, 30489, 30490, 30491, 30430}

constants.PEDESTAL_IDS = {127319, 127225, 127319, 127319, 127319, 127319, 127319, 127319, 127319, 127319, 127320,
                          127321, 127322, 127323, 127324, 127325, 127326, 127327, 127328, 127329, 127330, 127331,
                          127332, 127333, 127334, 127335, 127336, 127337, 127338, 127339, 127340, 127341, 127342,
                          127343, 127344, 127345, 127346, 127347, 127348, 127349, 127350, 127351, 127352, 127353,
                          127354, 127355, 127356, 127357, 127358, 127359, 127360, 127361, 127362, 127363, 127364,
                          127365, 127366, 127367, 127368, 127163, 127166, 127148, 127319}

function constants.getRitualBySlotId(slotId)
    for i = 1, #constants.rituals_data do
        for j = 1, #constants.rituals_data[i].input do
            if (constants.rituals_data[i].input[j].slotId == slotId) then
                return constants.rituals_data[i]
            end
        end
    end
    return nil
end

function constants.getRitualByName(name)
    for i = 1, #constants.rituals_data do
        if (string.lower(constants.rituals_data[i].name) == string.lower(name)) then
            return constants.rituals_data[i]
        end
    end
    return nil
end

function constants.getRitualByDbrowId(dbrowId)
    for i = 1, #constants.rituals_data do
        if (constants.rituals_data[i].dbrowId == dbrowId) then
            return constants.rituals_data[i]
        end
    end
    return nil
end

function constants.getInputItemIndexByName(itemName)
    for i = 1, #constants.input_items do
        if (string.lower(constants.input_items[i].itemName) == string.lower(itemName)) then
            return i
        end
    end
    return -1
end

function constants.getInputItemIndexByItemId(itemId)
    for i = 1, #constants.input_items do
        if (constants.input_items[i].itemId == itemId) then
            return i
        end
    end
    return -1
end

function constants.getMakeXData(itemId)
    for i = 1, #constants.makeXData do
        if (constants.makeXData[i].itemId == itemId) then
            return constants.makeXData[i]
        end
    end
    return -1
end

function constants.getLight(npcId)
    for i = 1, #constants.lights do
        if (constants.lights[i].npcId == npcId or constants.lights[i].depletedId == npcId) then
            return constants.lights[i]
        end
    end
    return nil
end

function constants.getAlternation(npcId)
    for i = 1, #constants.alternations do
        if (constants.alternations[i].npcId == npcId or constants.alternations[i].depletedId == npcId) then
            return constants.alternations[i]
        end
    end
    return nil
end

function constants.getAlternationByName(npcName)
    for i = 1, #constants.alternations do
        if (string.lower(constants.alternations[i].npcName) == string.lower(npcName)) then
            return constants.alternations[i]
        end
    end
    return nil
end

function constants.getLevelForXp(xp, maxValue, elite)
    if maxValue <= 0 then
        return 1
    end
    if elite then
        for i = #constants.ELITE_XP_TABLE, 1, -1 do
            if xp >= constants.ELITE_XP_TABLE[i] then
                return i > 120 and 120 or i
            end
        end
    end
    local exp = xp
    for lvl = maxValue - 1, 0, -1 do
        if constants.REGULAR_XP_TABLE[lvl + 1] <= exp then
            return lvl + 1
        end
    end
    return maxValue
end

function constants.isDepleted(actualId)
    return actualId == 30435 or actualId == 30437 or actualId == 30439 or actualId == 30441 or actualId == 30443 or
               actualId == 30445 or actualId == 30447 or actualId == 30449 or actualId == 30451 or actualId == 30453 or
               actualId == 30455 or actualId == 30457 or actualId == 30459 or actualId == 30461 or actualId == 30463 or
               actualId == 30465 or actualId == 30467 or actualId == 30469 or actualId == 30471 or actualId == 30473 or
               actualId == 30475 or actualId == 30477 or actualId == 30479 or actualId == 30481 or actualId == 30483 or
               actualId == 30485 or actualId == 30487 or actualId == 30489 or actualId == 30491
end

return constants