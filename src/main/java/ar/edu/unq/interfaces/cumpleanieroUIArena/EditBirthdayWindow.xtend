package ar.edu.unq.interfaces.cumpleanieroUIArena

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.interfaces.cumpleaniero.Person
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Table

class EditBirthdayWindow extends SimpleWindow<Person> {
	
	new(WindowOwner parent, Person person) {
		super(parent, person)
		title = "Editar"
		taskDescription = ""
	}
	
	
	override protected createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel) => [
			text = "Editar Cumpleaños"
			fontSize = 25
		]
		
		new Label(mainPanel) => [
			text = "Desde acá podrás editar los participantes, y realizar el sorteo del encargado del regalo para cada uno"
		]
		
		createTwoColumnPanel(mainPanel)
		
	}
	
	
	def createTwoColumnPanel(Panel parentPanel) {
		
		var twoColumnPanel = new Panel(parentPanel) => [
			layout = new ColumnLayout(2)
			width = 200
		]
		
		createParticipantsPanel(twoColumnPanel)
		
		createEditPanel(twoColumnPanel)
	}
	
	
	def createParticipantsPanel(Panel parentPanel) {
		
		var participantsPanel = new Panel(parentPanel) => [
			layout = new VerticalLayout
			width = 2000
		]
		
		new Button(participantsPanel) => [
			caption = "Sortear"
			onClick [ ]
		]
		
		new Label(participantsPanel) => [
			text = "Participantes"
			fontSize = 20
		]
		
		var namePanel = new Panel(participantsPanel) => [
			layout = new HorizontalLayout
		]
		
		new Label(namePanel) => [
			text = "Nombre:"
			fontSize = 10
		]
		
		new TextBox(namePanel)
		
		
		new Table<Person>(participantsPanel, typeof(Person)) => [
			
			
			
		]
	}
	
	def createEditPanel(Panel parentPanel) {
		
		var editPanel = new Panel(parentPanel) => [
			layout = new VerticalLayout
			width = 2000
		]
		
		new Label(editPanel) => [
			text = "Editando"
			fontSize = 20
		]
	}
	
	
	override protected addActions(Panel mainPanel) {
		
	}
	
	
}
