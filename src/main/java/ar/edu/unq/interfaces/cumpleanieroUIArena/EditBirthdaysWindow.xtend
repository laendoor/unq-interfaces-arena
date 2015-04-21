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
import ar.edu.unq.interfaces.cumpleaniero.appModels.RaffleResultsAppModel
import ar.edu.unq.interfaces.cumpleanieroUIArena.transformers.DateTableTransformer
import ar.edu.unq.interfaces.cumpleanieroUIArena.transformers.DateTextBoxTransformer
import ar.edu.unq.interfaces.cumpleanieroUIArena.transformers.TakePartTransformer
import ar.edu.unq.interfaces.cumpleanieroUIArena.filters.NameFilter
import ar.edu.unq.interfaces.cumpleanieroUIArena.filters.DateFilter

class EditBirthdayWindow extends SimpleWindow<EditBirthdaysAppModel> {
	
	new(WindowOwner parent, EditBirthdaysAppModel editAppModel) {
		super(parent, editAppModel)
		title = "Editar"
		taskDescription = ""
	}
	
	override protected addActions(Panel mainPanel) {
		// nothing in actions	
	}
	
	/**
	 * Dibuja el título, una descripción y llama al panel principal
	 */
	override protected createFormPanel(Panel mainPanel)
	{
		new Title(mainPanel) => [
			text = "Editor Cumpleaños"
		]
		new Paragraph(mainPanel) => [
			text = "Desde acá podrás editar los participantes, y realizar el sorteo del encargado del regalo para cada uno"
		]
		createEditBirthdayPanel(mainPanel)
	}
	
	/**
	 * Panel principal: 2 columnas
	 * 
	 * | Sortear/Participantes/Borrado || Nuevo/Edición |
	 */
	def createEditBirthdayPanel(Panel parentPanel)
	{
		var editBirthdayPanel = new Panel(parentPanel) => [
			layout = new HorizontalLayout
			width = 500 // no veo que funcione cambiarle el valor
		]
		
		createParticipantsPanel(editBirthdayPanel)
		createEditPanel(editBirthdayPanel)
	}
	
	/**
	 * Panel de Participantes: Vertical
	 * 
	 * Botón Sortear
	 * ----------------------
	 * Filtro
	 * ----------------------
	 * Tabla de Participantes
	 * ----------------------
	 * Botón Borrar
	 */
	def createParticipantsPanel(Panel parentPanel)
	{
		val resultsModel = new RaffleResultsAppModel(this.modelObject.raffle)
		
		var participantsPanel = new Panel(parentPanel) => [
			layout = new VerticalLayout
			width = 2000
		]
		
		new Button(participantsPanel) => [
			caption = "Sortear"
			onClick [ | new RaffleResultsWindow(this, resultsModel).open ]
		]
		
		new Subtitle(participantsPanel) => [
			text = "Participantes"
		]
		
		createFilterPanel(participantsPanel)
		createParticipantsTable(participantsPanel)
		
	}
	
	def createFilterPanel(Panel parentPanel)
	{
		var namePanel = new Panel(parentPanel) => [
			layout = new HorizontalLayout
		]
		
		new Label(namePanel) => [ 
			text = "Nombre:"
		]
		
		new TextBox(namePanel) => [ 
			bindValueToProperty = "searchedPerson"
			withFilter = new NameFilter
		]
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
			bindContentsToProperty("birthday").transformer = new DateTableTransformer
		]

		new Column<Person>(participantsTable) => [
			title = "Participa"
			bindContentsToProperty("takePart").transformer = new TakePartTransformer
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
		
		new Label(checkBoxPanel) => [ text = "Participa" ]
		
		
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
			withFilter = new NameFilter
		]
		
		new Label(nameAndBirthdayPanel) => [
			text = "Cumple:"
		]
		
		new TextBox(nameAndBirthdayPanel) => [
			bindValueToProperty("selectedPerson.birthday").transformer = new DateTextBoxTransformer
			withFilter = new DateFilter
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
			bindValueToProperty("selectedPerson.personToGive")	
		]
		
		new Label(giftsPanel) => [
			text = "Le Regala:"
		]
		
		new Label(giftsPanel) => [
			bindValueToProperty("selectedPerson.personWhoGives")
		]
	}
	
	
}
