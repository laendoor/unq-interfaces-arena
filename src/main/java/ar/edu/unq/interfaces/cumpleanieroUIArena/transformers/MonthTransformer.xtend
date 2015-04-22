package ar.edu.unq.interfaces.cumpleanieroUIArena.transformers

import java.text.DateFormatSymbols
import java.util.Locale

class MonthTransformer
{
	def static String getName(int month, Locale locale) {
		DateFormatSymbols.getInstance(locale).months.get(month-1)
	}
	
	def static String getNameES(int month) {
		getName(month, new Locale("es", "AR"))
	}
	
	def static String getNameEN(int month) {
		getName(month, new Locale("en", "US"))
	}
	
}