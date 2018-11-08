/mob/living/carbon/human/
	var
		moodMessage = "Eveything is ok!"
		mood = 10 // 1 = kill 10 = nice

	verb/CheckMood()
		set category = "Mood"
		set name = "Check Mood"

		if(usr:moodMessage && usr:mood)
			usr << "\green ||||||||||||||||||||"
			usr << "\blue Your mood is:"
			usr << usr:moodMessage
			usr << "\blue Mood meter:"
			usr << usr:mood * 10
			usr << "\green ||||||||||||||||||||"
		else
			usr << "\red You have no mood!"