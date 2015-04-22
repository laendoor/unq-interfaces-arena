package ar.edu.unq.interfaces.cumpleanieroUIArena

import ar.edu.unq.interfaces.cumpleaniero.Person
import ar.edu.unq.interfaces.cumpleaniero.Raffle
import ar.edu.unq.interfaces.cumpleaniero.appModels.BirthdayCalendarAppModel
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Paragraph
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Title
import ar.edu.unq.interfaces.cumpleanieroUIArena.transformers.MonthTransformer
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class CalendarWindow extends SimpleWindow<BirthdayCalendarAppModel>
{
	new(WindowOwner parent, Raffle raffle)
	{
		super(parent, new BirthdayCalendarAppModel(raffle))
		title = "Calendario"
		taskDescription = ""
	}
	
	/**
	 * Panel principal
	 * 
	 * - Titulo
	 * - Descripcion
	 * - Panel de Meses-Calendario
	 */
	override protected createFormPanel(Panel mainPanel)
	{
		new Title(mainPanel) => [
			text = "Calendario de Cumpleaños"
		]
		new Paragraph(mainPanel) => [
			text = "Desde acá podrás ver todos los cumpleaños del año actual mes a mes"
		]
		createCalendarPanel(mainPanel)
	}
	
	/**
	 * No hay panel de acciones en esta vista
	 */
	override protected addActions(Panel actionsPanel) {
		// not actions over here
	}
	
	/**
	 * Panel de Calendario
	 * 
	 * 12 meses distribuidos en 2 filas de 6 columnas
	 */
	protected def createCalendarPanel(Panel parentPanel)
	{
		val calPanel = new Panel(parentPanel) => [
			layout = new ColumnLayout(6)
		]
		(1..12).forEach[ createMonthPanel(calPanel, it) ]
	}
	
	/**
	 * Panel de Mes
	 * 
	 * - Label Nombre
	 * - Tabla de Cumpleañeros en ese mes
	 */
	protected def createMonthPanel(Panel parentPanel, int month)
	{
		// FIXME ?
		val monthName = MonthTransformer.getNameES(month).toFirstUpper
		val monthNameMethod = MonthTransformer.getNameEN(month).toLowerCase

		var monthPanel = new Panel(parentPanel) => [ 
			layout = new VerticalLayout
		]
		new Label(monthPanel) => [
			text = monthName
		]
		var table = new Table<Person>(monthPanel, Person) => [
			bindItemsToProperty(monthNameMethod)
		]
		new Column<Person>(table) => [
      		title = "Cumpleañero"
      		fixedSize = 100
      		bindContentsToProperty("nameAndDay")
		]
	}
	
}