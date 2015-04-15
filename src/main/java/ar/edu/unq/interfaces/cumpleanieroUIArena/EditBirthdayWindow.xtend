package ar.edu.unq.interfaces.cumpleanieroUIArena

import ar.edu.unq.interfaces.cumpleaniero.Person
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

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
		
		createEditBirthdayPanel(mainPanel)
		
	}
	
	
	def createEditBirthdayPanel(Panel parentPanel) {
		
		var editBirthdayPanel = new Panel(parentPanel) => [
			layout = new HorizontalLayout
			width = 200
		]
			
		createParticipantsPanel(editBirthdayPanel)
		
		createEditPanel(editBirthdayPanel)
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
		
		
		createParticipantsTable(participantsPanel)
		
	}
	
	
	def createParticipantsTable(Panel parentPanel) {
		
		var participantsTable = new Table<Person>(parentPanel, typeof(Person))
		
		new Column<Person>(participantsTable) => [
			title = "Nombre"
			
		]
		
		new Column<Person>(participantsTable) => [
			title = "Fecha"
		]
		
		new Column<Person>(participantsTable) => [
			title = "Participa"
		]
		
		new Button(parentPanel) => [
			caption = "Borrar"
			onClick [ ]
		]
	}
	
	
	
	def createEditPanel(Panel parentPanel) {
		
		var editPanel = new Panel(parentPanel) => [
			layout = new VerticalLayout
		]
		
		new Button(editPanel) => [
			caption = "Nuevo"
			onClick [ ]
		]
		
		new Label(editPanel) => [
			text = "Editando:"
			fontSize = 20
		]
		
		createNameAndBirthdayPanel(editPanel)
		
		
		var checkBoxPanel = new Panel(editPanel) => [
			layout = new HorizontalLayout
		]
		
		new CheckBox(checkBoxPanel)
		
		new Label(checkBoxPanel) => [
			text = "Participa"
		]
		
		
		createGiftsPanel(editPanel)
	}
	
	
	def createNameAndBirthdayPanel(Panel parentPanel) {
		
		var nameAndBirthdayPanel = new Panel(parentPanel) => [
			layout = new ColumnLayout(2)
		]
		
		new Label(nameAndBirthdayPanel) => [
			text = "Nombre:"
		]
		
		new TextBox(nameAndBirthdayPanel) => [
			
		]
		
		new Label(nameAndBirthdayPanel) => [
			text = "Cumple:"
		]
		
		new TextBox(nameAndBirthdayPanel) => [
			
		]
	}
	
	
	def createGiftsPanel(Panel parentPanel) {
		var giftsPanel = new Panel(parentPanel) => [
			layout = new ColumnLayout(2)
		]
		
		new Label(giftsPanel) => [
			text = "Regala A:"
		]
		
		new Label(giftsPanel) => [
			
		]
		
		new Label(giftsPanel) => [
			text = "Le Regala:"
		]
		
		new Label(giftsPanel) => [
			
		]
	}
	
	
	override protected addActions(Panel mainPanel) {
		
	}
	
	
}
