﻿
Функция ПолучитьДействующуюЦену(Период, Контрагент, Номенклатура) Экспорт
	
	Возврат ПолучитьЦенуНаСервере(Период, Контрагент, Номенклатура);
	
КонецФункции

&НаСервере
Функция ПолучитьЦенуНаСервере(Период, Контрагент, Номенклатура)
	
	Возврат СлужебныеФункции.ПолучитьЦену(Контрагент, Номенклатура, Период);
	
КонецФункции