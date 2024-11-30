-- Таблица Stock
CREATE TABLE Stock (
    stockId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- Уникальный идентификатор ценной бумаги
    stockTitle VARCHAR(64) NOT NULL,                      -- Название ценной бумаги
    stockLogo TEXT                                        -- Логотип ценной бумаги
);

-- Таблица Repurchase
CREATE TABLE Repurchase (
    repurchaseId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- Уникальный идентификатор вложения
    stockId INT NOT NULL,                                      -- Ссылка на ценную бумагу
    isValid BOOLEAN DEFAULT TRUE,                              -- Валидность вложения
    CONSTRAINT FK_Repurchase_Stock FOREIGN KEY (stockId)
    REFERENCES Stock (stockId)                                  
);

-- Таблица TransactionType
CREATE TABLE TransactionType (
    transactionTypeId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- Уникальный идентификатор типа транзакции
    value VARCHAR(256) NOT NULL                                     -- Значение типа транзакции (например, 'Purchase', 'Partial Sale', 'Full Sale')
);

-- Таблица Transaction
CREATE TABLE Transaction (
    transactionId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,       -- Уникальный идентификатор транзакции
    repurchaseId INT NOT NULL,                                        -- Ссылка на экземпляр вложения
    transactionTypeId INT NOT NULL,                                   -- Ссылка на тип транзакции
	lotsQuantity INT NOT NULL,                                        -- Количество лотов
    lotValue NUMERIC(10, 2) NOT NULL NOT NULL,                        -- Стоимость лота
    transactionPrice NUMERIC(10, 2) NOT NULL,                         -- Цена сделки
	comission NUMERIC(10, 2) NOT NULL NOT NULL,                       -- Комиссия
    transactionDatetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Дата и время транзакции
    isValid BOOLEAN DEFAULT TRUE,                                     -- Валидность транзакции
    CONSTRAINT FK_Transaction_Repurchase FOREIGN KEY (repurchaseId)
    REFERENCES Repurchase (repurchaseId),                          
    CONSTRAINT FK_Transaction_TransactionType FOREIGN KEY (transactionTypeId)
    REFERENCES TransactionType (transactionTypeId)               
);