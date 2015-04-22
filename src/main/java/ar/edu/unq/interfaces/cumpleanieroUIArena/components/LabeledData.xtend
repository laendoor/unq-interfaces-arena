package ar.edu.unq.interfaces.cumpleanieroUIArena.components

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout

class LabeledData extends Panel {
	
	Label label
	Label data;
	
	new(Container container)
	{
		super(container)
		val panel = new Panel(this) => [
			layout = new ColumnLayout(2)
		]
		
		label = new Label(panel)
		data = new Label(panel)
	}
	
	def text(String text)
	{
		label.setText = text
	}
	
	def fontSize(int size)
	{
		label.fontSize = size
		data.fontSize = size
	}
	
	def bindValueToProperty(String property)
	{
		data.bindValueToProperty = property
	}
	
}
