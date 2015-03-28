package ar.edu.unq.interfaces.cumpleanieroUIArena

import ar.edu.unq.interfaces.cumpleaniero.Raffle
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow

class WelcomeWindow extends MainWindow<Raffle> {



	new() {
		super(new Raffle)
	}
	
	override createContents(Panel mainPanel) {
		
		this.title = "Organizador de Cumpleaños"
		
		mainPanel.layout = new VerticalLayout
		
		this.createLabels(mainPanel)
		
		this.createButtons(mainPanel)
				
		
	}
	
	def createLabels(Panel mainPanel) {
		new Label(mainPanel) => [
			text = "Bienvenido al Cumpleañero!"
			fontSize = 30
		]
		
		new Label(mainPanel) => [
			text = "¿Qué desea hacer?"
			fontSize = 15
		]
	}
	
	def createButtons(Panel mainPanel) {
		var actionsPanel = new Panel(mainPanel)
		actionsPanel.layout = new HorizontalLayout
		
		new Button(actionsPanel) => [
			caption = "Ver Calendario"
			width = 130
			onClick [ ]
		]
		
		new Button(actionsPanel) => [
			caption = "Editar Cumples"
			width = 130
			onClick [ ]
		]
		
		new Button(actionsPanel) => [
			caption = "Próximos"
			width = 130
			onClick [ ]
		]
	}

	def static main(String[] args) {
		new WelcomeWindow().startApplication
	}

}