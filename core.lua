local addon,ns = ...

local L = ns.locales[GetLocale()]
local GUI = ns.GUI
local AL = ns.AL --AddOnList
local CFG = ns.CFG

local categorys ={ "UnitFrame","ActionBar","Map","Chat","CastSpell","Item","Quest","Archievement","Raid","PVP","Database","Business","Class"}

local buttons = {}

-- create widget objects
GUI:MainFrame()
local mf = _G["Wowshell_MainFrame"]
mf:RegisterEvent("ADDON_LOADED")
mf:RegisterEvent("PLAYER_LOGIN")
local f = _G["Wowshell_MainFrame_ScrollFrame"]
for i =1, #categorys do
	GUI:CategoryButton(mf.scf,categorys[i],i,function() end)
	GUI:CategoryChildFrame(categorys[i])
	GUI:CategoryButtonSetPoint(categorys,i)
	for j=1, #AL[categorys[i]] do
		if j == 0 then break end
		GUI:CategoryChildFrameSetSize(categorys[i],j)
		GUI:CategoryChildFrameButtons(categorys[i],j)
		GUI:CategoryChildFrameButtonsSetPoint(categorys[i],j)
		local button = _G["Wowshell_Category"..categorys[i].."_ChildFrame_Button"..j]
		local addonName = AL[categorys[i]][j]
		button.text:SetText(CFG[addonName][GetLocale()])
		button.bg:SetTexture(CFG[addonName].icon)
		button.name = AL[categorys[i]][j]
		button.category = L[categorys[i]]
		button.clickCount = 1
		mf:HookScript("OnEvent",function(self,event,...)
			if event == "PLAYER_LOGIN" then
				collectgarbage'collect'
				if IsAddOnLoaded(addonName) then
					button.bg:SetDesaturated(false)	
					button.text:SetTextColor(1,1,1)
					button.isLoad = false
				else
					button.isLoad = true
					button.bg:SetDesaturated(true)	
					button.bg:SetVertexColor(.8,.7,.6,.5)
					button.text:SetTextColor(.8,.7,.6,.5)
				end
			end
		end)
		buttons[addonName] = button:GetName()
	end
end

GUI:TipFrame()
GUI:MouseOverTipFrame()
GUI:MainFrameButton(mf,"close",{"TOPRIGHT",-10,-10},function()  end)
GUI:MainFrameButton(mf,"forward",{"TOPRIGHT",-50,-10},function()  end)
GUI:MainFrameButton(mf,"back",{"TOPRIGHT",-90,-10},function()  end)
GUI:MainFrameButton(mf,"reload",{"TOPRIGHT",-130,-10},function() ReloadUI() end)
GUI:SearchBox(mf)
GUI:StatsBar()
GUI:UpdateLog()

for addonName,buttonName in pairs(buttons) do
	local tipFrame = _G["Wowshell_TipFrame"]
	local mouseTip = _G["Wowshell_GameTooltip"]
	_G[buttonName]:SetScript("OnEnter",function(self)
		mouseTip:Show()
		local sug = GetAddOnMetadata(addonName,"X-TipSuggest") or ""
		local mem = GetAddOnMetadata(addonName,"X-TipMemory") and string.upper(GetAddOnMetadata(addonName,"X-TipMemory")) or ""
		GUI:MouseOverTipFrameSetPoint(self)
		mouseTip.addonName:SetText(format("%s(%s)",self.text:GetText(),addonName))
		mouseTip.category:SetText(self.category)
		mouseTip.suggest:SetText(sug)
		mouseTip.memory:SetText(L[mem])
	end)
	_G[buttonName]:SetScript("OnLeave",function(self)
		mouseTip:Hide()
	end)
	_G[buttonName]:SetScript("OnClick",function(self,key)
		if key == "LeftButton" then
			self.clickCount = self.clickCount + 1
			if IsAddOnLoaded(addonName) then
				if self.clickCount % 2 == 0 then
					DisableAddOn(addonName)
					self.text:SetTextColor(.8,.7,.6,.5)
					tipFrame:Show()	
					GUI:TipFrameOnShow(GetTime()+2)
					tipFrame.text:SetText(format(L["TipAddOnsLoad"],self.text:GetText(),addonName))
					GUI:TipFrameOnHide(GetTime()+2)
				elseif self.clickCount % 2 ~= 0 then
					EnableAddOn(addonName)
					self.text:SetTextColor(1,1,1,1)
					tipFrame:Show()
					GUI:TipFrameOnShow(GetTime()+2)
					tipFrame.text:SetText(format(L["TipAddOnsCancel"],self.text:GetText(),addonName))
					GUI:TipFrameOnHide(GetTime()+2)
				end
			else
				if self.clickCount % 2 == 0 then
					EnableAddOn(addonName)
					self.text:SetTextColor(1,1,1,1)
					tipFrame:Show()
					GUI:TipFrameOnShow(GetTime()+2)
					tipFrame.text:SetText(format(L["TipAddOnsLoad"],self.text:GetText(),addonName))
					GUI:TipFrameOnHide(GetTime()+2)
				elseif self.clickCount % 2 ~= 0 then
					DisableAddOn(addonName)
					self.text:SetTextColor(.8,.7,.6,.5)
					tipFrame:Show()
					GUI:TipFrameOnShow(GetTime()+2)
					tipFrame.text:SetText(format(L["TipAddOnsCancel"],self.text:GetText(),addonName))
					GUI:TipFrameOnHide(GetTime()+2)
				end
			end
		end
	end)
end

local updateDate = GetAddOnMetadata("Wowshell","X-UpdateDate")
local version = GetAddOnMetadata("Wowshell","X-Version")
_G["Wowshell_UpdateLog_Button"]:SetScript("OnClick",function(self)
	local updateLog = _G["Wowshell_UpdateLog_Frame"]
	if updateLog:IsShown() then
		self.text:SetText(format(L["UpdateLog"],updateDate))
		updateLog:Hide()
	else
		self.text:SetText(L["UpdateLogTipClose"])
		updateLog:Show()
	end
end)
_G["Wowshell_UpdateLog_Button"].text:SetText(format(L["UpdateLog"],updateDate))
_G["Wowshell_UpdateLog_Button"]:SetScript("OnEnter",function(self)
	self.text:SetTextColor(1,.5,.25)
	if _G["Wowshell_UpdateLog_Frame"]:IsShown() then
		self.text:SetText(L["UpdateLogTipClose"])
	else
		self.text:SetText(format(L["UpdateLogTip"],version))
	end
end)
_G["Wowshell_UpdateLog_Button"]:SetScript("OnLeave",function(self)
	self.text:SetTextColor(1,1,1)
	self.text:SetText(format(L["UpdateLog"],updateDate))
end)


