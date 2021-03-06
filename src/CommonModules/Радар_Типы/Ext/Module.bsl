﻿
Функция Окружение(ФиксированныйОкружение = Неопределено) Экспорт
	Окружение = Новый Структура;
	Окружение.Вставить("__Тип__", "Радар_Типы.Окружение");
	Если ФиксированныйОкружение = Неопределено Тогда
		Окружение.Вставить("Переменные", Новый Массив);
		Окружение.Вставить("Методы", Новый Массив);
	Иначе
		Окружение.Вставить("Переменные", Новый Массив(ФиксированныйОкружение.Переменные));
		Окружение.Вставить("Методы", Новый Массив(ФиксированныйОкружение.Методы));
	КонецЕсли;
	Возврат Окружение;
КонецФункции

Функция ФиксированноеОкружение(Окружение) Экспорт
	ФиксированныйОкружение = Новый Структура;
	ФиксированныйОкружение.Вставить("Переменные", Новый ФиксированныйМассив(Окружение.Переменные));
	ФиксированныйОкружение.Вставить("Методы", Новый ФиксированныйМассив(Окружение.Методы));
	Возврат Новый ФиксированнаяСтруктура(ФиксированныйОкружение);
КонецФункции 

Функция Переменная(Имя) Экспорт
	Переменная = Новый Структура;
	Переменная.Вставить("__Тип__", "Радар_Типы.Переменная");
	Переменная.Вставить("Имя", Имя);
	Возврат Переменная;
КонецФункции

Функция Метод(Имя) Экспорт
	Метод = Новый Структура;
	Метод.Вставить("__Тип__", "Радар_Типы.Метод");
	Метод.Вставить("Имя", Имя);
	Возврат Метод;
КонецФункции

Функция РеквизитФормы(Имя, Тип = Неопределено) Экспорт
	РеквизитФормы = Новый Структура;
	РеквизитФормы.Вставить("__Тип__", "Радар_Типы.РеквизитФормы");
	РеквизитФормы.Вставить("Имя", Имя);
	РеквизитФормы.Вставить("Тип", Тип);
	Возврат РеквизитФормы;		
КонецФункции

Функция ПредопределенныйЭлемент(Имя) Экспорт
	ПредопределенныйЭлемент = Новый Структура;
	ПредопределенныйЭлемент.Вставить("__Тип__", "Радар_Типы.ПредопределенныйЭлемент");
	ПредопределенныйЭлемент.Вставить("Имя", Имя);
	Возврат ПредопределенныйЭлемент;		
КонецФункции