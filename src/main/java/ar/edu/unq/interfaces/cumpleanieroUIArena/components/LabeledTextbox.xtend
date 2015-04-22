package ar.edu.unq.interfaces.cumpleanieroUIArena.components

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.TextFilter

class LabeledTextbox extends Panel {
	
	Label label
	TextBox textbox;
	
	new(Container container)
	{
		super(container)
		val panel = new Panel(this) => [
			layout = new ColumnLayout(2)
		]
		
		label = new Label(panel)
		textbox = new TextBox(panel)
	}
	
	def text(String text)
	{
		label.setText(text)
	}
	
	def bindValueToProperty(String property)
	{
		textbox.bindValueToProperty(property)
	}
	
	def withFilter(TextFilter filter){
		textbox.withFilter(filter)
	}
	
}
