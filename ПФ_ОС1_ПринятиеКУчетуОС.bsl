	// { + Рудь Д.А. Заполнение раздела 3 "Драгоценные материалы"
	|
	|////////////////////////////////////////////////////////////////////////////////
	|ВЫБРАТЬ
	|	ВТ_МаксПериодыСведенийОСБУ.ОсновноеСредство.НаименованиеПолное КАК НаименованиеОСсДМ,
	|	фд_ДрагоценныеМеталлы.ДрагМеталл.НаименованиеПолное КАК НаименованиеДМ,
	|	фд_ДрагоценныеМеталлы.ДрагМеталл.Код КАК НомерДМ,
	|	фд_ДрагоценныеМеталлы.ДрагМеталл.ЕдиницаИзмерения.НаименованиеПолное КАК ЕдиницаИзмеренияДМ,
	|	фд_ДрагоценныеМеталлы.Количество КАК КоличествоДМ
	|ИЗ
	|	РегистрСведений.фд_ДрагоценныеМеталлы КАК фд_ДрагоценныеМеталлы
	|		ВНУТРЕННЕЕ СОЕДИНЕНИЕ ВТ_МаксПериодыСведенийОСБУ КАК ВТ_МаксПериодыСведенийОСБУ
	|		ПО (ВТ_МаксПериодыСведенийОСБУ.ОсновноеСредство = фд_ДрагоценныеМеталлы.ОсновноеСредство)";
	// }
  
  // { * Рудь Д.А.
	//ВыборкаПоОС = Запрос.Выполнить().Выбрать();
	МассивРезультатов = Запрос.ВыполнитьПакет();
	ВыборкаПоОС = МассивРезультатов[2].Выбрать();
	ВыборкаПоДМ = МассивРезультатов[3].Выбрать();
	// }
  
  Пока ВыборкаПоОС.СледующийПоЗначениюПоля("Ссылка") Цикл

		Если НЕ ПервыйДокумент Тогда
			ТабличныйДокумент.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;
		ПервыйДокумент = Ложь;

		НомерСтрокиНачало = ТабличныйДокумент.ВысотаТаблицы + 1;

		Если ВыборкаПоОС.КоличествоСтрок <= 1 Тогда

			ВыборкаПоОС.Следующий();

			Если НЕ(ВыборкаПоОС.ГруппаОС = Перечисления.ГруппыОС.Здания ИЛИ
				ВыборкаПоОС.ГруппаОС = Перечисления.ГруппыОС.Сооружения) Тогда
				
				Если ИмяМакета <> "ОС1" Тогда
					Продолжить;
				КонецЕсли;
				
				ОбластьМакетаЗаголовок.Параметры.Заполнить(ВыборкаПоОС);
				
				ОбластьМакетаЗаголовок.Параметры.НомерАкта = ПрефиксацияОбъектовКлиентСервер.НомерНаПечать(ВыборкаПоОС.НомерАкта, Истина, Ложь);
				
				Если ПустаяСтрока(ВыборкаПоОС.НаименованиеОС) Тогда
					ОбластьМакетаЗаголовок.Параметры.НаименованиеОС = СокрЛП(ВыборкаПоОС.ОсновноеСредство);
				КонецЕсли;

				ЗаполнитьДанныеОрганизацииПолучателя(ВыборкаПоОС, ОбластьМакетаЗаголовок);
				
				// { + Рудь Д.А.
				ТабличныйДокумент.Вывести(ОбластьМакетаЗаголовок);
				ТабличныйДокумент.Вывести(ШапкаДМОС1);
				Пока ВыборкаПоДМ.Следующий() Цикл
					
					СтрокаДМОС1.Параметры.Заполнить(ВыборкаПоДМ);
					ТабличныйДокумент.Вывести(СтрокаДМОС1);
					
				КонецЦикла;
				ТабличныйДокумент.Вывести(СтрокаДМПОС1);
			
				ДанныеФизЛица = ОбщегоНазначенияБПВызовСервера.ДанныеФизЛица(ВыборкаПоОС.Организация,ВыборкаПоОС.МОЛБУ,ВыборкаПоОС.Дата);
				ПодвалОС1.Параметры.МОЛДолжность = ДанныеФизЛица.Должность;
				ПодвалОС1.Параметры.МОЛРасшифровкаПодписи = ДанныеФизЛица.Представление;
				ТабличныйДокумент.Вывести(ПодвалОС1);
				// }
				
				// { * Рудь Д.А.
				//ДанныеФизЛица = ОбщегоНазначенияБПВызовСервера.ДанныеФизЛица(ВыборкаПоОС.Организация,ВыборкаПоОС.МОЛБУ,ВыборкаПоОС.Дата);
				//ОбластьМакетаЗаголовок.Параметры.МОЛДолжность = ДанныеФизЛица.Должность;
				//ОбластьМакетаЗаголовок.Параметры.МОЛРасшифровкаПодписи = ДанныеФизЛица.Представление;
				//ТабличныйДокумент.Вывести(ОбластьМакетаЗаголовок);
				// }
				
			Иначе
				
				Если ИмяМакета <> "ОС1а" Тогда
					Продолжить;
				КонецЕсли;
				
				ОбластьМакетаЗаголовок_а.Параметры.Заполнить(ВыборкаПоОС);
				
				ОбластьМакетаЗаголовок_а.Параметры.НомерАкта = ПрефиксацияОбъектовКлиентСервер.НомерНаПечать(ВыборкаПоОС.НомерАкта, Истина, Ложь);
				
				Если ПустаяСтрока(ВыборкаПоОС.НаименованиеОС) Тогда
					ОбластьМакетаЗаголовок_а.Параметры.НаименованиеОС = СокрЛП(ВыборкаПоОС.ОсновноеСредство);
				КонецЕсли;
				
				ЗаполнитьДанныеОрганизацииПолучателя(ВыборкаПоОС, ОбластьМакетаЗаголовок_а);
				
				// { + Рудь Д.А.
				ТабличныйДокумент.Вывести(ОбластьМакетаЗаголовок_а);
				ТабличныйДокумент.Вывести(ШапкаДМОС1а);
				Пока ВыборкаПоДМ.Следующий() Цикл
					
					СтрокаДМОС1а.Параметры.Заполнить(ВыборкаПоДМ);
					ТабличныйДокумент.Вывести(СтрокаДМОС1а);
					
				КонецЦикла;
				ТабличныйДокумент.Вывести(СтрокаДМПОС1а);
				
				ДанныеФизЛица = ОбщегоНазначенияБПВызовСервера.ДанныеФизЛица(ВыборкаПоОС.Организация,ВыборкаПоОС.МОЛБУ,ВыборкаПоОС.Дата);
				ПодвалОС1а.Параметры.МОЛДолжность = ДанныеФизЛица.Должность;
				ПодвалОС1а.Параметры.МОЛРасшифровкаПодписи = ДанныеФизЛица.Представление;
				ТабличныйДокумент.Вывести(ПодвалОС1а);
				// }
				
				// { * Рудь Д.А.
				//ДанныеФизЛица = ОбщегоНазначенияБПВызовСервера.ДанныеФизЛица(ВыборкаПоОС.Организация,ВыборкаПоОС.МОЛБУ,ВыборкаПоОС.Дата);
				//ОбластьМакетаЗаголовок_а.Параметры.МОЛДолжность = ДанныеФизЛица.Должность;
				//ОбластьМакетаЗаголовок_а.Параметры.МОЛРасшифровкаПодписи = ДанныеФизЛица.Представление;
				//ТабличныйДокумент.Вывести(ОбластьМакетаЗаголовок_а);
				// }

			КонецЕсли;
