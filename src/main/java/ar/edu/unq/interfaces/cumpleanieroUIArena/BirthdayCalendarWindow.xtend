package ar.edu.unq.interfaces.cumpleanieroUIArena

import ar.edu.unq.interfaces.cumpleaniero.Person
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Title
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Paragraph
import ar.edu.unq.interfaces.cumpleaniero.appModels.BirthdayCalendarAppModel
import org.uqbar.arena.widgets.tables.Column
import ar.edu.unq.interfaces.cumpleaniero.utils.DateTransformer

class CalendarWindow extends SimpleWindow<BirthdayCalendarAppModel>
{
	new(WindowOwner parent, BirthdayCalendarAppModel calModel)
	{
		super(parent, calModel)
		title = "Calendario"
		taskDescription = ""
	}
	
	override protected createFormPanel(Panel mainPanel)
	{
		new Title(mainPanel) => [
			text = "Calendario de Cumpleaños"
		]
		new Paragraph(mainPanel) => [
			text = "Desde acá podrás ver todos los cumpleaños del año actual mes a mes"
		]
		
		var calPanel = new Panel(mainPanel) => [
			layout = new ColumnLayout(6)
		]
		
		createMonthsPanels(calPanel)
	}
	
	protected def createMonthsPanels(Panel mainPanel)
	{
		val panel = new Panel(mainPanel) => [
			layout = new ColumnLayout(6)
		]
		
		(1..12).forEach[ fillMonth(panel, it) ]
	}
	
	def protected fillMonth(Panel mainPanel, int month)
	{
		val monthName = DateTransformer.getMonthNameES(month).toFirstUpper
		val monthNameMethod = DateTransformer.getMonthNameEN(month).toLowerCase

		var monthPanel = new Panel(mainPanel) => [ 
			layout = new VerticalLayout()	
		]
		
		new Label(monthPanel) => [
			text = monthName
		]
		var table = new Table<Person>(monthPanel, typeof(Person)) => [
			bindItemsToProperty(monthNameMethod)
		]
		new Column<Person>(table) => [
      		title = "Cumpleañero"
      		fixedSize = 100
      		bindContentsToProperty("nameAndDay")
		]
	}
	
	override protected addActions(Panel actionsPanel) {
		// not actions over here
	}
	
}