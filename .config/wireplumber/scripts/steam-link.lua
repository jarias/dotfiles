local lutils = require("linking-utils")
local log = Log.open_topic("s-linking")

SimpleEventHook({
	name = "linking/sample-find-user-target",
	before = "linking/find-defined-target",
	interests = {
		EventInterest({
			Constraint({ "event.type", "=", "select-target" }),
		}),
	},
	execute = function(event)
		local source, om, si, si_props, si_flags, target = lutils:unwrap_select_target_event(event)

		-- bypass the hook if the target is already picked up
		if target then
			return
		end

		log:info(si, "in find-user-target")

		if si ~= nil then
			if si.properties["media.class"] == "Stream/Input/Audio" and si.properties["node.name"] == "Steam" then
				local target_constraints = {
					Constraint({ "node.name", "equals", "default_null_sink" }),
					Constraint({ "media.class", "=", "Audio/Sink" }),
				}

				target = om:lookup(target_constraints)

				-- store the found target on the event,
				-- the next hooks will take care of linking
				event:set_data("target", target)
			end
		end
	end,
}):register()
