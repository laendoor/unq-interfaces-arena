package ar.edu.unq.interfaces.cumpleanieroUIArena.components

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.CheckBox

class LabeledCheckbox extends Panel {
	
	CheckBox checkbox;
	
	new(Container container, String labelText) {
		super(container)
		
		checkbox = new CheckBox(this)
		
		new Label(this) => [
			layout = new HorizontalLayout
			text = labelText
		]
	}
	
	def bindValueToProperty(String property) {
		checkbox.bindValueToProperty(property)
	}
	
}