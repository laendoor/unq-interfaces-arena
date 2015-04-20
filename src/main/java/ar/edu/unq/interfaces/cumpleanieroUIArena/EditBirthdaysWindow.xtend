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
import ar.edu.unq.interfaces.cumpleaniero.appModels.EditBirthdaysAppModel
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Title
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Paragraph
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Subtitle

class EditBirthdayWindow extends SimpleWindow<EditBirthdaysAppModel> {
	
	new(WindowOwner parent, EditBirthdaysAppModel editAppModel) {
		super(parent, editAppModel)
		title = "Editar"
		taskDescription = ""
	}
	
	
	override protected createFormPanel(Panel mainPanel) {
		new Title(mainPanel, "Editor Cumpleaños");
		new Paragraph(mainPanel, "Desde acá podrás editar los participantes, y realizar el sorteo del encargado del regalo para cada uno")
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
			onClick [ | new RaffleResultsWindow(this, this.modelObject.raffle).open ]
		]
		
		new Subtitle(participantsPanel, "Participantes")
		
		var namePanel = new Panel(participantsPanel) => [ layout = new HorizontalLayout ]
		
		new Label(namePanel) => [
			text = "Nombre:"
			fontSize = 10
		]
		
		new TextBox(namePanel) => [ bindValueToProperty = "searchedPerson" ]
		
		createParticipantsTable(participantsPanel)
		
	}
	
	
	def createParticipantsTable(Panel parentPanel) {
		
		var participantsTable = new Table<Person>(parentPanel, typeof(Person)) => [
			bindItemsToProperty = "filteredPeople"
			bindValueToProperty = "selectedPerson"
		]
		
		new Column<Person>(participantsTable) => [
	   		title = "Nombre"
	   		bindContentsToProperty("name")
		]
		
		
		new Column<Person>(participantsTable) => [
	   		title = "Fecha"
	   		bindContentsToProperty("birthday")
		]
		

		new Column<Person>(participantsTable) => [
			title = "Participa"
			bindContentsToProperty("takePart")
		]
		
		new Button(parentPanel) => [
			caption = "Borrar"
			onClick [ | modelObject.deleteSelectedPerson() ]
		]
	}
	
	
	
	def createEditPanel(Panel parentPanel) {
		
		var editPanel = new Panel(parentPanel) => [
			layout = new VerticalLayout
		]
		
		new Button(editPanel) => [
			caption = "Nuevo"
			onClick [ | modelObject.createNewPerson() ]
		]
		
		createNameAndBirthdayPanel(editPanel)
		
		
		var checkBoxPanel = new Panel(editPanel) => [
			layout = new HorizontalLayout
		]
		
		new CheckBox(checkBoxPanel) => [
			bindValueToProperty("selectedPerson.takePart")
		]
		
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
			text = "Editando:"
			fontSize = 20
		]
		new Label(nameAndBirthdayPanel) => [
			fontSize = 20
			bindValueToProperty("selectedPerson.name")
		]
		
		new Label(nameAndBirthdayPanel) => [
			text = "Nombre:"
		]
		
		new TextBox(nameAndBirthdayPanel) => [
			bindValueToProperty("selectedPerson.name")
		]
		
		new Label(nameAndBirthdayPanel) => [
			text = "Cumple:"
		]
		
		new TextBox(nameAndBirthdayPanel) => [
			bindValueToProperty("selectedPerson.birthday")
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
			bindValueToProperty("selectedPerson.personToGive.name")	
		]
		
		new Label(giftsPanel) => [
			text = "Le Regala:"
		]
		
		new Label(giftsPanel) => [
			bindValueToProperty("selectedPerson.personWhoGives.name")
		]
	}
	
	
	override protected addActions(Panel mainPanel) {
		
	}
	
	
}
