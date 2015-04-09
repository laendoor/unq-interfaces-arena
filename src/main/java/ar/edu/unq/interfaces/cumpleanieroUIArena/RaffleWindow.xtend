package ar.edu.unq.interfaces.cumpleanieroUIArena

import ar.edu.unq.interfaces.cumpleaniero.Person
import ar.edu.unq.interfaces.cumpleaniero.Raffle
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout

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
		
		createCheckboxOptionsPanels(mainPanel)
		
		createAssignmentTable(mainPanel)
	
	}
	
	private def createCheckboxOptionsPanels(Panel mainPanel) {
		
		var checkboxsPanel = new Panel(mainPanel)
	    checkboxsPanel.setLayout(new ColumnLayout(2))
   		
   		new CheckBox(checkboxsPanel) => [
			bindValueToProperty("crossGifts")
			width = 20
		]
		
		new Label(checkboxsPanel) => [
			text = "El cumpleañero puede regalar en su cumple"
		]
		
		new CheckBox(checkboxsPanel) => [
			bindValueToProperty("giveGiftOnBirthday")
			width = 20
		]
		
		new Label(checkboxsPanel) => [
			text = "Se permiten regalar cruzados"
		]
		
		new Label(checkboxsPanel)		
		
//		var crossGiftsCheckboxPanel = new Panel(mainPanel)
//		crossGiftsCheckboxPanel.layout = new HorizontalLayout()
//		
//		
//		new CheckBox(crossGiftsCheckboxPanel) => [
//			bindValueToProperty("crossGifts")			
//		]
//		
//		new Label(crossGiftsCheckboxPanel) => [
//			text = "El cumpleañero puede regalar en su cumple"
//		]
		
//		var giveGiftOnBirthdayCheckboxPanel = new Panel(mainPanel)
//		giveGiftOnBirthdayCheckboxPanel.layout = new HorizontalLayout()
//		
//		new CheckBox(giveGiftOnBirthdayCheckboxPanel) => [	
//			bindValueToProperty("giveGiftOnBirthday")			
//		]
//		
//		new Label(giveGiftOnBirthdayCheckboxPanel) => [
//			text = "Se permiten regalar cruzados"
//		]
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

