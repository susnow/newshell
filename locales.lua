local addon,ns = ...

local locales = {}

locales.zhCN = {
	--info
	Wowshell = "魔兽精灵",
	
	--widget
	back = "后退",
	forward = "前进",
	close = "关闭",
	reload = "重载界面",
	SearchBoxText = "搜索插件",
	SearchTip = "根据输入的关键字查找插件",
	DragTip = "拖动区域",
	UpdateLogTip = "单击查看 %s 的更新日志",
	UpdateLogTipClose = "单击关闭更新日志窗口",
	UpdateLog = "最后更新于 %s",
	TipAddOnsLoad = "对 %s(%s) 的改动将在重载界面后生效",
	TipAddOnsCancel = "您取消了对 %s(%s) 的改动",
	Log = "更新日志",
	LeftClick = "左键单击启用/禁用插件",

	--category
	UnitFrame = "头像(UnitFrame)",
	ActionBar = "动作条(ActionBar)",
	Map = "地图(Map)",
	Chat = "聊天(Chat)",
	CastSpell = "战斗及施法(Combat & CastSpell)",
	Item = "物品及装备(Items & Equipments)",
	Quest = "任务及探索(Quest)",
	Archievement = "成就(Archievement)",
	Raid = "团队及地下城(Raid & Instance)",
	PVP = "战争游戏(PvP)",
	Database = "信息和数据(Infomations & Database)",
	Business = "经商(Business)",
	Class = "职业(Class)",
	Custom = "第三方插件(Custom AddOns)",

	LOW = "此插件在运行时占用资源很低,基本不会影响游戏的流畅度",
	MIDDLE = "此插件在运行时占用资源中等,有小概率会影响游戏流畅度",
	HIGH = "此插件在运行时占用硬件资源较高,有很大概率会影响游戏的流畅度",
	VERYHIGH = "此插件在运行时占用资源极高,建议在使用完毕后及时禁用",


}





ns.locales = locales
