﻿
Перем ТаблицаОшибок;
Перем Типы;
Перем ЗапрещенныеСвойства;

Процедура Открыть(Парсер, Параметры) Экспорт
	
	ТаблицаОшибок = Парсер.ТаблицаОшибок();
	Типы = Парсер.Типы();
	
	ЗапрещенныеСвойства = Новый Структура;
	
	ЗапрещенныеСвойства.Вставить("ЭтаФорма");
	ЗапрещенныеСвойства.Вставить("ThisForm");
		
КонецПроцедуры

Функция Закрыть() Экспорт
	Возврат Неопределено;
КонецФункции

Функция Подписки() Экспорт
	Перем Подписки;
	Подписки = Новый Массив;
	Подписки.Добавить("ПосетитьВыражениеИдентификатор");
	Возврат Подписки;
КонецФункции

#Область РеализацияПодписок

Процедура ПосетитьВыражениеИдентификатор(ВыражениеИдентификатор) Экспорт
	Если ВыражениеИдентификатор.Аргументы = Неопределено
		И ЗапрещенныеСвойства.Свойство(ВыражениеИдентификатор.Голова.Имя) Тогда
		Ошибка("Свойство запрещено", ВыражениеИдентификатор.Начало, ВыражениеИдентификатор.Начало);
	КонецЕсли; 
	Для Каждого Элемент Из ВыражениеИдентификатор.Хвост Цикл
		Если Элемент.Тип = Типы.ВыражениеПоле И ЗапрещенныеСвойства.Свойство(Элемент.Имя) Тогда
			Ошибка("Свойство запрещено", Элемент.Начало, Элемент.Конец);
		КонецЕсли; 
	КонецЦикла; 
КонецПроцедуры

#КонецОбласти // РеализацияПодписок

Процедура Ошибка(Текст, Начало, Конец = Неопределено, ЕстьЗамена = Ложь)
	
	Ошибка = ТаблицаОшибок.Добавить();
	Ошибка.Источник = Метаданные().Имя;
	Ошибка.Текст = Текст;
	
	Ошибка.МинутНаИсправление = 5;
	Ошибка.Серьезность = "INFO";
	Ошибка.Приоритет = 0;
	Ошибка.Правило = Метаданные().Синоним;
	Ошибка.Тип = "CODE_SMELL";
	
	Ошибка.ПозицияНачала = Начало.Позиция;
	Ошибка.НомерСтрокиНачала = Начало.НомерСтроки;
	Ошибка.НомерКолонкиНачала = Начало.НомерКолонки;
	Если Конец = Неопределено Или Конец = Начало Тогда
		Ошибка.ПозицияКонца = Начало.Позиция + Начало.Длина;
		Ошибка.НомерСтрокиКонца = Начало.НомерСтроки;
		Ошибка.НомерКолонкиКонца = Начало.НомерКолонки + Начало.Длина;
	Иначе
		Ошибка.ПозицияКонца = Конец.Позиция + Конец.Длина;
		Ошибка.НомерСтрокиКонца = Конец.НомерСтроки;
		Ошибка.НомерКолонкиКонца = Конец.НомерКолонки + Конец.Длина;
	КонецЕсли;
	
	Ошибка.ЕстьЗамена = ЕстьЗамена;
	
КонецПроцедуры
