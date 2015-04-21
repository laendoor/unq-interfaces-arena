package ar.edu.unq.interfaces.cumpleanieroUIArena

import ar.edu.unq.interfaces.cumpleaniero.Raffle
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Title
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Paragraph
import ar.edu.unq.interfaces.cumpleaniero.appModels.BirthdayCalendarAppModel
import ar.edu.unq.interfaces.cumpleaniero.appModels.EditBirthdaysAppModel

class WelcomeWindow extends SimpleWindow<Raffle> {
	
	BirthdayCalendarAppModel calModel

	new(WindowOwner parent, Raffle raffle) {
		super(parent, raffle)
		calModel = new BirthdayCalendarAppModel(this.modelObject)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = "Organizador de Cumpleaños"
		mainPanel.layout = new VerticalLayout
		this.createLabels(mainPanel)
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Ver Calendario"
			width = 130
			onClick [ | new CalendarWindow(this, this.calModel).open() ]
		]
		
		new Button(actionsPanel) => [
			caption = "Editar Cumples"
			width = 130
			onClick [ | new EditBirthdayWindow(this, new EditBirthdaysAppModel(this.modelObject) ).open()  ]
		]
		
		new Button(actionsPanel) => [
			caption = "Próximos"
			width = 130
			onClick [ | new NextBirthdayWindow(this, this.modelObject).open() ]
		]
	}
	
	def createLabels(Panel mainPanel) {
		
		new Title(mainPanel) => [
			text = "Bienvenido al Cumpleañero!"
		]
		
		new Paragraph(mainPanel) => [
			text = "¿Qué desea hacer?"
		]
		
	}

}