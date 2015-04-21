package ar.edu.unq.interfaces.cumpleanieroUIArena

import org.uqbar.arena.windows.SimpleWindow
import ar.edu.unq.interfaces.cumpleaniero.Raffle
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.tables.Table
import ar.edu.unq.interfaces.cumpleaniero.Person
import org.uqbar.arena.widgets.tables.Column
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Title
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Paragraph
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.LabeledSelector

class NextBirthdayWindow extends SimpleWindow<Raffle>{
	
	new(WindowOwner parent, Raffle raffle) {
		super(parent, raffle)
		title = "Próximos"
		taskDescription = ""
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		new Title(mainPanel) => [
			text = "Próximos Cumples"
		]
		
		new Paragraph(mainPanel) => [
			text = "Desde acá podrás buscar los cumpleaños que se vienen en orden para cada mes y año"
		]
		
		var selectsPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		
		new LabeledSelector(selectsPanel, "Año");
		
		new LabeledSelector(selectsPanel, "Mes");
		
		
		var assignmentTable = new Table<Person>(mainPanel, typeof(Person)) => [
			// bindItemsToProperty("people")
		]
		
		new Column<Person>(assignmentTable) => [
			// title = "Día"
		]
		
		new Column<Person>(assignmentTable) => [
			// title = "Nombre"
		]
	}
	
	override protected addActions(Panel actionsPanel) {
		
	}
	
}