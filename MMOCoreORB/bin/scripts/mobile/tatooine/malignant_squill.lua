malignant_squill = Creature:new {
	objectName = "@mob/creature_names:malignant_squill",
	socialGroup = "squill",
	faction = "",
	mobType = MOB_CARNIVORE,
	level = 50,
	chanceHit = 0.5,
	damageMin = 420,
	damageMax = 550,
	baseXp = 4916,
	baseHAM = 9300,
	baseHAMmax = 11300,
	armor = 1,
	resists = {5,5,110,5,200,5,5,5,-1},
	meatType = "meat_carnivore",
	meatAmount = 25,
	hideType = "hide_leathery",
	hideAmount = 25,
	boneType = "bone_mammal",
	boneAmount = 20,
	milk = 0,
	tamingChance = 0.1,
	ferocity = 12,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/squill_hue.iff"},
	hues = { 24, 25, 26, 27, 28, 29, 30, 31 },
	controlDeviceTemplate = "object/intangible/pet/malignant_squill_hue.iff",
	scale = 1.35,
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = { {"strongdisease",""}, {"stunattack",""} },
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(malignant_squill, "malignant_squill")
