	--[[
    --register wowshell
    if wsRegisterOption then

    end
		--]]


wsQueueLoad("Icetip", {
	"general",
	"icetip",
	"icetip",
	"鼠标提示",
	"鼠标提示增强",
	"achievement_worldevent_brewmaster",
}, function()
		local Icetip = LibStub("AceAddon-3.0"):GetAddon("Icetip");
		local options = Icetip:createOptions();
		local opt = {
				type = 'group',
				args = {},
		}

		opt.args.colorclass         = options.args.general.args.colorclass
		opt.args.tot                = options.args.general.args.tot
		opt.args.showtalent         = options.args.general.args.showtalent
		opt.args.itemborder         = options.args.general.args.itemborder
		opt.args.position_desc_1    = options.args.position.args.desc_1
		opt.args.unitAnchor         = options.args.position.args.unitAnchor
		opt.args.space_1            = options.args.position.args.space_1
		opt.args.unitPosX           = options.args.position.args.unitPosX
		opt.args.unitPosX           = options.args.position.args.unitPosY
		opt.args.frameAnchor        = options.args.position.args.frameAnchor
		opt.args.space_2            = options.args.position.args.space_2
		opt.args.framePosX          = options.args.position.args.framePosX
		opt.args.framePosY          = options.args.position.args.framePosY

		local L = GetLocale() == 'zhTW' and {
				['高级设定'] = '高級設定',
				["鼠标提示"] = '滑鼠提示',
				["鼠标提示增强"] = '滑鼠提示增強',
		} or setmetatable({}, {__index = function(t, i) return i end})

		opt.args.advance = {
				type = "execute",
				name = L["高级设定"],
				order = 99999,
				func = function()
						LibStub("AceConfigDialog-3.0"):SetDefaultSize("Icetip", 650, 580)
						if not (LibStub("AceConfigDialog-3.0"):Close("Icetip")) then
								LibStub("AceConfigDialog-3.0"):Open("Icetip")
						end
				end
		}

		wsRegisterOption(
			"general",
			"Icetip",
			"Icetip",
			L["鼠标提示"],
			L["鼠标提示增强"],
			"achievement_worldevent_brewmaster",
			opt
		);
end);
