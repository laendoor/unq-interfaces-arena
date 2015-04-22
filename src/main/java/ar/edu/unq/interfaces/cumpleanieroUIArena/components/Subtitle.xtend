package ar.edu.unq.interfaces.cumpleanieroUIArena.components

import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel

class Subtitle extends Label {
	
	new(Panel container) {
		super(container)
		this.fontSize = 20
	}
	
	def text(String t){
		text = t
	}
	
}