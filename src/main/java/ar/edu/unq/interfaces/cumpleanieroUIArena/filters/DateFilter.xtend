package ar.edu.unq.interfaces.cumpleanieroUIArena.filters

import org.uqbar.arena.widgets.TextFilter
import org.uqbar.arena.widgets.TextInputEvent
import java.util.ArrayList

class DateFilter implements TextFilter {
	override accept(TextInputEvent event) {
		val expected = new ArrayList(#["\\d?", "\\d?", "/", "\\d?", "\\d?", "/", "\\d{0,4}"])
		val regex = expected.reverse.fold("")[result, element| '''(«element»«result»)?''']
		event.potentialTextResult.matches(regex)
	}
}