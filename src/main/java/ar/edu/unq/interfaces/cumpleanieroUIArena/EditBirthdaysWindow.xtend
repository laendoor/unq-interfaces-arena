package ar.edu.unq.interfaces.cumpleanieroUIArena

import ar.edu.unq.interfaces.cumpleaniero.Person
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
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
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.LabeledTextbox
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.LabeledCheckbox
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.LabeledData

/*
 * FIXME importante!
 * 
 * No muestra bien los "Regala A" y "Le Regala"
 * 
 * Cuando realizás el sorteo los muestra,
 * pero cuando cambias de persona seleccionada
 * los pierde
 */

class EditBirthdayWindow extends SimpleWindow<EditBirthdaysAppModel> {
	
	new(WindowOwner parent, EditBirthdaysAppModel editAppModel) {
		super(parent, editAppModel)
		title = "Editar"
		taskDescription = ""
	}
	
	/**
	 * No hay panel de acciones explícito
	 * 
	 * Las acciones están repartidas en los diferentes paneles
	 */
	override protected addActions(Panel mainPanel) {
		// nothing in actions	
	}
	
	/**
	 * Form Panel
	 * 
	 * - Título
	 * - Descripción
	 * - Panel de Datos
	 */
	override protected createFormPanel(Panel mainPanel)
	{
		new Title(mainPanel) => [
			text = "Editor Cumpleaños"
		]
		new Paragraph(mainPanel) => [
			text = "Desde acá podrás editar los participantes, y realizar el sorteo del encargado del regalo para cada uno"
		]
		createDataPanel(mainPanel)
	}
	
	/**
	 * Panel de Datos
	 * 
	 * - Panel Izquierdo
	 * - Panel Derecho
	 */
	def createDataPanel(Panel parentPanel)
	{
		var dataPanel = new Panel(parentPanel) => [
			layout = new ColumnLayout(2)
		]
		createLeftPanel(dataPanel)
		createRightPanel(dataPanel)
	}
	
	/**
	 * Panel Izquierdo
	 * 
	 * - Action Sortear
	 * - Descripción
	 * - Búsqueda (filtro)
	 * - Tabla de Participantes
	 * - Action Borrar
	 */
	def createLeftPanel(Panel parentPanel)
	{
		val resultsModel = new RaffleResultsAppModel(this.modelObject.raffle)
		
		var leftPanel = new Panel(parentPanel) => [
			layout = new VerticalLayout
		]
		
		new Button(leftPanel) => [
			caption = "Sortear"
			onClick [ | new RaffleResultsWindow(this, resultsModel).open ]
		]
		
		new Subtitle(leftPanel, "Participantes") // FIXME que funcione igual que Title
		
		new LabeledTextbox(leftPanel) => [ 
			text = "Nombre:"
			bindValueToProperty = "searchedPerson"
			withFilter = new NameFilter
		]
		
		createParticipantsTable(leftPanel)
		
		new Button(leftPanel) => [
			caption = "Borrar"
			onClick [ | modelObject.deleteSelectedPerson() ]
		]
		
		// FIXME hack para que tengan la misma altura ambos paneles
		new Label(leftPanel) => [
			fontSize = 27
		]
	}
	
	/**
	 * Tabla de Participantes (filtrable)
	 * 
	 * - Nombre | Fecha de Cumpleaños | Participa del Sorteo
	 */
	def createParticipantsTable(Panel parentPanel) {
		
		var participantsTable = new Table<Person>(parentPanel, typeof(Person)) => [
			bindItemsToProperty = "filteredPeople"
			bindValueToProperty = "selectedPerson"
		]
		
		new Column<Person>(participantsTable) => [
	   		title = "Nombre"
	   		bindContentsToProperty = "name"
		]
		
		new Column<Person>(participantsTable) => [
	   		title = "Fecha"
			(bindContentsToProperty = "birthday").transformer = new DateTableTransformer
		]

		new Column<Person>(participantsTable) => [
			title = "Participa"
			(bindContentsToProperty = "takePart").transformer = new TakePartTransformer
		]
	}
	
	
	/**
	 * Panel Derecho
	 * 
	 * - Action Nueva Persona
	 * - Panel de Edicion y visualización
	 */
	def createRightPanel(Panel parentPanel) {
		
		var rightPanel = new Panel(parentPanel) => [
			layout = new VerticalLayout
		]
		
		new Button(rightPanel) => [
			caption = "Nuevo"
			onClick [ | modelObject.createNewPerson ]
		]
		
		createEditionPanel(rightPanel)
	}
	
	/**
	 * Panel de Edición
	 * 
	 * - Visualización de Person en edición
	 * - Labeled Input de nombre
	 * - Labeled Input de fecha de nacimiento
	 * - Labeled Checkbox de participación
	 * - Visualización de intercambio de regalos
	 */
	def createEditionPanel(Panel parentPanel)
	{
		new LabeledData(parentPanel) => [
			text = "Editando:"
			fontSize = 20
			bindValueToProperty = "selectedPerson"
		]
		
		new LabeledTextbox(parentPanel) => [
			text = "Nombre:"
			bindValueToProperty = "selectedPerson.name"
			withFilter = new NameFilter
		]
		
		new LabeledTextbox(parentPanel) => [
			text = "Cumple:"
			(bindValueToProperty = "selectedPerson.birthday").transformer = new DateTextBoxTransformer
			withFilter = new DateFilter
		]
		
		new LabeledCheckbox(parentPanel) => [
			text = "Participa"
			bindValueToProperty = "takePartSelectedPerson"
		]
		
		new LabeledData(parentPanel) => [
			text = "Regala A:"
			fontSize = 10
			bindValueToProperty = "selectedPerson.personToGive"
		]
		new LabeledData(parentPanel) => [
			text = "Le Regala:"
			fontSize = 10
			bindValueToProperty = "selectedPerson.personWhoGives"
		]
	}
	
}
