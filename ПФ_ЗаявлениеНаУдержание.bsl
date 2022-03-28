// { + Рудь Д.А.
//Печать заявления на удержание
	Если УправлениеПечатью.НужноПечататьМакет(КоллекцияПечатныхФорм, "ЗаявНаУдер") Тогда
		УправлениеПечатью.ВывестиТабличныйДокументВКоллекцию(КоллекцияПечатныхФорм, "ЗаявНаУдер",
		"Заявление на удержание", ПечатьЗаявНаУдерж(МассивОбъектов, ОбъектыПечати),,
		"Макеты.ПФ_MXL_ЗаявНаУдер");
	КонецЕсли;
// }
  
// { + Рудь Д.А.
// Заявление на удержание
	КомандаПечати = КомандыПечати.Добавить();
	КомандаПечати.Идентификатор = "ЗаявНаУдер";
	КомандаПечати.Представление = НСтр("ru = 'Заявление на удержание'");
	КомандаПечати.Обработчик    = "УправлениеПечатьюБПКлиент.ВыполнитьКомандуПечати";
	КомандаПечати.Порядок       = 30;
// }
  
// { + Рудь Д.А.
// Функция формирует табличный документ формы заявления на удержание
Функция ПечатьЗаявНаУдерж(МассивОбъектов, ОбъектыПечати)
	
	УстановитьПривилегированныйРежим(Истина);
	
	ТабличныйДокумент = Новый ТабличныйДокумент;
	ТабличныйДокумент.АвтоМасштаб			= Истина;
	ТабличныйДокумент.ОриентацияСтраницы	= ОриентацияСтраницы.Портрет;
	ТабличныйДокумент.КлючПараметровПечати	= "ПАРАМЕТРЫ_ПЕЧАТИ_АвансовыйОтчет_ЗаявНаУдер";

	Макет = УправлениеПечатью.МакетПечатнойФормы("Документ.АвансовыйОтчет.ПФ_MXL_ЗаявНаУдер");
	
	ТабличныйДокумент.Вывести(Макет.ПолучитьОбласть("Шапка"));
	
	Возврат ТабличныйДокумент;
	
КонецФункции
// } Рудь Д.А.
