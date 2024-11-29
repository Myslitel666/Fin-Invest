-- Таблица Stock
CREATE TABLE Stock (
    stockId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- Уникальный идентификатор акции
    stockTitle VARCHAR(64) NOT NULL,                     -- Название акции
    stockLogo BYTEA                                      -- Логотип акции
);

-- Таблица Repurchase
CREATE TABLE Repurchase (
    repurchaseId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- Уникальный идентификатор выкупа
    stockId INT NOT NULL,                                      -- Ссылка на акцию
    CONSTRAINT FK_Repurchase_Stock FOREIGN KEY (stockId)
    REFERENCES Stock (stockId)                                  
);

-- Таблица TransactionType
CREATE TABLE TransactionType (
    transactionTypeId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- Уникальный идентификатор типа транзакции
    value VARCHAR(256) NOT NULL                                     -- Название типа транзакции (например, 'Purchase', 'PartialSale', 'FullSale')
);

-- Таблица Transaction
CREATE TABLE Transaction (
    transactionId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,       -- Уникальный идентификатор транзакции
    repurchaseId INT NOT NULL,                                        -- Ссылка на экземпляр торгов
    transactionTypeId INT NOT NULL,                                   -- Ссылка на тип транзакции
    transactionPrice NUMERIC(10, 2) NOT NULL,                         -- Цена сделки
    transactionDatetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Дата и время транзакции
    CONSTRAINT FK_Transaction_Repurchase FOREIGN KEY (repurchaseId)
    REFERENCES Repurchase (repurchaseId),                          
    CONSTRAINT FK_Transaction_TransactionType FOREIGN KEY (transactionTypeId)
    REFERENCES TransactionType (transactionTypeId)               
);
