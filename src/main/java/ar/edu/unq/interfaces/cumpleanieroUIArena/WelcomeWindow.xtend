package ar.edu.unq.interfaces.cumpleanieroUIArena

import ar.edu.unq.interfaces.cumpleaniero.Raffle
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Paragraph
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Title
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class WelcomeWindow extends SimpleWindow<Raffle> {
	
	new(WindowOwner parent, Raffle raffle) {
		super(parent, raffle)
	}
	
	/**
	 * Form Panel
	 * 
	 * - Título
	 * - Descripción
	 */
	override protected createFormPanel(Panel mainPanel)
	{
		title = "Organizador de Cumpleaños"

		new Title(mainPanel) => [
			text = "Bienvenido al Cumpleañero!"
		]
		new Paragraph(mainPanel) => [
			text = "¿Qué desea hacer?"
		]
	}
	
	/**
	 * Acciones
	 * 
	 * - Ver Calendario
	 * - Editar Participantes
	 * - Ver Próximos cumpleaños
	 */
	override protected addActions(Panel actionsPanel)
	{
		new Button(actionsPanel) => [
			caption = "Ver Calendario"
			width = 200
			onClick [ | new CalendarWindow(this, modelObject).open() ]
		]
		
		new Button(actionsPanel) => [
			caption = "Editar Cumples"
			width = 200
			onClick [ | new EditBirthdayWindow(this, modelObject).open()  ]
		]
		
		new Button(actionsPanel) => [
			caption = "Próximos"
			width = 200
			onClick [ | new NextBirthdayWindow(this, modelObject).open() ]
		]
	}

}