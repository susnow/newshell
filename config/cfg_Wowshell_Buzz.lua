local order
do
	o = 0
	order = function()
		o = o+1
		return o
	end
end

local toggleFilter = function()
	if (Buzz.db.profile.filter) then
		Buzz:ChannelFilter()
	else
		Buzz:RemoveChannelFilter()
	end
end

local L = {
	zhCN = {
		name = "精灵聊天增强",
		desc = "聊天增强,聊天快捷键,过滤关键词",
		emote = "启用聊天表情",
		enablefilter = {
			name = "启用聊天过滤",
			desc = "启用聊天过滤,屏蔽/举报发送垃圾信息的玩家",
		},
		colorplayers = {
			name = "名字着色",
			desc = "启用聊天框玩家名职业着色功能",
		},
		chattab = {
			name = "聊天快捷按钮",
			desc = "启用聊天快捷按钮",
		},
		chattab_userposition = {
			name = "快捷栏自定义位置",
			desc = "不使用固定位置, 可以任意移动,请用下面的选项解锁",
		},
		move_tab = "移动快捷按钮",
		popup = {
			name = "自动举报",
			desc = "开启/关闭自动举报提示框",
		},
		addword = "增减屏蔽关键词",
		wordslist = "过滤关键词列表,点击移除",
	},
	zhTW = {	
		name = "精靈聊天增強",
		desc = "聊天增強,聊天快捷鍵,過濾關鍵詞",
		emote = "啟用聊天表情",
		enablefilter = {
			name = "啟用聊天過濾",
			desc = "啟用聊天過濾,屏蔽/舉報發送垃圾信息的玩家",
		},
		colorplayers = {
			name = "名字著色",
			desc = "啟用聊天框玩家姓名職業著色的功能",
		},
		chattab = {
			name = "聊天快捷按鈕",
			desc = "啟用聊天快捷按鈕",
		},
		chattab_userposition = {
			name = "快捷欄自定義位置",
			desc = "不使用固定位置, 可以任意移動,請用下面的選項解鎖",
		},
		move_tab = "移動快捷按鈕",
		popup = {
			name = "自動舉報",
			desc = "開啟/關閉自動舉報提示框",
		},
		addword = "增減屏蔽關鍵詞",
		wordslist = "過濾關鍵詞列表,點擊移除",
	},
	enUS = {
		name = "Wowshell_Buzz",
		desc = "Improve Chat,Chat shortcuts,Chat filter",
		emote = "Enable chat emote",
		enablefilter = {
			name = "Enable chat filter",
			desc = "Enable chat filter,report the ad's players",
		},
		colorplayers = {
			name = "Color name",
			desc = "Set the color of name by Class when them show in the chatframe",
		},
		chattab = {
			name = "Chat shortcuts",
			desc = "Enable chat shortcuts",
		},
		chattab_userposition = {
			name = "Custom chat shortcuts bar",
			desc = "If you want to move the bar to any positions , pls unlock the bottom options",
		},
		move_tab = "Move chat shortcuts",
		popup = {
			name = "Automantic report",
			desc = "Enable/Disable the report confirm window",
		},
		addword = "Add this keyword to filterlist",
		wordslist = "Filter list,click to remove",
	},
}


wsQueueLoad(
		"Wowshell_Buzz", {"Chat", "Wowshell_Buzz", "Buzz", L[GetLocale()].name, L[GetLocale()].desc, "Ability_Rogue_Disguise", 100},
		function()
wsRegisterOption(
		"general",
		"Wowshell_Buzz",
		"Buzz",
		L[GetLocale()].name,
		L[GetLocale()].desc,
		"Ability_Rogue_Disguise",
		{
			type = "group",
			args = {
				blah = {
					type = 'description',
					order =order()+99999,
					fontSize = 'medium',
					name = (GetLocale() == 'zhTW') and [[除了原本的聊天過濾等功能外，新增加聊天通道功能，啟用聊天通道能更方便查看聊天信息，過濾綜合、交易等被刷屏的煩惱。點擊按鈕啟用。]] or [[除了原本的聊天过滤等功能外，新增加聊天通道功能，启用聊天通道能更方便查看聊天信息，过滤综合、交易等被刷屏的烦恼。点击按钮启用。]],
				},
				buzzicon = {
					type = "toggle",
					name = L[GetLocale()].emote,
					order = order(),
					get = function() return Buzz.db.profile.buzzicon end,
					set = function(_, v)
						Buzz.db.profile.buzzicon = v
						Buzz:ToggleBuzzIcon()
					end
				},
				enablefilter = {
					type = "toggle",
					name = L[GetLocale()].enablefilter.name,
					desc = L[GetLocale()].enablefilter.desc,
					order = order(),
					get = function()
						return Buzz.db.profile.filter;
					end,
					set = function(_, v)
						Buzz.db.profile.filter = v
						toggleFilter()
					end
				},
				colorplayers = {
					type = "toggle",
					name = L[GetLocale()].colorplayers.name,
					desc = L[GetLocale()].colorplayers.desc,
					order = order(),
					get = function()
						return Buzz.db.profile.colorname;
					end,
					set = function(_, v)
						Buzz.db.profile.colorname = v;
						Buzz:ColorPlayersName();
					end
				},
				chattab = {
					type = "toggle",
					name = L[GetLocale()].chattab.name,
					desc = L[GetLocale()].chattab.desc,
					order = order(),
					get = function()
						return Buzz.db.profile.chatbar;
					end,
					set = function(_, v)
						Buzz.db.profile.chatbar = v;
						Buzz:ChatTabEvent();
						if Buzz.db.profile.chatbar then
							Buzz.buzzFrame:Show()
						else
							Buzz.buzzFrame:Hide();
						end
					end,
				},
				chattab_userposition = {
					type = 'toggle',
					name = L[GetLocale()].chattab_userposition.name,
					desc = L[GetLocale()].chattab_userposition.desc,
					order = order(),
					get = function() return Buzz.db.profile.chatbar_userposition end,
					set = function(_,v)
						Buzz.db.profile.chatbar_userposition = v
						Buzz:UpdateChattabMovability()
					end
				},
				move_tab = {
					type = "toggle",
					name = L[GetLocale()].move_tab,
					order = order(),
					disabled = function() return not Buzz.db.profile.chatbar_userposition end,
					get = function()
						return Buzz.buzzFrame.mover:IsShown()
					end,
					set = function()
						Buzz:ChatbarToggleLock();
					end
				},
				popup = {
				type = "toggle",
				name = L[GetLocale()].popup.name,
				desc = L[GetLocale()].popup.desc,
				order = order(),
				get = function()
					return Buzz.db.profile.popup
				end,
				set = function(_, v)
					Buzz.db.profile.popup = v;
				end
			},
			--input
			addword = {
				type = "input",
				name = L[GetLocale()].addword,
				order = order(),
				get = function() return "" end,
				set = function(_, key)
					tinsert(Buzz.db.profile.fwords, key)
				end
			},
			wordslist = {
				type = "multiselect",
				name = L[GetLocale()].wordslist,
				values = Buzz.db.profile.fwords,
				tristate = true,
				order = order(),
				get = function() return false end,
				set = function(_, key)
					Buzz.db.profile.fwords[key] = nil
				end
			},
			buzzchannel = {
				type = 'toggle',
				order = order(),
				name = '启用聊天通道',
				get = function() return Buzz.db.profile.buzzchannel end,
				set = function(_, v)
					Buzz.db.profile.buzzchannel = v
					if(v) then
						Buzz:CreateFCF(true)
					else
						Buzz:RemoveFCF()
					end
				end,
			},
		}
	}
)
end)
