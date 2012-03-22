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
	local mf = CreateFrame("ScrollFrame","Wowshell_MainFrame",UIParent)
	mf.nextUpdate = 0
	mf:SetSize(800,600)
	mf:SetPoint("CENTER")
	mf:SetBackdrop({bgFile = bgTex,edgeFile = bgTex, edgeSize = 1,insets={top = 0, bottom = 0,left = 0,right = 0}})
	mf:SetBackdropColor(.1,.1,.1,.5)
	mf:SetBackdropBorderColor(0,0,0,1)
	mf.logo = CreateFrame("Button","Wowshell_Logo",mf)
	mf.logo:SetSize(50,50)
	mf.logo:SetPoint("TOPLEFT",10,-10)
	mf.logo.bg = mf.logo:CreateTexture(nil,"OVERLAY")
	mf.logo.bg:SetAllPoints(mf.logo)
	mf.logo.bg:SetTexture(logoTex)
	mf.logo.title = mf.logo:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	mf.logo.title:SetPoint("BOTTOMLEFT",mf.logo,"BOTTOMRIGHT",10,0)
	do 
		local font,size,flag = mf.logo.title:GetFont()
		mf.logo.title:SetFont(font,38,"OUTLINE")
	end
	mf.logo.title:SetText(L["Wowshell"])	

	mf.opLine = mf:CreateTexture(nil,"OVERLAY")
	mf.opLine:SetSize(mf:GetWidth()-100,1)
	mf.opLine:SetPoint("TOPLEFT",mf.logo,"BOTTOMLEFT",50,-10)
	mf.opLine:SetTexture(bgTex)
	mf.opLine:SetGradient("HORIZONTAL",1,1,1,.3,.3,.3)
	mf.resize = CreateFrame("Button","Wowshell_ResizeButton",mf)
	mf.resize:SetSize(10,10)
	mf.resize:SetPoint("BOTTOMRIGHT",mf,-1,1)
	mf.resize.bg = mf.resize:CreateTexture(nil,"OVERLAY")
	mf.resize.bg:SetAllPoints(mf.resize)
	mf.resize.bg:SetTexture(tex.."resize3")
	mf.resize.bg:SetVertexColor(1,1,1,1)

	mf.resize:SetScript("OnEnter",function(self)
		self.bg:SetVertexColor(1,.5,.25)
	end)
	mf.resize:SetScript("OnLeave",function(self)
		self.bg:SetVertexColor(1,1,1)
	end)
	mf:EnableMouse(true)
	mf:RegisterForDrag("LeftButton")

--	mf.drag = CreateFrame("Frame",nil,mf)
--	mf.drag:SetSize(80,mf:GetHeight()-80)
--	mf.drag:SetPoint("BOTTOMRIGHT",mf,0,10)
--	mf.drag.tip = mf.drag:CreateFontString(nil,"OVERLAY","ChatFontNormal")
--	mf.drag.tip:SetPoint("TOPRIGHT",mf.drag)
--	mf.drag.tip:SetText(L["DragTip"])
--	mf.drag.tip:Hide()
--
--	mf.drag:SetScript("OnEnter",function(self)
--		self.tip:Show()
--	end)
--	mf.drag:SetScript("OnLeave",function(self)
--		self.tip:Hide()
--	end)
	--mf.drag:SetFrameLevel(mf:GetFrameLevel()-1)

	local f = CreateFrame("ScrollFrame","Wowshell_MainFrame_ScrollFrame_Parent",mf)
	f:SetSize(mf:GetWidth()-100,mf:GetHeight()-80)--2500)--520)
	f:SetPoint("TOPLEFT",mf,0,-80)
	

	local scf = CreateFrame("Frame","Wowshell_MainFrame_ScrollFrame",f)	
	scf.nextUpdate = 0
	scf:SetBackdrop({bgFile = bgTex,edgeFile = bgTex, edgeSize = 1,insets={top = 0, bottom = 0,left = 0,right = 0}})
	scf:SetBackdropBorderColor(1,1,1,0)
	scf:SetBackdropColor(0,0,0,0)
	scf:SetSize(f:GetWidth()-10,f:GetHeight()-10)
	scf:SetPoint("TOPLEFT",f,50,-50)
	f:SetScrollChild(scf)
	
	mf:SetScript("OnDragStart",function(self,button)
		local curX, curY = GetCursorPosition()
		local curScr = f:GetVerticalScroll()
		self:SetScript("OnUpdate",function(self,elapsed)
			self.nextUpdate = self.nextUpdate + elapsed
			if self.nextUpdate > 0.1 then
				local tmpX, tmpY = GetCursorPosition()
				if tmpY > curY then -- up
					f:SetVerticalScroll((curScr + (tmpY-curY)))	
				elseif tmpY < curY then --bottom
					local tmpScr = f:GetVerticalScroll()
					f:SetVerticalScroll((curScr - (curY-tmpY)))	
					if tmpScr < -60 then
						self:SetScript("OnUpdate",nil)
						f:SetVerticalScroll(0)
					end
				else
					
				end
				self.nextUpdate = 0
			end
		end)
	end)
	
	mf:SetScript("OnDragStop",function(self,button)
		self:SetScript("OnUpdate",nil)
	end)

	mf:SetScript("OnMouseDown",function(self,button)
		if IsLeftControlKeyDown() and button == "LeftButton" then
			self:SetMovable(true)
			self:StartMoving()
		end
	end)
	mf:SetScript("OnMouseUp",function(self,button)
		self:StopMovingOrSizing()
	end)

	mf.scf = scf
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
	--editbox:SetBackdropBorderColor(1,1,1,1)
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
	button.bg = button:CreateTexture(nil,"OVERLAY")
	button.bg:SetTexture(bgTex)
	button.bg:SetAllPoints(button)
	button.bg:SetVertexColor(.3,.3,.3,0) --.2
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

function GUI:CategoryButtonSetPoint(categorys,index)
	local button = _G["Wowshell_Category_"..categorys[index]:gsub("^%l",string.upper).."Button"]
	if index == 1 then 
		button:SetPoint("TOPLEFT",_G["Wowshell_MainFrame_ScrollFrame"],50,-20)	
	elseif index >1 then 
		button:SetPoint("TOPLEFT",_G["Wowshell_Category"..categorys[index-1].."_ChildFrame"],"BOTTOMLEFT",0,0)
	end
end

function GUI:CategoryChildFrame(parent)
	local f = CreateFrame("Frame","Wowshell_Category"..parent.."_ChildFrame",_G["Wowshell_Category_"..parent.."Button"])
	--f:SetSize(_G["Wowshell_Category_"..parent.."Button"]:GetWidth(),80)
	f:SetBackdrop({bgFile = bgTex,edgeFile = bgTex, edgeSize = 1,insets={top = 0, bottom = 0,left = 0,right = 0}})
	f:SetBackdropColor(1,1,1,0) -- .2
	f:SetBackdropBorderColor(0,0,0,0) -- 1
	f:SetPoint("TOPLEFT",_G["Wowshell_Category_"..parent.."Button"],"BOTTOMLEFT")
end

function GUI:CategoryChildFrameSetSize(parent,index)
	local f = _G["Wowshell_Category"..parent.."_ChildFrame"]
	local num = math.ceil(index/5)
	for i = 1, num do
		f:SetSize(_G["Wowshell_Category_"..parent.."Button"]:GetWidth(),100*i)
	end
end

function GUI:CategoryChildFrameButtons(parent,index)
	local button = CreateFrame("Button","Wowshell_Category"..parent.."_ChildFrame_Button"..index,_G["Wowshell_Category"..parent.."_ChildFrame"])
	button:SetSize(50,50)
	button:SetBackdrop({bgFile = bgTex,edgeFile = bgTex, edgeSize = 1,insets={top = 2, bottom = -2,left = 2,right = 2}})
	button:SetBackdropColor(.3,.3,.3,.2)
	button:SetBackdropBorderColor(0,0,0,1)
	button.bg = button:CreateTexture(nil,"OVERLAY")
	button.bg:SetPoint("TOPLEFT",1,-1)
	button.bg:SetPoint("BOTTOMRIGHT",-1,1)
	--button.bg:SetTexture([[Interface/ICONS/Ability_Hunter_MarkedForDeath]])
	button.bg:SetTexCoord(.1,.9,.1,.9)
	button.text = button:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	button.text:SetSize(button:GetWidth()+24,30)
	button.text:SetPoint("TOP",button,"BOTTOM",0,-10)
	button.text:SetWordWrap(true)
end

function GUI:CategoryChildFrameButtonsSetPoint(parent,index)
	local button = _G["Wowshell_Category"..parent.."_ChildFrame_Button"..index]
	local modNum = 5
	if index % modNum - 1 ~= 0 and index > modNum then 
		button:SetPoint("TOPLEFT",_G["Wowshell_Category"..parent.."_ChildFrame_Button"..(index-1)],"TOPRIGHT",90,0)
	elseif index % modNum - 1 == 0 and index > modNum then
		button:SetPoint("TOPLEFT",_G["Wowshell_Category"..parent.."_ChildFrame_Button"..(index-modNum)],"BOTTOMLEFT",0,-40)
	elseif index % modNum - 1 ~= 0 and index <= modNum then
		button:SetPoint("TOPLEFT",_G["Wowshell_Category"..parent.."_ChildFrame_Button"..(index-1)],"TOPRIGHT",90,0)
	elseif index == 1 then
		button:SetPoint("TOPLEFT",_G["Wowshell_Category"..parent.."_ChildFrame"],30,-20)	
	end
end

function GUI:StatsBar()
	local mf = _G["Wowshell_MainFrame"]
	local bar = CreateFrame("Frame","Wowshell_StatesBar",mf)
	bar:SetSize(mf:GetWidth(),30)
	bar:SetPoint("TOPLEFT",mf,"BOTTOMLEFT")
	bar.uLog = CreateFrame("Button","Wowshell_UpdateLog_Button",bar)
	bar.uLog:SetSize(150,bar:GetHeight())
	bar.uLog:SetPoint("BOTTOMRIGHT",bar)
	bar.uLog.text = bar.uLog:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	do 
		local font,size,flag = bar.uLog.text:GetFont()
		bar.uLog.text:SetFont(font,size,"OUTLINE")
	end
	bar.uLog.text:SetText("最后更新于 2012-03-22")
	bar.uLog.text:SetPoint("RIGHT",bar.uLog)
	bar.uLog:SetScript("OnEnter",function(self)
		self.text:SetTextColor(1,.5,.25)
		self.text:SetText(format(L["UpdateLogTip"],"2746"))
	end)
	bar.uLog:SetScript("OnLeave",function(self)
		self.text:SetTextColor(1,1,1)
	end)
	
end

function GUI:UpdateLog()

end

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

ns.GUI = GUI
