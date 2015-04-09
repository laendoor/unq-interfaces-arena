package ar.edu.unq.interfaces.cumpleanieroUIArena

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.interfaces.cumpleaniero.Person
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button

class EditBirthdayWindow extends SimpleWindow<Person> {
	
	new(WindowOwner parent, Person person) {
		super(parent, person)
		title = "Editar"
		taskDescription = ""
	}
	
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel) => [
			text = "Editar Cumpleaños"
			fontSize = 30
		]
		
		new Label(mainPanel) => [
			text = "Desde acá podrás editar los participantes, y realizar el sorteo del encargado del regalo para cada uno"
		]
		
		new Label(mainPanel) => [
			
		]
	}
	
	
	override protected addActions(Panel panel) {
		new Button(panel) => [
			caption = "Sortear"
			onClick [ ]
		]
	}
	
	
}
