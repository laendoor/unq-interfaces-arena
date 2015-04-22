package ar.edu.unq.interfaces.cumpleanieroUIArena.components

import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel

class Subtitle extends Label {
	
	new(Panel container, String label) {
		super(container)
		this.fontSize = 20
		text = label
	}
	
}