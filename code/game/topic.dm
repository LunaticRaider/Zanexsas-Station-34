/world/Topic(T, addr, master, key)
	diary << "TOPIC: \"[T]\", from:[addr], master:[master], key:[key]"

	if (T == "ping")
		return "fuck you"

	else if(T == "players")
		return clients.len

	else if (T == "status")
		var/list/s = list()
		s["version"] = game_version
		s["mode"] = master_mode
		s["vote"] = config.allow_vote_mode
		s["ai"] = config.allow_ai
		s["host"] = host ? host : null
		s["players"] = list()
		var/n = 0
		for(var/mob/M in world)
			if(M.client)
				s["player[n]"] = M.client.key
				n++
		s["players"] = n
		return list2params(s)