datum
	skill
		var
			datum/skillGroup/group

			inCdText = "its in cd nigger"
			magicWords = "abracadabra"

			sp = 1
			cd = 0
			cooldown = 10

		proc/skill()

		proc/beforeCast()
			if(cd < world.time)
				return 1
			else src << inCdText

		proc/afterCast()
			if(magicWords != "" && magicWords)
				group.owner.say(magicWords)
			if(cooldown && cd)
				cd = world.time + cooldown
			else
				while(1)
					world << "OOF OOFOFOFOO" //quem mando nao sabe coda, now you doomed the serber