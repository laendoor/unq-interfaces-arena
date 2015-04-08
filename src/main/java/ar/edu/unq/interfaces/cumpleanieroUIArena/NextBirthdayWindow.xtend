package ar.edu.unq.interfaces.cumpleanieroUIArena

import org.uqbar.arena.windows.SimpleWindow
import ar.edu.unq.interfaces.cumpleaniero.Raffle
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.tables.Table
import ar.edu.unq.interfaces.cumpleaniero.Person
import org.uqbar.arena.widgets.tables.Column

class NextBirthdayWindow extends SimpleWindow<Raffle>{
	
	new(WindowOwner parent, Raffle raffle) {
		super(parent, raffle)
		title = "Próximos"
		taskDescription = ""
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel) => [
			text = "Próximos Cumples"
			fontSize = 30
		]
		
		new Label(mainPanel) => [
			text = "Desde acá podrás buscar los cumpleaños que se vienen en orden para cada mes y año"
		]
		
		var selectPanel = new Panel(mainPanel)
		selectPanel.layout = new HorizontalLayout()
		
		new Label(selectPanel) => [
			text = "Año"
		]
		
		new Selector<String>(selectPanel) => [
			allowNull = false
			width = 100
		]
		
		new Label(selectPanel) => [
			text = "Mes"
		]
		
		new Selector<String>(selectPanel) => [
			allowNull = false
			width = 100
		]
		
		var assignmentTable = new Table<Person>(mainPanel, typeof(Person)) => [
//			bindItemsToProperty("people")
		]
		
		new Column<Person>(assignmentTable) => [
//		    title = "Día"
		]
		
		new Column<Person>(assignmentTable) => [
//			title = "Nombre"
		]
	}
	
	override protected addActions(Panel actionsPanel) {
		
	}
	
}