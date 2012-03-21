local addon,ns = ...

local CFG = {}

CFG["Wowshell_UnitFrames"] = {
	zhCN = "精灵头像(运行环境)",
	zhTW = "精靈頭像(運行環境)",
	--enUS = "Wowshell_UnitFrames(Core)",
	icon = "Interface\\ICONS\\Spell_Shaman_Hex",
	handler = function()
		LibStub("AceConfigDialog-3.0"):Open("WSUnitFrame")
	end,
}
CFG["Wowshell_UFBlizzard"] = {
	zhCN = "暴雪风格",
	zhTW = "暴雪風格",
	--enUS = "Wowshell_UFBlizzard",
	icon = "Interface\\ICONS\\ACHIEVEMENT_GUILDPERK_FASTTRACK",
	handler = function()
		LibStub("AceConfigDialog-3.0"):Open("WSUnitFrame")
	end,
}
CFG["Wowshell_UFShell"] = {
	zhCN = "现代风格",
	zhTW = "現代風格",
	icon = "Interface\\ICONS\\ACHIEVEMENT_GUILDPERK_FASTTRACK_RANK2",
	handler = function()
		LibStub("AceConfigDialog-3.0"):Open("WSUnitFrame")
	end,
}
CFG["BlizzFacade"] = {
	zhCN = "暴雪动作条美化",
	zhTW = "暴雪動作條美化",
	icon = "Interface\\ICONS\\INV_Misc_EngGizmos_29",
	handler = function()
		LibStub('AceConfigDialog-3.0'):Open("BlizzFacade")
	end,
}
CFG["Dominos"] = {
	zhCN = "多米诺",
	zhTW = "多米諾",
	icon = "Interface\\AddOns\\Dominos\\Dominos",
}
CFG["Masque"] = {
	zhCN = "动作条美化",
	zhTW = "動作條美化",
	icon = "Interface\\ICONS\\Inv_Misc_Tournaments_Tabard_Human",
	handler = function()
		LibStub("AceConfigDialog-3.0"):Open("Masque")
	end,
}
CFG["Wowshell_Skyer"] = {
	zhCN = "额外动作条",
	zhTW = "額外動作條",
	icon = "Interface\\ICONS\\Spell_Misc_Emotionsad",
	handler = function()
		LibStub("AceConfigDialog-3.0"):Open("Skylark")
	end,
}
CFG["_NPCScan"] = {
	zhCN = "稀有怪搜寻器",
	zhTW = "稀有怪搜尋器",
	icon = "Interface\\ICONS\\ability_hunter_snipershot",
	handler = function()
		_NPCScan.SlashCommand("")	
	end,
}
CFG["Archy"] = {
	zhCN ="考古助手",
	zhTW ="考古助手",
	icon = "Interface\\ICONS\\trade_archaeology",
	handler = function()
		LibStub("AceConfigDialog-3.0"):Open("Archy")
	end,
}
CFG["Mapster"] = {
	zhCN = "地图增强",
	zhTW = "地圖增強",
	icon = "Interface\\ICONS\\inv_misc_map09",
	handler = function()
		--TODO
	end,
}
CFG["SexyMap"] = {
	zhCN = "性感小地图",
	zhTW = "性感小地圖",
	icon = "Interface\\ICONS\\inv_misc_food_59",
	handler = function()
		LibStub('AceConfigDialog-3.0'):Open('SexyMap')
	end,
}
CFG["TomTom"] = {
	zhCN = "导航助手",
	zhTW = "導航助手",
	icon = "Interface\\ICONS\\ability_mage_coldasice",
	handler = function()
		SlashCmdList["TOMTOM"]()
	end,
}
CFG["LFGForwarder"] = {
	zhCN = "组队频道转发",
	zhTW = "組隊頻道轉發",
	icon = "Interface\\ICONS\\SPELL_HOLY_BORROWEDTIME",
	handler = function()
		--no config
	end,
}
CFG["Wowshell_Buzz"] = {
	zhCN = "精灵聊天增强",
	zhTW = "精靈聊天增強",
	icon = "Interface\\ICONS\\Ability_Rogue_Disguise",
	handler = function()
		--TODO
	end,
}
CFG["CastDonut"] = {
	zhCN = "施法甜甜圈",
	zhTW = "施法甜甜圈",
	icon = "Interface\\ICONS\\inv_misc_food_153_doughnut",
	handler = function()
		--no config
	end,
}
CFG["Clique"] = {
	zhCN = "一键施法",
	zhTW = "一键施法",
	icon = "Interface\\AddOns\\Clique\\images\\icon_circle_128",
	handler = function()
		--TODO
	end,
}
CFG["CoolLine"] = {
	zhCN = "流线型法术冷却",
	zhTW = "流線型法術冷卻",
	icon = "Interface\\ICONS\\inv_throwingknife_06",
	handler = function()
		SlashCmdList.COOLLINE()
	end,
}
CFG["Decursive"] = {
	zhCN = "一键驱散",
	zhTW = "一鍵驅散",
	icon = "Interface\\AddOns\\Decursive\\iconON",
	handler = function()
		LibStub('AceConfigDialog-3.0'):Open("Decursive")
	end,
}
CFG["Ellipsis"] = {
	zhCN = "法术计时",
	zhTW = "法術計時",
	icon = "Interface\\ICONS\\Ability_Paladin_InfusionofLight",
	handler = function()
		Ellipsis:OpenOptFrame()
	end,
}
CFG["EventAlertMod"] = {
	zhCN = "法术特效提示",
	zhTW = "法術特效提示",
	icon = "Interface\\AddOns\\EventAlertMod\\Images\\Seed",
	handler = function()
		ShowUIPanel(EA_Options_Frame)
	end,
}
CFG["LearningAid"] = {
	zhCN = "技能助手",
	zhTW = "技能助手",
	icon = "Interface\\ICONS\\SPELL_HOLY_BORROWEDTIME",
	handler = function()
		LibStub("AceConfigDialog-3.0"):Open("LearningAidConfig")
	end,
}
CFG["Wowshell_Attackbar"] = {
	zhCN = "攻击计时条",
	zhTW = "攻擊計時條",
	icon = "Interface\\ICONS\\ability_warrior_challange",
	handler = function()
		WSAttackbar.options()
	end,
}
CFG["Wowshell_Castbar"] = {
	zhCN = "施法条增强",
	zhTW = "施法條增強",
	icon = "Interface\\ICONS\\ability_druid_typhoon",
	handler = function()
		WSCastingBar.options()
	end,
}
CFG["Wowshell_CC"] = {
	zhCN = "冷却计时",
	zhTW = "冷卻計時",
	icon = "Interface\\ICONS\\inv_misc_pocketwatch_02",
	handler = function()
		--TODO
	end,
}
CFG["Wowshell_Cenote"] = {
	zhCN = "法术特效计时器",
	zhTW = "法術特效計時器",
	icon = "Interface\\ICONS\\Spell_magic_polymorphrabbit",
	handler = function()
		--no config
	end,
}
CFG["Wowshell_CombatInfo"] = {
	zhCN = "战斗信息",
	zhTW = "戰鬥信息",
	icon = "Interface\\ICONS\\INV_Misc_Drum_06",
	handler = function()
		LibStub('AceConfigDialog-3.0'):Open'CombatInfo'
	end,
}
CFG["Wowshell_PartyCast"] = {
	zhCN = "小队施法",
	zhTW = "小隊施法",
	icon = "Interface\\ICONS\\INV_Misc_ShadowEgg",
	handler = function()
		LibStub("AceConfigDialog-3.0"):Open("PartyCast")
	end,
}
CFG["Bagnon_Forever"] = {
	zhCN = "玩家背包信息",
	zhTW = "玩家背包信息",
	icon = "Interface\\ICONS\\inv_misc_book_03",
	handler = function()
		-- no config
	end,
}
CFG["Bagnon_Tooltips"] = {
	zhCN = "背包提示增强",
	zhTW = "背包提示增强",
	icon = "Interface\\ICONS\\inv_enchant_formulagood_01",
	handler = function()
		-- no config
	end,
}
--CFG["Combuctor"],
--CFG["oGlow"],
--CFG["Postal"],
--CFG["RatingBuster"],
--CFG["ReforgeLite"],
--CFG["StealYourCarbon"],
--CFG["TheBurningTrade"],
--CFG["TradeLog"],
--CFG["TrinketMenu"],
--CFG["Wowshell_AutoGreed"],
--CFG["Wowshell_BagStatus"],
--CFG["Wowshell_ItemInf"],
--CFG["Wowshell_Merchant"],
--CFG["Wowshell_QuickEquip"],
--CFG["QuestHubber"],
--CFG["Wowshell_Quest"],
--CFG["Overachiever"],
--CFG["AutoLFG"],
--CFG["AutoTabared"],
--CFG["DBM-Core"],
--CFG["ezIcons"],
--CFG["Grid"],
--CFG["HealBot"],
--CFG["LookingForLoot"],
--CFG["Omen"],
--CFG["RaidAlerter"],
--CFG["Recount"],
--CFG["VuhDo"],
--CFG["Gladius"],
--CFG["CompleteEJ"],
--CFG["Examiner"],
--CFG["GatherMate2"],
--CFG["GearScoreLite"],
--CFG["HandyNotes"],
--CFG["Icetip"],
--CFG["NinjaPanel"],
--CFG["TradeskillInfo"],
--CFG["Wowshell_Gather"],
--CFG["Wowshell_HandyNotes"],
--CFG["Wowshell_Search"],
--CFG["Accountant_Classic"],
--CFG["AdvancedTradeSkillWindow"],
--CFG["Wowshell_EasyAH"],
--CFG["TotemTimers"],
--CFG["Wowshell_HunterHelper"],


ns.CFG = CFG 

