package ar.edu.unq.interfaces.cumpleanieroUIArena

import ar.edu.unq.interfaces.cumpleaniero.Person
import ar.edu.unq.interfaces.cumpleaniero.Raffle
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Title
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Paragraph

class CalendarWindow extends SimpleWindow<Raffle>{
	
	new(WindowOwner parent, Raffle raffle) {
		super(parent, raffle)
		title = "Calendario"
		taskDescription = ""
	}
	
	override protected createFormPanel(Panel mainPanel) {

		new Title(mainPanel, "Calendario de Cumpleaños");
		new Paragraph(mainPanel, "Desde acá podrás ver todos los cumpleaños del año actual mes a mes")
		
		var calendarsPanel= new Panel(mainPanel)
		calendarsPanel.layout = new ColumnLayout(6)
		
		createMonthPanels(calendarsPanel)
	}
	
	protected def createMonthPanels(Panel calendarsPanel) {
		
		(1..12).forEach[
		var panel = new Panel(calendarsPanel)
		panel.layout = new VerticalLayout()
		new Label(panel) => [ text = "Mes (to do)" ]
		new Table<Person>(panel, typeof(Person)) => []
		]
		
	}
	
	override protected addActions(Panel actionsPanel) {
		
	}
	
}