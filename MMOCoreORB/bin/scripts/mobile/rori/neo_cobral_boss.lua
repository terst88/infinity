neo_cobral_boss = Creature:new {
	objectName = "@mob/creature_names:cobral_boss",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "cobral",
	faction = "cobral",
	level = 30,
	chanceHit = 0.38,
	damageMin = 280,
	damageMax = 290,
	baseXp = 3097,
	baseHAM = 8300,
	baseHAMmax = 10100,
	armor = 0,
	resists = {0,0,0,40,40,40,40,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_cobral_boss_twk_female_01.iff",
		"object/mobile/dressed_cobral_boss_twk_male_01.iff"},

	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 2000000},
				{group = "wearables_all", chance = 2000000},
				{group = "carbines", chance = 2000000},
				{group = "tailor_components", chance = 2000000},
				{group = "loot_kit_parts", chance = 2000000}
			}
		},
		{
			groups = {
				{group = "inf_gold_4", chance =    100 * (100000)}
			},
			lootChance = 12 * (100000)
		},
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "pirate_weapons_medium",
	secondaryWeapon = "unarmed",
	conversationTemplate = "",
	reactionStf = "@npc_reaction/slang",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(brawlermaster,marksmanmaster),
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(neo_cobral_boss, "neo_cobral_boss")