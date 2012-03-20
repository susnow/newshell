local addon,ns = ...

--include class
local L = ns.locales[GetLocale()]

--texture
local bgTex = "Interface\\Buttons\\WHITE8x8"
local tex = "Interface\\AddOns\\Wowshell\\media\\"
local logoTex = tex.."wsLogo2"
local backTex = tex.."back"
local forwardTex = tex.."forward"

local GUI = CreateFrame("Frame")

local categorys = { "UnitFrame","ActionBar","Map","Chat","CastSpell","Bag","Quest","Archievement","Raid","PVP","Database","Business"}

function GUI:MainFrame() 
	local f = CreateFrame("ScrollFrame","Wowshell_MainFrame",UIParent)
	f.nextUpdate = 0
	f:SetSize(800,600)
	f:SetPoint("CENTER")
	f:SetBackdrop({bgFile = bgTex,edgeFile = bgTex, edgeSize = 1,insets={top = 0, bottom = 0,left = 0,right = 0}})
	f:SetBackdropColor(.1,.1,.1,.5)
	f:SetBackdropBorderColor(0,0,0,1)
	f.logo = CreateFrame("Button","Wowshell_Logo",f)
	f.logo:SetSize(50,50)
	f.logo:SetPoint("TOPLEFT",10,-10)
	f.logo.bg = f.logo:CreateTexture(nil,"OVERLAY")
	f.logo.bg:SetAllPoints(f.logo)
	f.logo.bg:SetTexture(logoTex)
	f.logo.title = f.logo:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	f.logo.title:SetPoint("BOTTOMLEFT",f.logo,"BOTTOMRIGHT",10,0)
	do 
		local font,size,flag = f.logo.title:GetFont()
		f.logo.title:SetFont(font,38,"OUTLINE")
	end
	f.logo.title:SetText(L["Wowshell"])	

	f.opLine = f:CreateTexture(nil,"OVERLAY")
	f.opLine:SetSize(f:GetWidth()-100,1)
	f.opLine:SetPoint("TOPLEFT",f.logo,"BOTTOMLEFT",50,-10)
	f.opLine:SetTexture(bgTex)
	f.opLine:SetGradient("HORIZONTAL",1,1,1,.3,.3,.3)
	f.resize = CreateFrame("Button","Wowshell_ResizeButton",f)
	f.resize:SetSize(10,10)
	f.resize:SetPoint("BOTTOMRIGHT",f,-1,1)
	f.resize.bg = f.resize:CreateTexture(nil,"OVERLAY")
	f.resize.bg:SetAllPoints(f.resize)
	f.resize.bg:SetTexture(tex.."resize3")
	f.resize.bg:SetVertexColor(1,1,1,1)

	f.resize:SetScript("OnEnter",function(self)
		self.bg:SetVertexColor(1,.5,.25)
	end)
	f.resize:SetScript("OnLeave",function(self)
		self.bg:SetVertexColor(1,1,1)
	end)

	


	local scf = CreateFrame("Frame",nil,f)	
	scf:SetBackdrop({bgFile = bgTex,edgeFile = bgTex, edgeSize = 1,insets={top = 0, bottom = 0,left = 0,right = 0}})
	scf:SetBackdropBorderColor(1,1,1,0)
	scf:SetBackdropColor(0,0,0,0)
	scf:SetSize(f:GetWidth()-10,f:GetHeight()-10)
	scf:SetPoint("TOPLEFT",f,50,-50)
	f:SetScrollChild(scf)
	scf:EnableMouseWheel(true)
	for i =1, #categorys do
		GUI:CategoryButton(scf,categorys[i],i,function() end)
		--f:SetScrollChild(_G["Wowshell_Category_"..categorys[i].."Button"])
		--f:UpdateScrollChildRect()
	end
	local sld = CreateFrame("Slider","Wowshell_MainFrame_SliderBar",f)
	sld:SetSize(10,40)
	sld:SetPoint("TOPLEFT",scf,"TOPRIGHT")
	sld:SetBackdrop({bgFile = bgTex,edgeFile = bgTex, edgeSize = 1,insets={top = 0, bottom = 0,left = 0,right = 0}})
	sld:SetOrientation("HORIZONTAL")
	sld:SetBackdropColor(.1,.1,.1,.5)
	sld:SetBackdropBorderColor(0,0,0,1)
	sld:SetMinMaxValues(1,1000)
	sld:SetValue(1)
	sld:SetValueStep(1)
	sld:EnableMouseWheel(true)
	scf:SetScript("OnMouseWheel",function(self,delta)
	--	print(delta)
	--	local x
	--	if delta == -1 then
	--		x = sld:GetValue()
	--		print(x)
	--	elseif delta == 1 then
	--		x = sld:GetValue()
	--		print(x)
	--	else
	--		print(sld:GetValue())
	--	end

	end)
	sld:SetScript("OnValueChanged",function(self,v) scf:SetVerticalScroll(v) end)

	GUI:MainFrameButton(f,"close",{"TOPRIGHT",-10,-10},function()  end)
	GUI:MainFrameButton(f,"forward",{"TOPRIGHT",-50,-10},function()  end)
	GUI:MainFrameButton(f,"back",{"TOPRIGHT",-90,-10},function()  end)
	GUI:MainFrameButton(f,"reload",{"TOPRIGHT",-130,-10},function() ReloadUI() end)
	GUI:SearchBox(f)


end

function GUI:MainFrameButton(parent,name,point,handler)
	local button = CreateFrame("Button","Wowshell_MainFrame_"..name:gsub("^%l",string.upper).."Button",parent)
	button.tip = button:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	button:SetSize(30,30)
	button:SetPoint(unpack(point))
	button.bg = button:CreateTexture(nil,"OVERLAY")
	button.bg:SetAllPoints(button)
	button.bg:SetTexture(tex..name)
	button.bg:SetVertexColor(1,1,1)
	button:SetScript("OnEnter",function(self)
		self.bg:SetVertexColor(1,.5,.25)	
		self.tip:Show()
	end)
	button:SetScript("OnLeave",function(self)
		self.bg:SetVertexColor(1,1,1)	
		self.tip:Hide()
	end)
	button:SetScript("OnClick",function()
		handler()
	end)
	button.tip:SetPoint("TOP",button,"BOTTOM",0,-10)
	do 
		local font,size,flag = button.tip:GetFont()
		button.tip:SetFont(font,size,"THICK")
	end
	button.tip:SetText(L[name])
	button.tip:Hide()
	
	--parent.name = button
end

function GUI:SearchBox(parent)
	local editbox = CreateFrame("EditBox","Wowshell_SearchBox",parent)	
	editbox:SetSize(150,25)
	editbox:SetPoint("TOPLEFT",parent,200,-35)
	editbox:SetAutoFocus(false)
	editbox:EnableMouse(true)
	editbox:SetFontObject(ChatFontNormal)
	editbox:SetBackdrop({bgFile = bgTex,edgeFile = bgTex, edgeSize = 1,insets={top = 0, bottom = 0,left = 0,right = 0}})
	editbox:SetBackdropColor(.2,.2,.2,.5)
	editbox:SetBackdropBorderColor(.1,.1,.1,1)
	editbox:SetTextInsets(5,0,0,0)
	editbox:SetText(L["SearchBoxText"])
	editbox:SetTextColor(.7,.7,.7)
	editbox.tip = editbox:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	editbox.tip:SetPoint("BOTTOMLEFT",editbox,"TOPLEFT",0,5)
	editbox.tip:SetText(L["SearchTip"])
	editbox.tip:Hide()
	editbox.input = editbox:CreateTexture(nil,"OVERLAY")
	editbox.input:SetTexture(tex.."input")
	editbox.input:SetSize(20,20)
	editbox.input:SetPoint("RIGHT",editbox,-5,0)
	editbox.input:SetVertexColor(1,.5,.25)
	editbox.input:Hide()
	editbox:SetScript("OnEditFocusGained",function(self) 
		self:SetFocus()
		self:SetSize(250,25)
		self:SetText("")
		self:SetTextColor(1,1,1,1)
		self:SetBackdropBorderColor(1,.5,.25,1)
		self.input:Show()
	end)
	editbox:SetScript("OnEditFocusLost",function(self)
		self:ClearFocus()
		self:SetSize(150,25)
		self:SetTextColor(.7,.7,.7,1)
		self:SetBackdropBorderColor(.1,.1,.1,1)
		self:SetText(L["SearchBoxText"])
		self.input:Hide()
	end)
	editbox:SetScript("OnEnter",function(self)
		self.tip:Show()
	end)
	editbox:SetScript("OnLeave",function(self)
		self.tip:Hide()
	end)
	editbox:SetScript("OnEnterPressed",function(self)
		self:ClearFocus()
	end)
	editbox:SetScript("OnEscapePressed",function(self)
		self:ClearFocus()
	end)
end

function GUI:CategoryButton(parent,name,index,hander)
	local button = CreateFrame("Button","Wowshell_Category_"..name:gsub("^%l",string.upper).."Button",parent)
	button:SetSize(parent:GetWidth() - 100,20)
	if index == 1 then 
		button:SetPoint("TOPLEFT",parent,50,-100)	
	elseif index >1 then 
		button:SetPoint("TOPLEFT",parent,50,0-index*120)
	end
	button.bg = button:CreateTexture(nil,"OVERLAY")
	button.bg:SetTexture(bgTex)
	button.bg:SetAllPoints(button)
	button.bg:SetVertexColor(.3,.3,.3,.2)
	button.fw = button:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	button.fw:SetPoint("LEFT",button)
	do 
		local font,size,flag = button.fw:GetFont()
		button.fw:SetFont(font,24,"OUTLINE")
	end
	button.sw = button:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	button.sw:SetPoint("BOTTOMLEFT",button.fw,"BOTTOMRIGHT")
	do 
		local font,size,flag = button.sw:GetFont()
		button.sw:SetFont(font,12,"OUTLINE")
	end
	local fw,sw = string.sub(L[name],1,3),string.sub(L[name],4)
	button.fw:SetText(fw)
	button.sw:SetText(sw)

	--parent.category.index = button
end


GUI:MainFrame()
----categorys list
--local categorys = {"头像(UnitFrame)","动作条(ActionBar)","地图(Map)","团队(Raid)","战争游戏(PvP)"}
--
--local f = CreateFrame("Frame","Wowshell_MainFrame",UIParent)
--f.nextUpdate = 0
--f:SetSize(800,600)
--f:SetPoint("CENTER",UIParent)
--f.bg = f:CreateTexture(nil,"ARTWORK")
--f.bg:SetAllPoints(f)
--f.bg:SetTexture(texture)
--f.bg:SetVertexColor(.1,.1,.1,.5)
--f.logo = f:CreateTexture(nil,"OVERLAY")
--f.logo:SetTexture(logo)
--f.logo:SetSize(50,50)
--f.logo:SetPoint("TOPLEFT",10,-10)
--f.logoText = f:CreateFontString(nil,"OVERLAY","ChatFontNormal")
--do 
--	local font,size,flag = f.logoText:GetFont()
--	f.logoText:SetFont(font,38,"OUTLINE")
--end
--f.logoText:SetPoint("LEFT",f.logo,"RIGHT",10,0)
--f.logoText:SetText("魔兽精灵")
--f.opLine = f:CreateTexture(nil,"OVERLAY")
--f.opLine:SetPoint("TOPLEFT",f.logo,"BOTTOMLEFT",50,0)
--f.opLine:SetTexture(texture)
--f.opLine:SetSize(f:GetWidth()-100,1)
--f.opLine:SetGradient("HORIZONTAL",1,1,1,.3,.3,.3)
--
--f.forward = CreateFrame("Button","Wowshell_ForwardButton",f)
--f.background = CreateFrame("Button","Wowshell_Background",f)
--f.forward:SetSize(40,40)
--f.background:SetSize(40,40)
--f.background:SetPoint("TOPRIGHT",f,-100,-10)
--f.forward:SetPoint("TOPRIGHT",f,-50,-10)
--f.forward.tex = f.forward:CreateTexture(nil,"OVERLAY")
--f.background.tex = f.background:CreateTexture(nil,"OVERLAY")
--f.forward.tex:SetTexture(tforward)
--f.background.tex:SetTexture(tback)
--f.forward.tex:SetAllPoints(f.forward)
--f.background.tex:SetAllPoints(f.background)
--
--
--for i = 1, #categorys do
--	local category = CreateFrame("Button","Wowshell_CategoryButton"..i,f)
--	category:SetSize(f:GetWidth()-100,20)
--	if i == 1 then
--		category:SetPoint("TOPLEFT",f,50,-70)
--	elseif i > 1 then
--		category:SetPoint("TOPLEFT",_G["Wowshell_CategoryButton"..(i-1)],0,-120)
--	end
--	category.bg = category:CreateTexture(nil,"ARTWORK")
--	category.bg:SetTexture(texture)
--	category.bg:SetVertexColor(.8,.8,.8,0)
--	category.bg:SetAllPoints(category)
--
--	category.fw = category:CreateFontString(nil,"OVERLAY","ChatFontNormal")
--	category.sw = category:CreateFontString(nil,"OVERLAY","ChatFontNormal")
--	do 
--		local font,size,flag = category.fw:GetFont()
--		category.fw:SetFont(font,28,"OUTLINE")
--		category.sw:SetFont(font,14,"OUTLINE")
--	end
--	category.fw:SetPoint("LEFT",category)
--	category.sw:SetPoint("BOTTOMLEFT",category.fw,"BOTTOMRIGHT")
--	local fw,sw = string.sub(categorys[i],1,3),string.sub(categorys[i],4)
--	category.fw:SetText(fw)
--	category.sw:SetText(sw)
--end
--
--for i = 1, 5 do
--	local uf = CreateFrame("Button","Wowshell_ChildButton"..i,f)
--	uf:SetSize(40,40)
--	uf.bg = uf:CreateTexture(nil,"OVERLAY")
--	uf.bg:SetTexture([[Interface/ICONS/Ability_Hunter_MarkedForDeath]])
--	uf.bg:SetTexCoord(.1,.9,.1,.9)
--	uf.bg:SetAllPoints(uf)
--	if i == 1 then
--		uf:SetPoint("TOPLEFT",f,50,-110)
--	else
--		uf:SetPoint("TOPLEFT",_G["Wowshell_ChildButton"..(i-1)],"TOPRIGHT",20,0)
--		uf.bg:SetDesaturated(true)
--	end
--	uf.text = uf:CreateFontString(nil,"OVERLAY","ChatFontNormal")
--	uf.text:SetText("test"..i)
--	uf.text:SetPoint("TOP",_G["Wowshell_ChildButton"..i],"BOTTOM",0,-4)
--end
--
--local uftip = CreateFrame("Frame",nil,f)
--uftip:SetSize(700,300)
--uftip:SetPoint("TOPLEFT",f,50,-70)
--uftip.bg = uftip:CreateTexture(nil,"OVERLAY")
--uftip.bg:SetTexture(texture)
--uftip.bg:SetAllPoints(uftip)
--uftip.bg:SetVertexColor(1,1,1,0)
--uftip.title = uftip:CreateFontString(nil,"OVERLAY","ChatFontNormal")
--uftip.author = uftip:CreateFontString(nil,"OVERLAY","ChatFontNormal")
--uftip.desc = uftip:CreateFontString(nil,"OVERLAY","ChatFontNormal")
--uftip.text = uftip:CreateFontString(nil,"OVERLAY","ChatFontNormal")
--uftip.text:SetPoint("TOPLEFT",uftip,80,-80)
--uftip.text:SetText("here is the test title text abcd")
--uftip:SetAlpha(0)
--
--Wowshell_ChildButton1:SetScript("OnClick",function()
--	local oldTime = GetTime()
--	f:SetScript("OnUpdate",function(self,elapsed)
--		self.nextUpdate = self.nextUpdate + elapsed
--		if self.nextUpdate > 0.01 then
--			local newTime = GetTime()
--			if (newTime - oldTime) < 1 then
--				local tempAlpha = 1-tonumber(string.format("%6.2f",(newTime - oldTime)))
--				for i = 1,#categorys do
--					if i > 1 then 
--						_G["Wowshell_CategoryButton"..i]:SetAlpha(tempAlpha)
--						_G["Wowshell_ChildButton"..i]:SetAlpha(tempAlpha)
--					end
--				end
--				uftip:SetAlpha(1-tempAlpha)
--			else
--				for i = 1,#categorys do
--					if i > 1 then 
--						_G["Wowshell_CategoryButton"..i]:SetAlpha(0)
--						_G["Wowshell_ChildButton"..i]:SetAlpha(0)
--					end
--				end
--
--				self:SetScript("OnUpdate",nil)
--			end
--			self.nextUpdate = 0
--		end
--	end)
--end)
--
--f.background:SetScript("OnClick",function()
--	local oldTime = GetTime()
--	f:SetScript("OnUpdate",function(self,elapsed)
--		self.nextUpdate = self.nextUpdate + elapsed
--		if self.nextUpdate > 0.01 then
--			local newTime = GetTime()
--			if (newTime - oldTime) < 1 then
--				local tempAlpha = tonumber(string.format("%6.2f",(newTime - oldTime)))
--				for i = 1,#categorys do
--					if i > 1 then 
--						_G["Wowshell_CategoryButton"..i]:SetAlpha(tempAlpha)
--						_G["Wowshell_ChildButton"..i]:SetAlpha(tempAlpha)
--					end
--				end
--				uftip:SetAlpha(1-tempAlpha)
--			else
--				for i = 1,#categorys do
--					if i > 1 then 
--						_G["Wowshell_CategoryButton"..i]:SetAlpha(1)
--						_G["Wowshell_ChildButton"..i]:SetAlpha(1)
--					end
--				end
--				uftip:SetAlpha(0)
--				self:SetScript("OnUpdate",nil)
--			end
--			self.nextUpdate = 0
--		end
--	end)		
--end)
--f.background:SetScript("OnEnter",function(self)
--	self.tex:SetVertexColor(.5,.5,.5,1)
--end)
--f.background:SetScript("OnLeave",function(self)
--	self.tex:SetVertexColor(1,1,1,1)
--end)
--f.forward:SetScript("OnEnter",function(self)
--	self.tex:SetVertexColor(.5,.5,.5,1)
--end)
--f.forward:SetScript("OnLeave",function(self)
--	self.tex:SetVertexColor(1,1,1,1)
--end)
--
--f.forward:SetScript("OnClick",function()
--	local oldTime = GetTime()
--	f:SetScript("OnUpdate",function(self,elapsed)
--		self.nextUpdate = self.nextUpdate + elapsed
--		if self.nextUpdate > 0.01 then
--			local newTime = GetTime()
--			if (newTime - oldTime) < 1 then
--				local tempAlpha = 1-tonumber(string.format("%6.2f",(newTime - oldTime)))
--				for i = 1,#categorys do
--					if i > 1 then 
--						_G["Wowshell_CategoryButton"..i]:SetAlpha(tempAlpha)
--						_G["Wowshell_ChildButton"..i]:SetAlpha(tempAlpha)
--					end
--				end
--				uftip:SetAlpha(1-tempAlpha)
--			else
--				for i = 1,#categorys do
--					if i > 1 then 
--						_G["Wowshell_CategoryButton"..i]:SetAlpha(0)
--						_G["Wowshell_ChildButton"..i]:SetAlpha(0)
--					end
--				end
--
--				self:SetScript("OnUpdate",nil)
--			end
--			self.nextUpdate = 0
--		end
--	end)
--end)
