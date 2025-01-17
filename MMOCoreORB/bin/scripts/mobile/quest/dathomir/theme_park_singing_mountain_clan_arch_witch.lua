theme_park_singing_mountain_clan_arch_witch = Creature:new {
  objectName = "@mob/creature_names:singing_mtn_clan_arch_witch",
  randomNameType = NAME_GENERIC,
  randomNameTag = true,
	mobType = MOB_NPC,
  socialGroup = "mtn_clan",
  faction = "mtn_clan",
  level = 107,
  chanceHit = 1,
  damageMin = 645,
  damageMax = 1000,
  baseXp = 10174,
  baseHAM = 24000,
  baseHAMmax = 30000,
  armor = 2,
  resists = {30,5,5,30,30,30,30,30,-1},
  meatType = "",
  meatAmount = 0,
  hideType = "",
  hideAmount = 0,
  boneType = "",
  boneAmount = 0,
  milk = 0,
  tamingChance = 0,
  ferocity = 0,
  pvpBitmask = NONE,
  creatureBitmask = PACK,
  optionsBitmask = AIENABLED + CONVERSABLE,
  diet = HERBIVORE,

  templates = {"object/mobile/dressed_dathomir_sing_mt_clan_arch_witch.iff"},
  lootGroups = {},
  primaryWeapon = "unarmed",
	secondaryWeapon = "none",
  conversationTemplate = "theme_park_smc_vurlene_aujante_mission_target_convotemplate",
  
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = {},
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(theme_park_singing_mountain_clan_arch_witch, "theme_park_singing_mountain_clan_arch_witch")
