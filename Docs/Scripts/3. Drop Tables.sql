-- Удаляем Foreign Key Constraints
ALTER TABLE Transaction DROP CONSTRAINT FK_Transaction_Repurchase;
ALTER TABLE Transaction DROP CONSTRAINT FK_Transaction_TransactionType;
ALTER TABLE Repurchase DROP CONSTRAINT FK_Repurchase_Stock;

-- Удаляем таблицы в порядке зависимости
DROP TABLE IF EXISTS Transaction;
DROP TABLE IF EXISTS TransactionType;
DROP TABLE IF EXISTS Repurchase;
DROP TABLE IF EXISTS Stock;
