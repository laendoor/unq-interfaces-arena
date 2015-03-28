package ar.edu.unq.interfaces.cumpleanieroUIArena

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.interfaces.cumpleaniero.Raffle

class WelcomeWindow extends MainWindow<Raffle> {

	new() {
		super(new Raffle)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Organizador de Cumpleaños"
//		mainPanel.layout = new VerticalLayout
//		
//		new ErrorsPanel(mainPanel, "Listo para convertir")	
//
//		new Label(mainPanel).text = "Ingrese la longitud en millas"
//
//		new TextBox(mainPanel).bindValueToProperty("millas")
//
//		new Button(mainPanel) => [
//			caption = "Convertir a kilómetros"
//			onClick [ | this.modelObject.convertir ]
//		]
//
//		new Label(mainPanel)
//			.setBackground(Color::ORANGE)
//			.bindValueToProperty("kilometros")
//
//		new Label(mainPanel).text = " kilómetros"
	}

	def static main(String[] args) {
		new WelcomeWindow().startApplication
	}

}