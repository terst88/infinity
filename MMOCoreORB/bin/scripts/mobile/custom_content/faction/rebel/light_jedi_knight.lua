light_jedi_knight = Creature:new {
	customName = "Light Jedi Knight",	
	socialGroup = "rebel",
	faction = "rebel",
	mobType = MOB_NPC,
	level = 300,
	chanceHit = 23.5,
	damageMin = 1845,
	damageMax = 2800,
	baseXp = 25266,
	baseHAM = 261000,
	baseHAMmax = 320000,
	armor = 2,
	-- {kinetic, energy, electric, stun, blast, heat, cold, acid, ls}
	resists = {75,75,75,75,75,75,75,75,-1},
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
	creatureBitmask = KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_jedi_trainer_old_human_male_01.iff",
		"object/mobile/dressed_jedi_trainer_chiss_male_01.iff",
		"object/mobile/dressed_jedi_trainer_nikto_male_01.iff",
		"object/mobile/dressed_jedi_trainer_twilek_female_01.iff",
    	},
	
	lootGroups = {
		{
			groups = { -- DarkJedi LootGroup
				{group = "holocron_light", chance = 4000000},
				{group = "dark_jedi_common", chance = 6000000},
			},
			lootChance = 5500000,
		},
		{
			groups = {
				{group = "power_crystals", chance = 1500000},
				{group = "named_crystals", chance = 2500000},
				{group = "clothing_attachments", chance = 1000000},
				{group = "melee_weapons", chance = 2500000},
				{group = "dark_jedi_common", chance = 2500000},
			},
			lootChance = 6500000,
		},
		{
			groups = {
				{group = "clothing_attachments", chance = 1000000},
				{group = "rifles", chance = 2500000},
				{group = "pistols", chance = 2000000},
				{group = "carbines", chance = 2500000},
				{group = "dark_jedi_common", chance = 2000000},
			},
			lootChance = 4500000,
		},
		{
			groups = {
				{group = "clothing_attachments", chance = 1000000},
				{group = "rifles", chance = 2000000},
				{group = "pistols", chance = 2500000},
				{group = "carbines", chance = 2500000},
				{group = "dark_jedi_common", chance = 2000000},
			},
			lootChance = 3500000,
		},
		{ 	-- Jedi Specific Loot Group 1 - 11%
			groups ={
				{group = "jedi_clothing_attachments", chance = 10000000}				
			},
			lootChance = 1100000,
		},
		{ 	-- Jedi Specific Loot Group 2 - 14%
			groups ={
				{group = "jedi_clothing_attachments", chance = 5000000},	-- 12% * 50% = 6%
				{group = "ngerobes1", chance = 5000000}	                    -- 12% * 50% = 6%
		
			},
			lootChance = 1400000,
		},
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "dark_jedi_weapons_gen3",
	secondaryWeapon = "none",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(lightsabermaster,forcepowermaster),
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(light_jedi_knight, "light_jedi_knight")
