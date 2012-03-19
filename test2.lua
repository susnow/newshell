local addon,ns = ...
local texture = "Interface\\Buttons\\WHITE8x8"
local logo = "Interface\\AddOns\\test2\\media\\wsLogo2"
local tback = "Interface\\AddOns\\test2\\media\\back.tga"
local tforward = "Interface\\AddOns\\test2\\media\\forward.tga"

local categorys = {"头像(UnitFrame)","动作条(ActionBar)","地图(Map)","团队(Raid)","战争游戏(PvP)"}

local f = CreateFrame("Frame","Wowshell_MainFrame",UIParent)
f.nextUpdate = 0
f:SetSize(800,600)
f:SetPoint("CENTER",UIParent)
f.bg = f:CreateTexture(nil,"ARTWORK")
f.bg:SetAllPoints(f)
f.bg:SetTexture(texture)
f.bg:SetVertexColor(.1,.1,.1,.5)
f.logo = f:CreateTexture(nil,"OVERLAY")
f.logo:SetTexture(logo)
f.logo:SetSize(50,50)
f.logo:SetPoint("TOPLEFT",10,-10)
f.logoText = f:CreateFontString(nil,"OVERLAY","ChatFontNormal")
do 
	local font,size,flag = f.logoText:GetFont()
	f.logoText:SetFont(font,38,"OUTLINE")
end
f.logoText:SetPoint("LEFT",f.logo,"RIGHT",10,0)
f.logoText:SetText("魔兽精灵")
f.opLine = f:CreateTexture(nil,"OVERLAY")
f.opLine:SetPoint("TOPLEFT",f.logo,"BOTTOMLEFT",50,0)
f.opLine:SetTexture(texture)
f.opLine:SetSize(f:GetWidth()-100,1)
f.opLine:SetGradient("HORIZONTAL",1,1,1,.3,.3,.3)

f.forward = CreateFrame("Button","Wowshell_ForwardButton",f)
f.background = CreateFrame("Button","Wowshell_Background",f)
f.forward:SetSize(40,40)
f.background:SetSize(40,40)
f.background:SetPoint("TOPRIGHT",f,-100,-10)
f.forward:SetPoint("TOPRIGHT",f,-50,-10)
f.forward.tex = f.forward:CreateTexture(nil,"OVERLAY")
f.background.tex = f.background:CreateTexture(nil,"OVERLAY")
f.forward.tex:SetTexture(tforward)
f.background.tex:SetTexture(tback)
f.forward.tex:SetAllPoints(f.forward)
f.background.tex:SetAllPoints(f.background)


for i = 1, #categorys do
	local category = CreateFrame("Button","Wowshell_CategoryButton"..i,f)
	category:SetSize(f:GetWidth()-100,20)
	if i == 1 then
		category:SetPoint("TOPLEFT",f,50,-70)
	elseif i > 1 then
		category:SetPoint("TOPLEFT",_G["Wowshell_CategoryButton"..(i-1)],0,-120)
	end
	category.bg = category:CreateTexture(nil,"ARTWORK")
	category.bg:SetTexture(texture)
	category.bg:SetVertexColor(.8,.8,.8,0)
	category.bg:SetAllPoints(category)

	category.fw = category:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	category.sw = category:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	do 
		local font,size,flag = category.fw:GetFont()
		category.fw:SetFont(font,28,"OUTLINE")
		category.sw:SetFont(font,14,"OUTLINE")
	end
	category.fw:SetPoint("LEFT",category)
	category.sw:SetPoint("BOTTOMLEFT",category.fw,"BOTTOMRIGHT")
	local fw,sw = string.sub(categorys[i],1,3),string.sub(categorys[i],4)
	category.fw:SetText(fw)
	category.sw:SetText(sw)
end

for i = 1, 5 do
	local uf = CreateFrame("Button","Wowshell_ChildButton"..i,f)
	uf:SetSize(40,40)
	uf.bg = uf:CreateTexture(nil,"OVERLAY")
	uf.bg:SetTexture([[Interface/ICONS/Ability_Hunter_MarkedForDeath]])
	uf.bg:SetTexCoord(.1,.9,.1,.9)
	uf.bg:SetAllPoints(uf)
	if i == 1 then
		uf:SetPoint("TOPLEFT",f,50,-110)
	else
		uf:SetPoint("TOPLEFT",_G["Wowshell_ChildButton"..(i-1)],"TOPRIGHT",20,0)
		uf.bg:SetDesaturated(true)
	end
	uf.text = uf:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	uf.text:SetText("test"..i)
	uf.text:SetPoint("TOP",_G["Wowshell_ChildButton"..i],"BOTTOM",0,-4)
end

local uftip = CreateFrame("Frame",nil,f)
uftip:SetSize(700,300)
uftip:SetPoint("TOPLEFT",f,50,-70)
uftip.bg = uftip:CreateTexture(nil,"OVERLAY")
uftip.bg:SetTexture(texture)
uftip.bg:SetAllPoints(uftip)
uftip.bg:SetVertexColor(1,1,1,0)
uftip.title = uftip:CreateFontString(nil,"OVERLAY","ChatFontNormal")
uftip.author = uftip:CreateFontString(nil,"OVERLAY","ChatFontNormal")
uftip.desc = uftip:CreateFontString(nil,"OVERLAY","ChatFontNormal")
uftip.text = uftip:CreateFontString(nil,"OVERLAY","ChatFontNormal")
uftip.text:SetPoint("TOPLEFT",uftip,80,-80)
uftip.text:SetText("here is the test title text abcd")
uftip:SetAlpha(0)

Wowshell_ChildButton1:SetScript("OnClick",function()
	local oldTime = GetTime()
	f:SetScript("OnUpdate",function(self,elapsed)
		self.nextUpdate = self.nextUpdate + elapsed
		if self.nextUpdate > 0.01 then
			local newTime = GetTime()
			if (newTime - oldTime) < 1 then
				local tempAlpha = 1-tonumber(string.format("%6.2f",(newTime - oldTime)))
				for i = 1,#categorys do
					if i > 1 then 
						_G["Wowshell_CategoryButton"..i]:SetAlpha(tempAlpha)
						_G["Wowshell_ChildButton"..i]:SetAlpha(tempAlpha)
					end
				end
				uftip:SetAlpha(1-tempAlpha)
			else
				for i = 1,#categorys do
					if i > 1 then 
						_G["Wowshell_CategoryButton"..i]:SetAlpha(0)
						_G["Wowshell_ChildButton"..i]:SetAlpha(0)
					end
				end

				self:SetScript("OnUpdate",nil)
			end
			self.nextUpdate = 0
		end
	end)
end)

f.background:SetScript("OnClick",function()
	local oldTime = GetTime()
	f:SetScript("OnUpdate",function(self,elapsed)
		self.nextUpdate = self.nextUpdate + elapsed
		if self.nextUpdate > 0.01 then
			local newTime = GetTime()
			if (newTime - oldTime) < 1 then
				local tempAlpha = tonumber(string.format("%6.2f",(newTime - oldTime)))
				for i = 1,#categorys do
					if i > 1 then 
						_G["Wowshell_CategoryButton"..i]:SetAlpha(tempAlpha)
						_G["Wowshell_ChildButton"..i]:SetAlpha(tempAlpha)
					end
				end
				uftip:SetAlpha(1-tempAlpha)
			else
				for i = 1,#categorys do
					if i > 1 then 
						_G["Wowshell_CategoryButton"..i]:SetAlpha(1)
						_G["Wowshell_ChildButton"..i]:SetAlpha(1)
					end
				end
				uftip:SetAlpha(0)
				self:SetScript("OnUpdate",nil)
			end
			self.nextUpdate = 0
		end
	end)		
end)
f.background:SetScript("OnEnter",function(self)
	self.tex:SetVertexColor(.5,.5,.5,1)
end)
f.background:SetScript("OnLeave",function(self)
	self.tex:SetVertexColor(1,1,1,1)
end)
f.forward:SetScript("OnEnter",function(self)
	self.tex:SetVertexColor(.5,.5,.5,1)
end)
f.forward:SetScript("OnLeave",function(self)
	self.tex:SetVertexColor(1,1,1,1)
end)

f.forward:SetScript("OnClick",function()
	local oldTime = GetTime()
	f:SetScript("OnUpdate",function(self,elapsed)
		self.nextUpdate = self.nextUpdate + elapsed
		if self.nextUpdate > 0.01 then
			local newTime = GetTime()
			if (newTime - oldTime) < 1 then
				local tempAlpha = 1-tonumber(string.format("%6.2f",(newTime - oldTime)))
				for i = 1,#categorys do
					if i > 1 then 
						_G["Wowshell_CategoryButton"..i]:SetAlpha(tempAlpha)
						_G["Wowshell_ChildButton"..i]:SetAlpha(tempAlpha)
					end
				end
				uftip:SetAlpha(1-tempAlpha)
			else
				for i = 1,#categorys do
					if i > 1 then 
						_G["Wowshell_CategoryButton"..i]:SetAlpha(0)
						_G["Wowshell_ChildButton"..i]:SetAlpha(0)
					end
				end

				self:SetScript("OnUpdate",nil)
			end
			self.nextUpdate = 0
		end
	end)
end)
