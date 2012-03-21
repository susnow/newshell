--[=[
wsQueueLoad("Wowshell_UnitFrame", {"general", "Wowshell_UnitFrame", "wsUnitFrame", "精灵头像", "精灵头像增强.", "Spell_Shaman_Hex", 2}, function()
	local SM = LibStub("LibSharedMedia-3.0");
	local textures = SM:List("statusbar")
	local L = wsLocale:GetLocale("wsUnitFrame");

	local mod
	local PlayerMod = IceUF.modules.Player;
	local TargetMod = IceUF.modules.Target;
	local FocusMod = IceUF.modules.Focus;
	local PetMod = IceUF.modules.Pet;
	local PartyMod = IceUF.modules.Party;
	local _order = 1;
	local function order()
		_order = _order + 1;
		return _order;
	end

	wsRegisterOption("general", "Wowshell_UnitFrame", "wsUnitFrame", L["精灵头像"], L["精灵头像增强."], "Spell_Shaman_Hex",
			{
				type = "group",
				args = {
					playerUnitFrame = {
						type = "toggle",
						order = order(),
						name  = L["头像增强"],
						desc = L["玩家头像信息扩展显示, 生命值, 法力值以及经验值(声望)."],
						get = function() return PlayerMod.db.profile.enabled end,
						set = function(_, v)
							PlayerMod.db.profile.enabled = v
							PlayerMod:UpdatePlayerBar();
							PlayerMod:adjustUnit();
						end,
					},
					eliteframe = {
						type = "toggle",
						order = order(),
						name = L["头像精英标记"],
						desc = L["在头像上增加一个精英标记"],
						get = function() return PlayerMod.db.profile.playerelite end,
						set = function(_, v)
							PlayerMod.db.profile.playerelite = v;
							PlayerMod:UpdateElite();
						end,
					},
					colorPlayerHP = {
						type = "toggle";
						order = order();
						name = L["玩家血量百分比着色"];
						desc = L["根据玩家的血量百分比着色"];
						get = function() return PlayerMod.db.profile.colorPlayerHealth end;
						set = function(_, v)
							PlayerMod.db.profile.colorPlayerHealth = v
						end;
					},
					targetStatus = {
						type = "toggle";
						name = L["显示目标状态信息"];
						desc = L["详细显示目标的生命值, 法力值/怒气/能量/集中值/符文值"];
						order = order();
						get = function() return TargetMod.db.profile.targetStatusText end,
						set = function(_, v)
							TargetMod.db.profile.targetStatusText = v;
							TargetMod:CheckBlzConfig()
						end
					},
					targetPercent = {
						type = "toggle";
						name = L["显示百分比"];
						desc = L["在目标头像的旁边显示百分比"];
						order = order();
						get = function() return TargetMod.db.profile.targetStatusPer end;
						set = function(_, v)
							TargetMod.db.profile.targetStatusPer = v
						end
					},
					ShowTarget2Frame = {
						type = "toggle";
						name = L["显示目标的目标"];
						desc = L["启用/禁用目标的目标."];
						order = order();
						get = function()
							return GetCVar'showTargetOfTarget' == '1' and GetCVar'targetOfTargetMode' == '5'
						end,
						set = function(_, v)
							SetCVar('showTargetOfTarget', tostring(v and 1 or 0))
							SetCVar('targetOfTargetMode', '5')
						end,
					},
					ShowTarget3Frame = {
						type = "toggle";
						name = L["显示目标的目标的目标"];
						desc = L["启用/禁用目标的目标的目标. 你必须打开系统的目标的目标方可使用"];
						order = order();
						width = "full";
						get = function() return TargetMod.db.profile.ShowTarget3Frame end;
						set = function(_, v)
							TargetMod.db.profile.ShowTarget3Frame = v;
							TargetMod:UpdateModleProfile();
						end;
					},
					showFocusTarget2Frame = {
						type = "toggle",
						name = L["显示焦点目标的目标的目标"],
						desc = L["启用/禁用焦点目标的目标的目标."];
						width = "full";
						order = order();
						get = function() return FocusMod.db.profile.ShowFocus2Frame end;
						set = function(_, v)
							FocusMod.db.profile.ShowFocus2Frame = v;
							FocusMod:UpdateModleProfile();
						end;
					},
					partyExchant = {
						type = "toggle",
						name = L["队伍增强"],
						desc = L["增强队伍框体"],
						order = order(),
						get = function() return PartyMod.db.profile.enabled end,
						set = function(_, v)
							PartyMod.db.profile.enabled = v
							PartyMod:Load();
						end
					},
					partyInfo = {
						type = "toggle",
						name = L["队伍信息"],
						desc = L["在队员旁边显示等级,职业等"],
						order = order(),
						get = function() return PartyMod.db.profile.infoMsg end,
						set = function(_, v)
							PartyMod.db.profile.infoMsg = v
							PartyMod:UpdatePartyInfo();
						end
					},
					disableParty = {
						type = 'toggle',
						name = L['禁用小队'],
						desc = L['在所有情况下隐藏小队头像'],
						order = order(),
						get = function() return PartyMod.db.profile.disableParty end,
						set = function(_, v)
							PartyMod.db.profile.disableParty = v
							if(v) then
								PartyMod:DisableParty()
							else
								wsPopup.CFG_RELOAD()
							end
						end,
					},
					advance = {
						type = "execute",
						name = L["高级设定"],
						order = order(),
						func = function()
							if not (LibStub("AceConfigDialog-3.0"):Close("wsUnitFrame")) then
								LibStub("AceConfigDialog-3.0"):Open("wsUnitFrame")
							end
						end
					},
				}
			},
	2);
end);
]=]

local L = {
	["zhCN"] = "精灵头像",
	["zhTW"] = "精靈頭像",
	["enUS"] = "Wowshell_UnitFrames",
}

wsRegisterOption(
'UserIn',
"Wowshell_UnitFrames",
'wsUnitFrame',
L[GetLocale()],
L[GetLocale()],
"Spell_Shaman_Hex",
--"INV_Misc_PetDragonWhelpTarecgosa",
function()
	LibStub("AceConfigDialog-3.0"):Open("WSUnitFrame");
end,
1
)

