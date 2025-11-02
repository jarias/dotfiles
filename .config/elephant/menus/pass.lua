Name = "pass"
NamePretty = "pass"
Cache = true
HideFromProviderlist = false
SearchName = true
Icon = "gcr-password"
Description = "pass"

function GetEntries()
	local entries = {}
	local wallpaper_dir = "/home/jarias/.password-store"

	local handle = io.popen("find '" .. wallpaper_dir .. "' -type f -name '*.gpg' 2>/dev/null")
	if handle then
		for line in handle:lines() do
			local filename = line:match("^/home/jarias/%.password%-store/(.*).gpg")
			if filename then
				table.insert(entries, {
					Text = filename,
					Subtext = "password",
					Value = filename,
					Actions = {
						copy = "/home/jarias/.local/bin/passmenu %VALUE%",
					},
				})
			end
		end
		handle:close()
	end

	return entries
end
