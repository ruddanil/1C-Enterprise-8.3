// Обработчик события ПриЗаписиСправочникПользователи

Процедура фд_ПриЗаписиСправочникПользователи(Источник, Отказ) Экспорт
	
	Если Источник.ДополнительныеСвойства.ЭтоНовыйОбъект Тогда
		
		ЭталонныйПользователь = фд_РаботаСПредопределеннымиПризнакамиВызовСервера.ПолучитьЭлементПоПризнаку("ЭталонныйПользователь");
		ПользовательПриемник = Новый Массив;
		ПользовательПриемник.Добавить(Источник.Ссылка);
		
		КопируемыеНастройки = Новый Массив;
		КопируемыеНастройки.Добавить("НастройкиОтчетов");
		КопируемыеНастройки.Добавить("НастройкиВнешнегоВида");
		КопируемыеНастройки.Добавить("ПерсональныеНастройки");
		КопируемыеНастройки.Добавить("Избранное");
		КопируемыеНастройки.Добавить("НастройкиПечати");
		КопируемыеНастройки.Добавить("ПрочиеПользовательскиеНастройки");
		
		Обработки.НастройкиПользователей.КопированиеНастроекПользователей(ЭталонныйПользователь, ПользовательПриемник, КопируемыеНастройки);
		
	КонецЕсли;

КонецПроцедуры
