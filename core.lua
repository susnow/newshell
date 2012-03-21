local addon,ns = ...

local L = ns.locales[GetLocale()]
local GUI = ns.GUI
local AL = ns.AL --AddOnList
local CFG = ns.CFG

local categorys ={ "UnitFrame","ActionBar","Map","Chat","CastSpell","Item","Quest","Archievement","Raid","PVP","Database","Business","Class"}


-- create widget objects
GUI:MainFrame()
local f = _G["Wowshell_MainFrame"]
for i =1, #categorys do
	GUI:CategoryButton(f.scf,categorys[i],i,function() end)
	GUI:CategoryChildFrame(categorys[i])
	GUI:CategoryButtonSetPoint(categorys,i)
	for j=1, #AL[categorys[i]] do
		if j == 0 then break end
		GUI:CategoryChildFrameSetSize(categorys[i],j)
		GUI:CategoryChildFrameButtons(categorys[i],j)
		GUI:CategoryChildFrameButtonsSetPoint(categorys[i],j)
		local button = _G["Wowshell_Category"..categorys[i].."_ChildFrame_Button"..j]
		button.text:SetText(AL[categorys[i]][j])
	--	if AL[categorys[i]][j] == "Wowshell_UnitFrames" then
	--	--if IsAddOnLoaded("Wowshell_UnitFrames") then
	--		print(1231)
	--		button.bg:SetTexture("Interface\\ICONS\\"..CFG["Wowshell_UnitFrames"].icon)
	--		button.text:SetText(CFG["Wowshell_UnitFrames"][GetLocale()])
	--	end
	end
end

GUI:MainFrameButton(f,"close",{"TOPRIGHT",-10,-10},function()  end)
GUI:MainFrameButton(f,"forward",{"TOPRIGHT",-50,-10},function()  end)
GUI:MainFrameButton(f,"back",{"TOPRIGHT",-90,-10},function()  end)
GUI:MainFrameButton(f,"reload",{"TOPRIGHT",-130,-10},function() ReloadUI() end)
GUI:SearchBox(f)


