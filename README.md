# Радар - статический анализатор конфигураций

Это расширение для платформы не ниже 8.3.13

Варианты использования:
1. Расширение ставится на отдельной (возможно пустой) базе данных. В проекте указывается путь к выгрузке конфигурации в XML или EDT формате, и путь к файлу конфигурации *.cf
2. Расширение ставится на базе данных анализируемой конфигурации. В проекте указывается путь к выгрузке конфигурации в XML или EDT формате.

Многопоточный анализ доступен только в клиент-серверном варианте.

Отладка существенно увеличивает время анализа.

Первый анализ выполняется довольно долго. Последующие быстро, так как проверяются только измененные модули. 
Например, для УХ 3.0 первый анализ 10 минут (6 потоков), последующие меньше минуты (машина: i5 8400, SSD).
Оперативной памяти в зависимости от варианта использования и анализируемой конфигурации требуется примерно от 0,2 до 2 гигабайт.

Диагностик в комплекте в данном репозитории сейчас нет.

В разработке используется версия платформы 8.3.13.1809