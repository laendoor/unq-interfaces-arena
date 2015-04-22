package ar.edu.unq.interfaces.cumpleanieroUIArena.transformers

import java.text.DateFormatSymbols
import java.util.Locale

class DateTransformer
{
	def static String getMonthName(int month, Locale locale) {
		DateFormatSymbols.getInstance(locale).months.get(month-1)
	}
	
	def static String getMonthNameES(int month) {
		getMonthName(month, new Locale("es", "AR"))
	}
	
	def static String getMonthNameEN(int month) {
		getMonthName(month, new Locale("en", "US"))
	}
	
}