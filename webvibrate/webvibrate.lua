local M = {}

M.verbose = false

local sysinfo = sys.get_sys_info()

local function is_html5()
	if sysinfo.system_name == "html5" then
		return true
	end
	return false
end

-- give a number of time in ms or a premade string of values
-- like "[100, 200, 100]"
function M.vibrate(duration)
	if M.verbose == true then print("WebVibrate: Vibrate for ... " .. duration) end
	if not is_html5() then return true end
	html5.run("window.navigator.vibrate(" .. tostring(duration) .. ")")
end

-- give a list of times in ms
function M.vibrate_pattern(duration_table)
	
	local pattern = "["
	for i,v in ipairs(duration_table) do
		pattern = pattern .. v
		if i < #duration_table then
			pattern = pattern .. ","
		end
	end
	pattern = pattern .. "]"
	M.vibrate(pattern)
end

function M.stop_vibrate()
	M.vibrate(0)
end

return M