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
import org.uqbar.commons.model.UserException
import ar.edu.unq.interfaces.cumpleaniero.exceptions.LimitTriesException

class RaffleResultsWindow extends SimpleWindow<RaffleResultsAppModel>
{
	new(WindowOwner parent, RaffleResultsAppModel appModel)
	{
		super(parent, appModel)
		title = "Sorteo"
		taskDescription = ""
		this.shake
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
		new Button(mainPanel) => [
			caption = "Volver a sortear"
			onClick [ | this.shake ]
		]
		
	}
	
	private def shake()
	{
		try
		{
			this.modelObject.shake
		}
		catch (Exception e) {
     		throw new UserException(e.message)
		}
//		catch(LimitTriesException e)
//		{
//			throw new UserException("Se ha intentado realizar el sorteo sin lograr una configuración válida. Intente nuevamente.")
//		}
	}
	
	/**
	 * Genera los checkbos para permitir (o no) regalos cruzados
	 * y que un participante regale a quien cumple el mismo día que él
	 */
	private def createCheckboxOptionsPanels(Panel mainPanel)
	{
	    new LabeledCheckbox(mainPanel) =>
	    [
	    	text = "El cumpleañero puede regalar en su cumple"
	    	bindValueToProperty("sameBirthday")
	    ]
	    
	    new LabeledCheckbox(mainPanel) =>
	    [
	    	text = "Se permiten regalar cruzados"
	    	bindValueToProperty("crossGifts")
	    ]
	}
	
	/**
	 * Genera una tabla con los participantes del sorteo.
	 * 
	 * Se hace binding contra RaffleResultsAppModel.result
	 * lo cual retorna una Lista de Personas
	 * 
	 * | Participante P | Participante Q Regalado por P | Participante R que e Regala a P |
	 * 
	 * // FIXME ver si se pueden mejorar las dimensiones de la tabla
	 */
	private def createAssignmentTable(Panel mainPanel)
	{
		var assignmentTable = new Table<Person>(mainPanel, typeof(Person)) => [
			bindItemsToProperty("result")
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
	
}