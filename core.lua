local addon,ns = ...

local L = ns.locales[GetLocale()]
local GUI = ns.GUI
local AL = ns.AL --AddOnList
local CFG = ns.CFG

local categorys ={ "UnitFrame","ActionBar","Map","Chat","CastSpell","Item","Quest","Archievement","Raid","PVP","Database","Business","Class"}


-- create widget objects
GUI:MainFrame()
local mf = _G["Wowshell_MainFrame"]
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
		if IsAddOnLoaded(AL[categorys[i]][j]) then
			button.bg:SetDesaturated(false)
		else
			button.bg:SetDesaturated(true)
			button.bg:SetVertexColor(.8,.8,.75,.8)
		end
	end
end

GUI:MainFrameButton(mf,"close",{"TOPRIGHT",-10,-10},function()  end)
GUI:MainFrameButton(mf,"forward",{"TOPRIGHT",-50,-10},function()  end)
GUI:MainFrameButton(mf,"back",{"TOPRIGHT",-90,-10},function()  end)
GUI:MainFrameButton(mf,"reload",{"TOPRIGHT",-130,-10},function() ReloadUI() end)
GUI:SearchBox(mf)
GUI:StatsBar()

