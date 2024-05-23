COMMENT ON TABLE PERSON_DISCOUNTS IS 'Таблица скидок, которая предоставляется в зависимости от количества заказов';
COMMENT ON COLUMN PERSON_DISCOUNTS.ID IS 'Первичный идентификационный номер таблицы';
COMMENT ON COLUMN PERSON_DISCOUNTS.PERSON_ID IS 'Идентификационный номер посетителя';
COMMENT ON COLUMN PERSON_DISCOUNTS.PIZZERIA_ID IS 'Идентификационный номер пиццерии';
COMMENT ON COLUMN PERSON_DISCOUNTS.DISCOUNT IS 'Размер скидки в процентах от первоначальной цены';