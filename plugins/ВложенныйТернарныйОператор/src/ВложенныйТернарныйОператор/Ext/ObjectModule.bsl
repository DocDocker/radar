﻿
Перем Типы;
Перем ТаблицаОшибок;
Перем Счетчики;

Процедура Открыть(Парсер, Параметры) Экспорт
	Типы = Парсер.Типы();
	Счетчики = Парсер.Счетчики();
	ТаблицаОшибок = Парсер.ТаблицаОшибок();
КонецПроцедуры

Функция Закрыть() Экспорт
	Возврат Неопределено;
КонецФункции

Функция Подписки() Экспорт
	Перем Подписки;
	Подписки = Новый Массив;
	Подписки.Добавить("ПосетитьВыражениеТернарное");
	Возврат Подписки;
КонецФункции

#Область РеализацияПодписок

Процедура ПосетитьВыражениеТернарное(ВыражениеТернарное) Экспорт
	Если Счетчики.ВыражениеТернарное > 0 Тогда
		Ошибка("Вложенный тернарный оператор", ВыражениеТернарное.Начало, ВыражениеТернарное.Конец);
	КонецЕсли;  
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
