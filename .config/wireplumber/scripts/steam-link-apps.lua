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
			if si.properties["media.role"] == "Game" then
				local steam_link_stream_node_constraints = {
					Constraint({ "node.name", "=", "Steam" }),
					Constraint({ "media.class", "=", "Stream/Input/Audio" }),
				}
				local steam_link_stream_node = om:lookup(steam_link_stream_node_constraints)
				if steam_link_stream_node then
					local null_sink_node_constraint = {
						Constraint({ "node.name", "equals", "default_null_sink" }),
						Constraint({ "media.class", "=", "Audio/Sink" }),
					}

					local null_sink_node = om:lookup(null_sink_node_constraint)

					event:set_data("target", null_sink_node)
				end
			end
		end
	end,
}):register()
