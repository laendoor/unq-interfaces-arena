package ar.edu.unq.interfaces.cumpleanieroUIArena.components

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout

class LabeledSelector<T> extends Panel {
	
	var Selector<T> selector
	
	new(Container container, String labelText) {		
		super(container)
		new Label(this) => [
			layout = new HorizontalLayout
			text = labelText
		]
		selector = new Selector<T>(this)
	}
	
	def bindValueToProperty(String property) {
		selector.bindValueToProperty(property)
	}
	
	def bindItemsToProperty(String property){
		selector.bindItemsToProperty(property)
	}
	
}