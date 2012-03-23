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

function GUI:TipFrame()
	local mf = _G["Wowshell_MainFrame"]
	local f = CreateFrame("Frame","Wowshell_TipFrame",mf)
	f:SetSize(600,70)
	f:SetPoint("TOPLEFT",mf,"BOTTOMLEFT",0,-20)
	f:SetBackdrop({bgFile = bgTex,edgeFile = bgTex, edgeSize = 1,insets={top = 0, bottom = 0,left = 0,right = 0}})
	f:SetBackdropColor(.1,.1,.1,.5)
	f:SetBackdropBorderColor(0,0,0,1)
	f.text = f:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	f.text:SetSize(f:GetWidth()-20,f:GetHeight()-10)
	f.text:SetPoint("TOPLEFT",f,10,-5)
	f.text:SetText("")
	f.text:SetJustifyV("LEFT")
	f.text:SetJustifyH("TOP")
	f.nextUpdate = 0
	f:Hide()
	
end

function GUI:TipFrameOnShow(time)
	local f = _G["Wowshell_TipFrame"]
	local oldTime = time or GetTime() 
	f:SetScript("OnUpdate",function(self,elapsed)
		self.nextUpdate = self.nextUpdate + elapsed
		if self.nextUpdate > 0.01 then
			local newTime = GetTime()
			if newTime - oldTime < 1 then
				local tempAlpha = tonumber(string.format("%6.2f",(newTime - oldTime)))
				self:SetAlpha(tempAlpha)
			else
				self:SetAlpha(1)
				self:SetScript("OnUpdate",nil)
			end
			self.nextUpdate = 0
		end
	end)
end

function GUI:TipFrameOnHide(time)
	local f = _G["Wowshell_TipFrame"]
	local oldTime = time or GetTime() 
	f:SetScript("OnUpdate",function(self,elapsed)
		self.nextUpdate = self.nextUpdate + elapsed
		if self.nextUpdate > 0.01 then
			local newTime = GetTime()
			if newTime - oldTime < 1 then
				local tempAlpha = 1 - tonumber(string.format("%6.2f",(newTime - oldTime)))
				self:SetAlpha(tempAlpha)
			else
				self:SetAlpha(0)
				self:SetScript("OnUpdate",nil)
				self:Hide()
			end
			self.nextUpdate = 0
		end
	end)

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
	bar.uLog.text:SetPoint("RIGHT",bar.uLog)
end

function GUI:UpdateLog()
	local mf = _G["Wowshell_MainFrame"]
	local f = CreateFrame("Frame","Wowshell_UpdateLog_Frame",mf)
	f:SetSize(mf:GetWidth()-100,mf:GetHeight()-100)
	f:SetBackdrop({bgFile = bgTex,edgeFile = bgTex, edgeSize = 1,insets={top = 0, bottom = 0,left = 0,right = 0}})
	f:SetBackdropColor(0,0,0,0)
	f:SetBackdropBorderColor(0,0,0,1)
	f:SetPoint("TOP",mf,0,-80)
	f:SetFrameLevel(mf:GetFrameLevel()+10)
	f.bg = f:CreateTexture(nil,"OVERLAY")
	f.bg:SetTexture(bgTex)
	f.bg:SetAllPoints(f)
	f.bg:SetVertexColor(0.1,0.1,0.1,.8)
	f.title = f:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	do 
		local font,size,flag = f.title:GetFont()
		f.title:SetFont(font,24,"OUTLINE")
	end
	f.title:SetText(L["Log"])
	f.title:SetPoint("TOPLEFT",f,20,-20)
	f.content = f:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	f.content:SetSize(f:GetWidth()-20,f:GetHeight()-20)
	f.content:SetPoint("TOPLEFT",f.title,"BOTTOMLEFT",10,-20)
	f.content:SetText("1. xxxxxxxxxxxxx \n2. xxxxxxxxxxxxx \n3. xxxxxxxxxxxxx")
	f.content:SetJustifyV("TOP")
	f.content:SetJustifyH("LEFT")
	f.content:SetWordWrap(true)
	f.content:SetSpacing(10)
	f:Hide()
end

function GUI:MouseOverTipFrame()
	local mf = _G["Wowshell_MainFrame"] 
	local f = CreateFrame("Frame","Wowshell_GameTooltip",mf)
	f.nextUpdate = 0 
	f.nextFlag = 1
	f:SetFrameLevel(mf:GetFrameLevel()+8)
	f:SetSize(360,150)
	f:SetBackdrop({bgFile = bgTex,edgeFile = bgTex, edgeSize = 1,insets={top = 0, bottom = 0,left = 0,right = 0}})
	f:SetBackdropColor(.1,.1,.1,.8)
	f:SetBackdropBorderColor(0,0,0,1)
	f.addonName = f:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	f.category = f:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	f.suggest = f:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	f.suggest:SetSize(f:GetWidth()-20,30)
	f.suggest:SetJustifyH("LEFT")
	f.suggest:SetJustifyV("TOP")
	f.suggest:SetWordWrap(true)
	f.memory = f:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	f.addonName:SetPoint("TOPLEFT",f,10,-10)
	f.category:SetPoint("TOPLEFT",f.addonName,"BOTTOMLEFT",0,-10)
	f.memory:SetPoint("TOPLEFT",f.category,"BOTTOMLEFT",0,-10)
	f.suggest:SetPoint("TOPLEFT",f.memory,"BOTTOMLEFT",0,-10)
	f:Hide()
	f.left = f:CreateTexture(nil,"OVERLAY")
	f.right = f:CreateTexture(nil,"OVERLAY")
	f.left:SetSize(34,30)
	f.left:SetTexture(tex.."mouse")
	f.left:SetPoint("BOTTOMLEFT",f,5,5)
	f.click = f:CreateTexture(nil,"OVERLAY")
	f.click:SetSize(7,7)
	f.click:SetPoint("TOPLEFT",f.left,8,-4)
	f.click:SetTexture(tex.."o2")
	f.click:SetVertexColor(0,0,0,1)
	f.leftText = f:CreateFontString(nil,"OVERLAY","ChatFontNormal")
	f.leftText:SetPoint("BOTTOMLEFT",f.click,"BOTTOMRIGHT",25,-10)
	f.leftText:SetText(L["LeftClick"])
	f:SetScript("OnUpdate",function(self,elapsed)
		self.nextUpdate = self.nextUpdate + elapsed
		if self.nextUpdate > 0.5 then
			self.nextFlag = self.nextFlag + 1	
			if self.nextFlag % 2 == 0 then
				self.click:Hide()
			else
				self.click:Show()
			end
			self.nextUpdate = 0
		end
	end)
end

function GUI:MouseOverTipFrameSetPoint(parent)
	local f = _G["Wowshell_GameTooltip"]
	f:SetPoint("TOPLEFT",parent,"BOTTOMRIGHT")
end

ns.GUI = GUI
