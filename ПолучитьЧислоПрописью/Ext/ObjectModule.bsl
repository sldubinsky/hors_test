﻿Перем МассивСтепеней;

#Область ПрограммныйИнтерфейс

Функция ПолучитьПрописьЧисла(Знач ОбрабатываемоеЧисло) Экспорт
	
	//Возврат "Не реализовано";
	
	Копейки = 100*(ОбрабатываемоеЧисло - Цел(ОбрабатываемоеЧисло));
	ОбрабатываемоеЧисло = Цел(ОбрабатываемоеЧисло);
	
	// разбиваем число по разрядам. Должны получить массив чисел от 1 до 1000 по количеству групп разрядов
	// сдвигаем разряд на 3 влево, забираем дробную часть
	
	МассивРазрядности = Новый Массив;
	
	Пока ОбрабатываемоеЧисло > 0 Цикл
		МассивРазрядности.Вставить(0,ОбрабатываемоеЧисло % 1000);
		ОбрабатываемоеЧисло = Цел(ОбрабатываемоеЧисло/1000);
	КонецЦикла;
	
	// массив в строку
	ВозвращаемоеЗначение = "";
	НомерСтаршегоРазряда = МассивРазрядности.Количество();
	Для каждого ЭлементМассива Из МассивРазрядности Цикл
		Если ЭлементМассива = 0 Тогда
			Продолжить;// пропустим, ибо ноль
		КонецЕсли;
		НаписаниеСтепени = "";
		Если НомерСтаршегоРазряда=1 Тогда
			// тут у разрадов нет самоназвания, это до 1000
		Иначе
			// получим написание степени из описания
			ОписаниеСтепени = МассивСтепеней[НомерСтаршегоРазряда-2];
			Если ЭлементМассива = 1 Тогда
				НаписаниеСтепени = ОписаниеСтепени.Значение1;
			ИначеЕсли ЭлементМассива < 5 Тогда
				НаписаниеСтепени = ОписаниеСтепени.Значение2;
			ИначеЕсли ЭлементМассива < 21 Тогда
				НаписаниеСтепени = ОписаниеСтепени.Значение5;
			ИначеЕсли ЭлементМассива%10 = 1 Тогда
				НаписаниеСтепени = ОписаниеСтепени.Значение1;
			ИначеЕсли ЭлементМассива%10 < 5 Тогда
				НаписаниеСтепени = ОписаниеСтепени.Значение2;
			Иначе
				НаписаниеСтепени = ОписаниеСтепени.Значение5;
			КонецЕсли;
		КонецЕсли;
		ВозвращаемоеЗначение = ВозвращаемоеЗначение + ЧислоПрописью(ЭлементМассива,"Л=ru_RU;НП=Ложь;НД=Ложь;") + " " + НаписаниеСтепени + Символы.ПС;
		НомерСтаршегоРазряда = НомерСтаршегоРазряда - 1;
	КонецЦикла;
	Возврат ВозвращаемоеЗначение + Копейки + " копеек";
	
КонецФункции

#КонецОбласти

#Область Служебные

Функция ПолучитьОписаниеСтепени()
	Описание = Новый Структура();
	
	Описание.Вставить("Имя","");
	Описание.Вставить("Пол","М");
	Описание.Вставить("Значение1","");
	Описание.Вставить("Значение2","");
	Описание.Вставить("Значение5","");
	
	Возврат Описание;
	
КонецФункции

Процедура Инициализация()
	
	// заполним соответствие степеней
	МассивСтепеней = Новый Массив;
	
	ОписаниеСтепени = ПолучитьОписаниеСтепени();
	ОписаниеСтепени.Имя = "Тысяча";
	ОписаниеСтепени.Пол = "Ж";
	ОписаниеСтепени.Значение1 = "тысяча";
	ОписаниеСтепени.Значение2 = "тысячи";
	ОписаниеСтепени.Значение5 = "тысяч";
	МассивСтепеней.Добавить(ОписаниеСтепени);
	
	ОписаниеСтепени = ПолучитьОписаниеСтепени();
	ОписаниеСтепени.Имя = "Миллион";
	ОписаниеСтепени.Пол = "М";
	ОписаниеСтепени.Значение1 = "миллион";
	ОписаниеСтепени.Значение2 = "миллиона";
	ОписаниеСтепени.Значение5 = "миллионов";
	МассивСтепеней.Добавить(ОписаниеСтепени);
	
	ОписаниеСтепени = ПолучитьОписаниеСтепени();
	ОписаниеСтепени.Имя = "Миллиард";
	ОписаниеСтепени.Пол = "М";
	ОписаниеСтепени.Значение1 = "миллиард";
	ОписаниеСтепени.Значение2 = "миллиарда";
	ОписаниеСтепени.Значение5 = "миллиардов";
	МассивСтепеней.Добавить(ОписаниеСтепени);
	
	ОписаниеСтепени = ПолучитьОписаниеСтепени();
	ОписаниеСтепени.Имя = "Триллион";
	ОписаниеСтепени.Пол = "М";
	ОписаниеСтепени.Значение1 = "триллион";
	ОписаниеСтепени.Значение2 = "триллиона";
	ОписаниеСтепени.Значение5 = "триллионов";
	МассивСтепеней.Добавить(ОписаниеСтепени);
	
	ОписаниеСтепени = ПолучитьОписаниеСтепени();
	ОписаниеСтепени.Имя = "Квадриллион";
	ОписаниеСтепени.Пол = "М";
	ОписаниеСтепени.Значение1 = "квадриллион";
	ОписаниеСтепени.Значение2 = "квадриллиона";
	ОписаниеСтепени.Значение5 = "квадриллионов";
	МассивСтепеней.Добавить(ОписаниеСтепени);
	
КонецПроцедуры

#КонецОбласти

Инициализация();