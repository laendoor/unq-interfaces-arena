package ar.edu.unq.interfaces.cumpleanieroUIArena.components

import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel

class Paragraph extends Label {
	
	new(Panel container) {
		super(container)
		this.fontSize = 14
	}
	
	new(Panel container, String text) {
		this(container)
		this.text = text
	}
	
}