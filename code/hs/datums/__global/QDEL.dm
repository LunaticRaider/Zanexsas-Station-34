#ifdef DELETE_QUEUE_DEBUG
var/global/list/detailed_delete_count = list()
var/global/list/detailed_delete_gc_count = list()
#endif

#ifdef MACHINE_PROCESSING_DEBUG
var/global/list/detailed_machine_timings = list()
#endif
#ifdef QUEUE_STAT_DEBUG
var/global/list/queue_stat_list = list()
#endif

#define QDEL_HINT_HARDDEL_LOW 1

/**
 * qdel
 *
 * queues a var for deletion by the delete queue processor.
 * if used on /world, /list, /client, or /savefile, it just skips the queue.
 */

datum/var/qdeled = FALSE
datum/var/priority = QDEL_HINT_HARDDEL_LOW

datum/proc/qdeled()
	qdeled = TRUE
	return 1

datum/proc/Destroy()
	if(!qdeled) qdel(src)
	return QDEL_HINT_HARDDEL_LOW

datum/proc/dispose()
	if(src in special_processing)
		special_processing-=src
		return 1
	else
		return 0

proc/qdel(var/datum/O)
	if(!delete_queue)
		delete_queue = new /datum/dynamicQueue(100)

	if(!O)
		return

	switch(O.Destroy())
		if(QDEL_HINT_HARDDEL_LOW)
			if(O.priority != QDEL_HINT_HARDDEL_LOW) O.priority = QDEL_HINT_HARDDEL_LOW

	if (istype(O))
		O:dispose()
		if (istype(O, /atom/movable))
			O:loc = null
		#ifdef DELETE_QUEUE_DEBUG
		detailed_delete_gc_count[O.type]++
		#endif
		O.qdeled = 1
		delete_queue.enqueue("\ref[O]")
	else
		if(islist(O))
			O:len = 0
			del(O)
		else if(O == world)
			del(O)
			CRASH("Cannot qdel /world! Fuck you!")
		else if(istype(O, /client))
			del(O)
			CRASH("Cannot qdel /client! Fuck you!")
		else if(istype(O, /savefile))
			del(O)
			CRASH("Cannot qdel /savefile! Fuck you!")
		else
			CRASH("Cannot qdel this unknown type fock")
		/**
		 * We'll assume here that the object will be GC'ed.
		 * If the object is not GC'ed and must be explicitly deleted,
		 * the delete queue process will decrement the gc counter and
		 * increment the explicit delete counter for the type.
		 */
