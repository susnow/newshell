---------------------------------------
-- wowshell locale
-- $Revision: 1847 $
-- $Date: 2009-03-30 09:08:27 +0800 (一, 2009-03-30) $
---------------------------------------
wsLocale = wsLocale or {};

if not wsLocale then return end

wsLocale.apps = {}
wsLocale.appNames = {}

local GameLocale = GetLocale();

if GameLocale == "enGB" then
	GameLocale = "enUS"
end

-- L["xxx"] = true or  L["xxx"] = "opoo";
local readMeta = {
	__index = function(t, k)
		geterrorhandler()
		rawset(t, k, k);
		return k
	end
}

local registering

local assertfalse = function() assert(false) end

local writeprox = setmetatable({}, {
	__newindex = function(t, k, v)
		rawset(registering, k, v == true and k or v);
	end,
	__index = assertfalse;
})

local writedefaultprox = setmetatable({}, {
	__newindex = function(t, k, v)
		if not rawget(registering, k) then
			rawset(registering, k, v == true and k or v);
		end
	end,
	__index = assertfalse;
})

--public
-- app -- 应用插件
-- lang -- 语言类型
-- isDefault 是否是默认
function wsLocale:NewLocale(application, lang, isDefault)
	local gameLocale = GAME_LOCALE or GameLocale;
	
	if lang ~= gameLocale and not isDefault then
		return
	end
	
	local app = wsLocale.apps[application];
	if not app then
		app = setmetatable({}, readMeta);
		wsLocale.apps[application] = app;
		wsLocale.appNames[app] = application
	end

	registering = app

	if isDefault then
		return writedefaultprox
	end

	return writeprox
end

function wsLocale:GetLocale(application)
	local app = wsLocale.apps[application];
	if not app then error(format("%q不存在", application), 2) end

	return wsLocale.apps[application]
end