package ar.edu.unq.interfaces.cumpleanieroUIArena

import ar.edu.unq.interfaces.cumpleaniero.Person
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Title
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Paragraph
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.LabeledCheckbox
import ar.edu.unq.interfaces.cumpleaniero.appModels.RaffleResultsAppModel

class RaffleResultsWindow extends SimpleWindow<RaffleResultsAppModel>
{
	new(WindowOwner parent, RaffleResultsAppModel appModel)
	{
		super(parent, appModel)
		title = "Sorteo"
		taskDescription = ""
	}
	
	override protected createFormPanel(Panel mainPanel)
	{
		new Title(mainPanel) => [
			text = "Resultados Sorteo"
		]
		new Paragraph(mainPanel) => [
			text = "Desde acá podrás ver los resultados del sorteo para cada uno y volver a realizarlo, cuantas veces quieras."
		]
		createCheckboxOptionsPanels(mainPanel)
		createAssignmentTable(mainPanel)
	}
	
	override protected addActions(Panel mainPanel)
	{
		new Button(mainPanel) =>
		[
			caption = "Volver a sortear"
			onClick [ | this.modelObject.shake ]
		]
		
	}
	
	private def createCheckboxOptionsPanels(Panel mainPanel)
	{
	    new LabeledCheckbox(mainPanel) =>
	    [
	    	text = "\nEl cumpleañero puede regalar en su cumple"
	    	bindValueToProperty("sameBirthday")
	    ]
	    
	    new LabeledCheckbox(mainPanel) =>
	    [
	    	text = "\nSe permiten regalar cruzados"
	    	bindValueToProperty("crossGifts")
	    ]
	}
	
	private def createAssignmentTable(Panel mainPanel)
	{
		var assignmentTable = new Table<Person>(mainPanel, typeof(Person)) =>
		[
			bindItemsToProperty("result")
		]
		
		new Column<Person>(assignmentTable) =>
		[
			title = "Nombre"
			bindContentsToProperty("name")
		]
		
		new Column<Person>(assignmentTable) =>
		[
			title = "Regala A"
			bindContentsToProperty("personToGive.name")	
		]
		
		new Column<Person>(assignmentTable) =>
		[
			title = "Le Regala"
			bindContentsToProperty("personWhoGives.name")
		]
	}
	
}