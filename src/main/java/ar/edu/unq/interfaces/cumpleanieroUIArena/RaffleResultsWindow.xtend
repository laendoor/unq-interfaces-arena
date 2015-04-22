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
import ar.edu.unq.interfaces.cumpleaniero.exceptions.RaffleException

class RaffleResultsWindow extends SimpleWindow<RaffleResultsAppModel>
{
	new(WindowOwner parent, RaffleResultsAppModel appModel)
	{
		super(parent, appModel)
		title = "Sorteo"
		taskDescription = ""
		shake
	}
	
	/**
	 * Panel principal
	 * 
	 * - Titulo
	 * - Descripción
	 * - Opciones del sorteo
	 * - Tabla de asignaciones
	 */
	override protected createFormPanel(Panel mainPanel)
	{
		new Title(mainPanel) => [
			text = "Resultados Sorteo"
		]
		new Paragraph(mainPanel) => [
			text = "Desde acá podrás ver los resultados del sorteo para cada uno y volver a realizarlo, cuantas veces quieras."
		]
		
		createOptionsPanel(mainPanel)
		
		createAssignmentTable(mainPanel)
	}
	
	/**
	 * Panel de acciones
	 * 
	 * - Volver a sortear
	 */
	override protected addActions(Panel mainPanel)
	{
		new Button(mainPanel) => [
			caption = "Volver a sortear"
			onClick [ | shake ]
		]
		
	}
	
	/**
	 * Realizar sorteo
	 * 
	 * Intenta llamar al modelo para realizar el sorteo,
	 * si no puede muestra el error
	 */
	protected def shake()
	{
		try
		{
			modelObject.shake
		}
		catch (RaffleException e)
		{
     		throw new UserException(e.message)
		}
	}
	
	/**
	 * Panel de Opciones
	 * 
	 * - Checkbox: permite regalar a quien cumple el mismo día
	 * - Checkbox: permite regalos cruzados
	 */
	protected def createOptionsPanel(Panel mainPanel)
	{
	    new LabeledCheckbox(mainPanel) => [
	    	text = "\nEl cumpleañero puede regalar en su cumple"
	    	bindValueToProperty = "sameBirthday"
	    ]
	    
	    new LabeledCheckbox(mainPanel) => [
	    	text = "\nSe permiten regalar cruzados"
	    	bindValueToProperty = "crossGifts"
	    ]
	}
	
	/**
	 * Tabla de Asignaciones
	 * 
	 * | Participante P | Participante Q Regalado por P | Participante R que le Regala a P |
	 */
	private def createAssignmentTable(Panel mainPanel)
	{
		// TODO ver si se pueden mejorar las dimensiones de la tabla
		var assignmentTable = new Table<Person>(mainPanel, typeof(Person)) => [
			bindItemsToProperty = "result"
		]
		
		new Column<Person>(assignmentTable) => [
			title = "Nombre"
			bindContentsToProperty = "name"
		]
		
		new Column<Person>(assignmentTable) => [
			title = "Regala A"
			bindContentsToProperty = "personToGive"	
		]
		
		new Column<Person>(assignmentTable) => [
			title = "Le Regala"
			bindContentsToProperty = "personWhoGives"
		]
	}
	
}