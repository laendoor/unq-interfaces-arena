package ar.edu.unq.interfaces.cumpleanieroUIArena

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.interfaces.cumpleaniero.Raffle
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import ar.edu.unq.interfaces.cumpleaniero.Person
import org.uqbar.arena.widgets.Button


class RaffleWindow extends SimpleWindow<Raffle>{
	
	new(WindowOwner parent, Raffle raffle) {
		super(parent, raffle)
		title = "Sorteo"
		taskDescription = ""
	}
	
	override protected createFormPanel(Panel mainPanel) {
	
		new Label(mainPanel) => [
			text = "Resultados Sorteo"
			fontSize = 30
		]
		
		new Label(mainPanel) => [
			text = "Desde acá podrás ver los resultados del sorteo para cada uno y volver a realizarlo, cuantas veces quieras."
		]
		
		var firstCheckboxPanel = new Panel(mainPanel)
		firstCheckboxPanel.layout = new HorizontalLayout()
		
		
		new CheckBox(firstCheckboxPanel) => [
//			bindEnabledToProperty("marriable")
//			bindValueToProperty("married")			
		]
		
		new Label(firstCheckboxPanel) => [
			text = "El cumpleañero puede regalar en su cumple"
		]
		
		var secondCheckboxPanel = new Panel(mainPanel)
		secondCheckboxPanel.layout = new HorizontalLayout()
		
		new CheckBox(secondCheckboxPanel) => [	
//			bindEnabledToProperty("marriable")
//			bindValueToProperty("married")			
		]
		
		new Label(secondCheckboxPanel) => [
			text = "Se permiten regalar cruzados"
		]
		
		var table = new Table<Person>(mainPanel, typeof(Person)) => [
			bindItemsToProperty("people")
		]
		
		new Column<Person>(table) => [
      		title = "Nombre"
      		bindContentsToProperty("name")
		]
		
		new Column<Person>(table) => [
			title = "Regala A"
			bindContentsToProperty("personToGive")	
		]
		
		new Column<Person>(table) => [
			title = "Le Regala"
			bindContentsToProperty("personWhoGives")
		]


		
	}
	
	override protected addActions(Panel mainPanel) {
		
		new Button(mainPanel) => [
			caption = "Volver a sortear"
		]
		
	}
	
	
	
}

