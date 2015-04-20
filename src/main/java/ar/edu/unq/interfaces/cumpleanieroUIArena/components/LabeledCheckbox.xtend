package ar.edu.unq.interfaces.cumpleanieroUIArena.components

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.layout.ColumnLayout

class LabeledCheckbox extends Panel {
	
	Label label
	CheckBox checkbox;
	
	new(Container container)
	{
		super(container)
		val panel = new Panel(this) => [
			layout = new ColumnLayout(2)
		]
		
		checkbox = new CheckBox(panel)
		label = new Label(panel) => [ layout = new HorizontalLayout ]
	}
	
	def text(String text)
	{
		label.setText(text)
	}
	
	def bindValueToProperty(String property)
	{
		checkbox.bindValueToProperty(property)
	}
	
	
	
}