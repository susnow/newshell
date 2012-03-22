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
CFG["Combuctor"] = {
	zhCN = "整合背包",
	zhTW = "整合背包",
	icon = "Interface\\ICONS\\inv_misc_enggizmos_39",
	handler = function()
		InterfaceOptionsFrame_Show();
		InterfaceOptionsFrame_OpenToCategory(name)
	end,
}
CFG["oGlow"] = {
	zhCN = "物品品质高亮",
	zhTW = "物品品質高亮",
	icon = "Interface\\ICONS\\SPELL_HOLY_BORROWEDTIME",
	handler = function()
		-- no config
	end,
}
CFG["Postal"] = {
	zhCN = "邮箱助手",
	zhTW = "郵箱助手",
	icon = "Interface\\ICONS\\achievement_guildperk_gmail",
	handler = function()
		-- no config
	end,
}
CFG["RatingBuster"] = {
	zhCN = "装备属性计算",
	zhTW = "裝備屬性計算",
	icon = "Interface\\AddOns\\RatingBuster\\images\\Sigma",
	handler = function()
		LibStub('AceConfigDialog-3.0'):Open"RatingBuster"
	end,
}
CFG["ReforgeLite"] = {
	zhCN = "重铸助手",
	zhTW = "重鑄助手",
	icon = "Interface\\Reforging\\Reforge-Portrait",
	handler = function()
		--TODO
	end,
}
CFG["StealYourCarbon"] = {
	zhCN = "自动补购",
	zhTW = "自動補購",
	icon = "Interface\\ICONS\\Spell_Nature_Polymorph",
	handler = function()
		InterfaceOptionsFrame_OpenToCategory(StealYourCarbon.configframe)
	end,
}
CFG["TheBurningTrade"] = {
	zhCN = "交易助手",
	zhTW = "交易助手",
	icon = "Interface\\ICONS\\ability_rogue_tricksofthetrade",
	handler = function()
		-- no config
	end,
}
CFG["TradeLog"] = {
	zhCN = "交易历史记录",
	zhTW = "交易歷史記錄",
	icon = "Interface\\ICONS\\inv_misc_bandage_17",
	handler = function()
		if TradeListFrame:IsVisible() then
			TradeListFrame:Hide();
		else
			TradeListFrame:Show();
		end
	end,
}
CFG["TrinketMenu"] = {
	zhCN = "饰品管理器",
	zhTW = "飾品管理器",
	icon = "INV_Jewelcrafting_PurpleSerpent",
	handler = function()
		TrinketMenu.ToggleFrame(TrinketMenu_OptFrame)
	end,
}
CFG["Wowshell_AutoGreed"] = {
	zhCN = "自动贪婪",
	zhTW = "自動貪婪",
	icon = "Interface\Icons\spell_fire_masterofelements",
	handler = function()
		--TODO
	end,
}
CFG["Wowshell_BagStatus"] = {
	zhCN = "背包状态",
	zhTW = "背包狀態",
	icon = "Interface\\ICONS\\INV_Misc_Bag_14",
	handler = function()
		--TODO
	end,
}
CFG["Wowshell_ItemInf"] = {
	zhCN = "物品信息",
	zhTW = "物品信息",
	icon = "Interface\\ICONS\\INV_Misc_Gift_03",
	handler = function()
		--TODO
	end,
}
CFG["Wowshell_Merchant"] = {
	zhCN = "商人助手",
	zhTW = "商人助手",
	icon = "Interface\\ICONS\\Trade_BlackSmithing",
	handler = function()
		--TODO
	end,
}
CFG["Wowshell_QuickEquip"] = {
	zhCN = "一键换装",
	zhTW = "一鍵換裝",
	icon = "Interface\\ICONS\\INV_Shirt_GuildTabard_01",
	handler = function()
		--TODO
	end,
}
CFG["QuestHubber"] = {
	zhCN = "任务成就党",
	zhTW = "任務成就黨",
	icon = "Interface\\ICONS\\achievement_general_25kdailyquests",
	handler = function()
		LibStub("AceConfigDialog-3.0"):Open("QuestHubber")
	end,
}
CFG["Wowshell_Quest"] = {
	zhCN = "任务助手",
	zhTW = "任務助手",
	icon = "Interface\\Icons\\Achievement_Quests_Completed_08",
	handler = function()
		--TODO
	end,
}
CFG["Overachiever"] = {
	zhCN = "成就增强",
	zhTW = "成就增強",
	icon = "Interface\\ICONS\\achievement_bg_masterofallbgs",
	handler = function()
		if SlashCmdList["Overachiever_silent"] then
			SlashCmdList["Overachiever_silent"]("");
		end
	end,
}
CFG["AutoLFG"] = {
	zhCN = "随机本助手",
	zhTW = "隨機本助手",
	icon = "Interface\\ICONS\\Achievement_Boss_CThun",
	handler = function()
		-- no config
	end,
}
CFG["AutoTabared"] = {
	zhCN = "战袍助手",
	zhTW = "戰袍助手",
	icon = "Interface\\Icons\\Inv_Misc_Tournaments_Tabard_Tauren",
	handler = function()
		SlashCmdList["AUTOTABARD"]("")
	end,
}
CFG["DBM-Core"] = {
	zhCN = "首领报警(DBM)",
	zhTW = "首領報警(DBM)",
	icon = "Interface\\AddOns\\DBM-Core\\textures\\Minimap-Button-Up",
	handler = function()
		DBM:LoadGUI()
	end,
}
CFG["ezIcons"] = {
	zhCN = "标记助手",
	zhTW = "標記助手",
	icon = "Interface\\ICONS\\ability_hunter_mastermarksman",
	handler = function()
		LibStub("AceConfigDialog-3.0"):Open("ezIcons")
	end,
}
CFG["Grid"] = {
	zhCN = "团队框架(Grid)",
	zhTW = "團隊框架(Grid)",
	icon = "Interface\\AddOns\\Grid\\icon",
	handler = function() 
		LibStub('AceConfigDialog-3.0'):Open'Grid'
	end,
}
CFG["HealBot"]= {
	zhCN = "治疗助手(HealBot)",
	zhTW = "治療助手(HealBot)",
	icon = "Interface\\Icons\\Spell_Holy_Chastise",
	handler = function()
		HealBot_TogglePanel(HealBot_Options)
	end,
}
CFG["LookingForLoot"] = {
	zhCN = "ROLL点助手",
	zhTW = "ROLL點助手",
	icon = "Interface\\ICONS\\INV_Misc_Dice_02",
	handler = function()
		SlashCmdList["LOOKINGFORLOOT"]("")	
	end,
}
CFG["Omen"] = {
	zhCN = "仇恨统计(Omen)",
	zhTW = "仇恨統計(Omen)",
	icon = "Interface\AddOns\Omen\icon",
	handler = function()
		Omen:ShowConfig()
	end,
}
CFG["RaidAlerter"] = {
	zhCN = "团队报警系统",
	zhTW = "團隊報警系統",
	icon = "Interface\\Icons\\achievement_guildperk_gmail",
	handler = function()
		RaidAlerter_SlashCommand("")
	end,
}
CFG["Recount"] = {
	zhCN = "伤害统计(Recount)",
	zhTW = "傷害統計(Recount)",
	icon = "Interface\\ICONS\\spell_shadow_psychicscream",
	handler = function()
		Recount.MainWindow:Show()
	end,
}
CFG["VuhDo"] = {
	zhCN = "VuhDo治疗助手",
	zhTW = "VuhDo治療助手",
	icon = "Interface\\ICONS\\Spell_Holy_Chastise",
	handler = function()
		VUHDO_slashCmd'opt';
	end,
}
CFG["Gladius"] = {
	zhCN = "竞技场助手",
	zhTW = "競技場助手",
	icon = "Interface\\ICONS\\Achievement_BG_3flagcap_nodeaths",
	handler = function()
		SlashCmdList["GLADIUS"]("");
	end,
}
CFG["CompleteEJ"] = {
	zhCN = "地下城增强",
	zhTW = "地下城增強",
	icon = "Interface\\ICONS\\Spell_Arcane_StudentOfMagic",
	handler =  function()
		-- no config
	end,
}
CFG["Examiner"] = {
	zhCN = "属性查看",
	zhTW = "屬性查看",
	icon = "Interface\\ICONS\\ability_toughness",
	handler = function()
		-- no config
	end,
}
CFG["GatherMate2"] = {
	zhCN = "采集助手",
	zhTW = "採集助手",
	icon = "Interface\\AddOns\\GatherMate2\\Artwork\\Icon.tga",
	handler = function()
		SlashCmdList.GatherMate2()
	end,
}
CFG["GearScoreLite"] = {
	zhCN = "装备评分(GS)",
	zhTW = "裝備評分(GS)",
	icon = "Interface\\ICONS\\Achievement_Arena_2v2_4",
	handler = function()
		-- no config
	end,
}
CFG["HandyNotes"] = {
	zhCN = "大地图标记助手",
	zhTW = "大地圖標記助手",
	icon = "Interface\\ICONS\\inv_misc_note_03",
	handler = function()
		LibStub("AceConfigDialog-3.0"):Open("HandyNotes")
	end,
}
CFG["Icetip"] = {
	zhCN = "鼠标提示",
	zhTW = "鼠標提示",
	icon = "Interface\\ICONS\\achievement_worldevent_brewmaster",
	handler = function()
		LibStub("AceConfigDialog-3.0"):Open("Icetip")
	end,
}
CFG["NinjaPanel"] = {
	zhCN = "忍者信息条",
	zhTW = "忍者信息條",
	icon = 'Interface\\AddOns\\NinjaPanel\\NinjaLogo',
	handler = function()
		--TODO
	end,
}
CFG["TradeskillInfo"] = {
	zhCN = "商业技能百科",
	zhTW = "商業技能百科",
	icon = "Interface\\ICONS\\INV_Elemental_Mote_Nether",
	handler = function()
		TradeskillInfo:ChatCommand("config");
	end,
}
CFG["Wowshell_Gather"] = {
	zhCN = "数据采集器",
	zhTW = "數據採集器",
	icon = "Interface\\ICONS\\achievement_worldevent_littlehelper",
	handler = function()
		-- no config
	end,
}
CFG["Wowshell_HandyNotes"] = {
	zhCN = "区域NPC信息",
	zhTW = "區域NPC信息",
	icon = "Interface\\ICONS\\inv_misc_note_03",
	handler = function()
		-- no config
	end,
}
CFG["Wowshell_Search"] = {
	zhCN = "资料查询",
	zhTW = "資料查詢",
	icon = "Interface\\ICONS\\INV_Misc_Gift_05",
	handler = function()
		-- no config
	end,
}
CFG["Accountant_Classic"] = {
	zhCN = "个人会计",
	zhTW = "個人會計",
	icon = "Interface\\ICONS\\inv_misc_lantern_01",
	handler = function()
		Accountant_Slash("");
	end,
}
CFG["AdvancedTradeSkillWindow"] = {
	zhCN = "制造面板增强",
	zhTW = "製造面板增強",
	icon = "Interface\\ICONS\\INV_Misc_EngGizmos_30",
	handler = function()
		-- no config
	end,
}
CFG["Wowshell_EasyAH"] = {
	zhCN = "拍卖行助手",
	zhTW = "拍賣行助手",
	icon = "Interface\\ICONS\\achievement_worldevent_littlehelper",
	handler = function()
		-- no config
	end,
}
CFG["TotemTimers"] = {
	zhCN = "图腾计时器",
	zhTW = "圖騰計時器",
	icon = "Interface\\ICONS\\Spell_Nature_Windfury",
	handler = function()
		TotemTimers_Slash();
	end,
}
CFG["Wowshell_HunterHelper"] = {
	zhCN = "猎人助手",
	zhTW = "獵人助手",
	icon = "Ability_Hunter_FocusFire",
	handler = function()
		LibStub("AceConfigDialog-3.0"):Open("IceHunex")	
	end,
}


ns.CFG = CFG 

