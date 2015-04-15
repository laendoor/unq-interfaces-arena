package ar.edu.unq.interfaces.cumpleanieroUIArena

import ar.edu.unq.interfaces.cumpleaniero.Person
import ar.edu.unq.interfaces.cumpleaniero.Raffle
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Title
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Paragraph
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.LabeledCheckbox

class RaffleWindow extends SimpleWindow<Raffle>{
	
	new(WindowOwner parent, Raffle raffle) {
		super(parent, raffle)
		title = "Sorteo"
		taskDescription = ""
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Title(mainPanel, "Resultados Sorteo")
		new Paragraph(mainPanel, "Desde acá podrás ver los resultados del sorteo para cada uno y volver a realizarlo, cuantas veces quieras.")
		createCheckboxOptionsPanels(mainPanel)
		createAssignmentTable(mainPanel)
	}
	
	private def createCheckboxOptionsPanels(Panel mainPanel) {
	    new LabeledCheckbox(mainPanel, "El cumpleañero puede regalar en su cumple")
   		new LabeledCheckbox(mainPanel, "Se permiten regalar cruzados")
	}
	
	private def createAssignmentTable(Panel mainPanel) {
		var assignmentTable = new Table<Person>(mainPanel, typeof(Person)) => [
			bindItemsToProperty("people")
		]
		
		new Column<Person>(assignmentTable) => [
		      		title = "Nombre"
		      		bindContentsToProperty("name")
		]
		
		new Column<Person>(assignmentTable) => [
			title = "Regala A"
			bindContentsToProperty("personToGive")	
		]
		
		new Column<Person>(assignmentTable) => [
			title = "Le Regala"
			bindContentsToProperty("personWhoGives")
		]
	}
	
	override protected addActions(Panel mainPanel) {
		
		new Button(mainPanel) => [
			caption = "Volver a sortear"
			onClick [ | this.getModelObject().shake() ]
		]
		
	}
	
	
	
}

