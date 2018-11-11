#define MAX_MOOD 10
#define MIN_MOOD -10

/mob/living/carbon/human
	var/datum/mood_handler/mood_handler
	var/list/moods = list()
	proc/handle_mood()
		spawn
			if(health <= maxhealth / 2)
				mood = 4
				moodMessage = "Fuck this"
			if(health <= maxhealth / 2.5)
				mood = 2
				moodMessage = "kil >>>>>"
			if(health >= maxhealth / 2)
				mood = 9
				moodMessage = "ok mula"
		spawn(4)
		return

datum
	mood_handler
		var/mob/living/carbon/human/owner

		New(var/mob/living/carbon/human/_owner)
			owner = _owner

		proc
			currentMoodDescs()
				var/text = ""
				for(var/datum/mood/m in owner.moods)
					text += m.desc
				return text

			processMoodValues()
				for(var/datum/mood/m in owner.moods)
					owner.mood += m.getMoodAdditive()
					if(owner.mood <= MIN_MOOD)
						owner.mood = MIN_MOOD
					if(owner.mood >= MAX_MOOD)
						owner.mood = MAX_MOOD

			clampOwnerMood()
				owner.mood = max(min(owner.mood, MAX_MOOD),MIN_MOOD)

datum
	mood
		var/moodAdditive = 0
		var/mob/owner
		var/_icon_state = ""

		var/desc = "ok mula"

		proc/getMoodAdditive()
			var/num = max(min(moodAdditive, MAX_MOOD),MIN_MOOD)
			return num

		proc/adjustMood(nVal)
			moodAdditive = max(nVal,MIN_MOOD)

		proc/addMoodToOwner()
			owner:mood = max(moodAdditive,MIN_MOOD)

		proc/changeIconState(newIconState)
			_icon_state = newIconState || "default"