# Структуру приложения и схема взаимодействия сервисов

Сервис BabyBilling.

Имитатор коммутатора генерирует записи о звонках абонентов в 5 потоков. Данные сортируются по сохраняются в txt файлы в папке cdr
ScanCdr сканирует папку cdr и определяет имена файлов. Каждый файл прочитывается построчно, данные передаются в Kafka.

Сервис BRT. 

BRT забирает из Kafka информацию о звонке, производит авторизацию абонентов оператора "Ромашка", запрашивает из базы данных 
HRS id тарифа абонента, дополняет информацию о звонке абонента. Информация в виде строки передаётся в Kafka.

Далее после получения из Kafka информации о калькуляции звонка BRT производит списание со счёта абонента по id.

В процессе чтения информации о звонке BRT определяет текущий месяц. При смене месяца сервис запрашивает информацию об абонентах 
с помесячным тарифом и отправляет запрос на списание ежемесячной абонентской платы и начисление баланса минут.

Ежемесячно происходит рандомная смена тарифа у 1-3 абонентов, а также зачисление радномной суммы средств на счёт каждого абонента.

Сервис HRS.

HRS забирает из Kafka данные о длительности звонка и тарифе абонента, после чего производит вычисления в соответствии 
с деталями тарифа абонента. Далее HRS отправляет в Kafka информацию с калькуляцией звонка.

Сервис CRM.

CRM производит авторизацию абонентов и менеджеров, а также обрабатывает запросы на пополнение счёта, смену тарифа абонента 
и создание нового абонента. У менеджера и абонента есть система ролей, в зависимости от которой они получают доступ к 
методам.