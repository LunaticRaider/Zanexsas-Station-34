/proc/log_admin(text)
	admin_log.Add(text)
	if (config.log_admin)
		diary << "ADMIN: [text]"
	discord_relay("<@&464594497901166613> <@&480598635197759508> **ADMIN: [text]",AdminhelpWebhook)

/proc/log_game(text)
	if (config.log_game)
		diary << "GAME: [text]"
	discord_relay("<@&464594497901166613> <@&480598635197759508> **GAME: [text]",AdminhelpWebhook)

/proc/log_vote(text)
	if (config.log_vote)
		diary << "VOTE: [text]"
	discord_relay("<@&464594497901166613> <@&480598635197759508> **VOTE: [text]",AdminhelpWebhook)

/proc/log_access(text)
	if (config.log_access)
		diary << "ACCESS: [text]"
	discord_relay("<@&464594497901166613> <@&480598635197759508> **ACCESS: [text]",AdminhelpWebhook)

/proc/log_say(text)
	if (config.log_say)
		diary << "SAY: [text]"
	discord_relay("<@&464594497901166613> <@&480598635197759508> **SAY: [text]",AdminhelpWebhook)

/proc/log_ooc(text)
	if (config.log_ooc)
		diary << "OOC: [text]"
	discord_relay("<@&464594497901166613> <@&480598635197759508> **OOC: [text]",AdminhelpWebhook)

/proc/log_whisper(text)
	if (config.log_whisper)
		diary << "WHISPER: [text]"
	discord_relay("<@&464594497901166613> <@&480598635197759508> **WHISPER: [text]",AdminhelpWebhook)