CREATE DATABASE Futura;
USE Futura;

-- Creation of the Machinery table
CREATE TABLE Macchinari (
    Codice_Macchinario INT PRIMARY KEY,
    Data_inizio_impiego DATE,
    Tipologia VARCHAR(50),
    Descrizione VARCHAR(100)
);

-- Creation of the Sectors table
CREATE TABLE Settori (
    Codice_Settore INT PRIMARY KEY,
    Nome_Settore VARCHAR(50)
);

-- Creation of the Raw Materials table
CREATE TABLE Materie_prime (
    Codice_Materia INT PRIMARY KEY,
    Tipologia VARCHAR(50),
    Costo DECIMAL(10, 2),
    Disponibilità BOOLEAN,
    Descrizione VARCHAR(100)
);

-- Creation of the Stocks table
CREATE TABLE Magazzini (
    Codice_Magazzino INT PRIMARY KEY,
    ID_Reparto INT,
    Tasso_di_occupazione DECIMAL(5, 2)
);

-- Creation of the Suppliers table
CREATE TABLE Fornitori (
    Codice_Fornitore INT PRIMARY KEY,
    Nome_Fornitore VARCHAR(50),
    Tipologia VARCHAR(50),
    Data_Consegna DATE
);

-- Creation of the Clerks table
CREATE TABLE Impiegati (
    Codice_Impiegato INT PRIMARY KEY,
    Nome VARCHAR(50),
    Cognome VARCHAR(50),
    Data_nascita DATE,
    Salario DECIMAL(10, 2)
);

-- Creation of the Customers table
CREATE TABLE Clienti (
    Codice_Cliente INT PRIMARY KEY,
    Nome VARCHAR(50),
    Cognome VARCHAR(50),
    Data_Nascita DATE,
    Telefono VARCHAR(20),
    Indirizzo VARCHAR(100)
);

-- Creation of the Products table
CREATE TABLE Prodotti (
    Codice_Prodotto INT PRIMARY KEY,
    Nome_Prodotto VARCHAR(50),
    Descrizione VARCHAR(100),
    Quantità_Disponibile INT,
    Prezzo_Vendita DECIMAL(10, 2)
);

-- Creation of the Employees table
CREATE TABLE Dipendenti (
    Codice_Dipendente INT PRIMARY KEY,
    Cognome VARCHAR(50),
    Nome VARCHAR(50),
    Data_nascita DATE,
    Mansione VARCHAR(50),
    Salario DECIMAL(10, 2),
    Codice_Settore INT,
    Codice_Magazzino INT,
    FOREIGN KEY (Codice_Settore) REFERENCES Settori (Codice_Settore),
    FOREIGN KEY (Codice_Magazzino) REFERENCES Magazzini (Codice_Magazzino)
);

-- Creation of the Couriers table
CREATE TABLE Corrieri (
    Codice_Corriere INT PRIMARY KEY,
    Nome_Corriere VARCHAR(50)
);

-- Creating the Orders table
CREATE TABLE Ordini (
    Codice_Ordine INT PRIMARY KEY,
    Data_Ordine DATE,
    Stato BOOLEAN,
    Commenti VARCHAR(100),
    Data_Consegna DATE,
    Codice_Cliente INT,
    Codice_Corriere INT,
    FOREIGN KEY (Codice_Cliente) REFERENCES Clienti (Codice_Cliente),
    FOREIGN KEY (Codice_Corriere) REFERENCES Corrieri (Codice_Corriere)
);

-- Creation of the Collocate table
CREATE TABLE Collocate (
    Codice_Materia INT,
    Codice_Magazzino INT,
    Data_Giacenza DATE,
    FOREIGN KEY (Codice_Materia) REFERENCES Materie_prime (Codice_Materia),
    FOREIGN KEY (Codice_Magazzino) REFERENCES Magazzini (Codice_Magazzino)
);


-- Filling Machinery table
INSERT INTO Macchinari (Codice_Macchinario, Data_inizio_impiego, Tipologia, Descrizione)
VALUES (1, '2022-01-01', 'Tagliatrice laser', 'Macchinario per il taglio laser di materiali'),
(2, '2021-06-15', 'Stampante 3D', 'Macchinario per la stampa tridimensionale');

-- Filling Sectors table
INSERT INTO Settori (Codice_Settore, Nome_Settore)
VALUES (1, 'Produzione'),
(2, 'Logistica');

-- Filling Raw materials table
INSERT INTO Materie_prime (Codice_Materia, Tipologia, Costo, Disponibilità, Descrizione)
VALUES (1, 'Ferro', 10.50, true, 'Materiale ferroso'),
(2, 'Plastica', 5.25, true, 'Materiale plastico');

-- Filling Stocks table
INSERT INTO Magazzini (Codice_Magazzino, ID_Reparto, Tasso_di_occupazione)
VALUES (1, 1001, 0.75),
(2, 1002, 0.60);

-- Filling Suppliers table
INSERT INTO Fornitori (Codice_Fornitore, Nome_Fornitore, Tipologia, Data_Consegna)
VALUES (1, 'Fornitore A', 'Elettronica', '2022-03-10'),
(2, 'Fornitore B', 'Chimica', '2022-02-15');

-- Filling Clerks table
INSERT INTO Impiegati (Codice_Impiegato, Nome, Cognome, Data_nascita, Salario)
VALUES (1, 'Mario', 'Rossi', '1990-05-10', 2500.00),
(2, 'Laura', 'Bianchi', '1988-12-15', 2800.00);

-- Filling Customer table
INSERT INTO Clienti (Codice_Cliente, Nome, Cognome, Data_Nascita, Telefono, Indirizzo)
VALUES (1, 'Giuseppe', 'Verdi', '1985-08-20', '1234567890', 'Via Roma 1'),
(2, 'Anna', 'Neri', '1992-03-25', '0987654321', 'Via Milano 2');

-- Filling Products table
INSERT INTO Prodotti (Codice_Prodotto, Nome_Prodotto, Descrizione, Quantità_Disponibile, Prezzo_Vendita)
VALUES (1, 'Prodotto A', 'Descrizione prodotto A', 50, 19.99),
(2, 'Prodotto B', 'Descrizione prodotto B', 100, 9.99);

-- Filling Employees table
INSERT INTO Dipendenti (Codice_Dipendente, Cognome, Nome, Data_nascita, Mansione, Salario, Codice_Settore, Codice_Magazzino)
VALUES (1, 'Russo', 'Giuseppe', '1991-07-05', 'Operatore di produzione', 2000.00, 1, 1),
(2, 'Romano', 'Maria', '1993-09-12', 'Magazziniere', 1800.00, 2, 2);

-- Filling in the Couriers table
INSERT INTO Corrieri (Codice_Corriere, Nome_Corriere)
VALUES (1, 'Corriere X'),
(2, 'Corriere Y');

-- Filling Orders table
INSERT INTO Ordini (Codice_Ordine, Data_Ordine, Stato, Commenti, Data_Consegna, Codice_Cliente, Codice_Corriere)
VALUES (1, '2022-04-01', true, 'Ordine urgente', '2022-04-05', 1, 1),
(2, '2022-03-15', false, 'Ordine standard', '2022-03-20', 2, 2);

-- Filling Place Table
INSERT INTO Collocate (Codice_Materia, Codice_Magazzino, Data_Giacenza)
VALUES (1, 1, '2022-01-10'),
(2, 2, '2022-02-20');


-- ==== TRIGGERS & PROCEDURES ====

-- TRIGGER: Aggiorna la quantità disponibile dopo un nuovo ordine
DELIMITER //
CREATE TRIGGER aggiorna_quantita_disponibile AFTER INSERT ON Ordini
FOR EACH ROW
BEGIN
    DECLARE prodotto_id INT;
    DECLARE quantita_ordine INT;

    SELECT Codice_Prodotto, Quantità_Disponibile
    INTO prodotto_id, quantita_ordine
    FROM Prodotti
    WHERE Codice_Prodotto = NEW.Codice_Prodotto;

    UPDATE Prodotti
    SET Quantità_Disponibile = quantita_ordine - NEW.Quantità
    WHERE Codice_Prodotto = prodotto_id;
END;
//
DELIMITER ;

-- TRIGGER: Rifornimento magazzino
DELIMITER //
CREATE TRIGGER TrgRifornimentoMagazzino AFTER UPDATE ON Magazzini
FOR EACH ROW
BEGIN
    DECLARE tasso_occupazione DECIMAL(5, 2);
    SET tasso_occupazione = (NEW.Tasso_di_occupazione / 100) * 100;

    IF tasso_occupazione < 50 THEN
        INSERT INTO Notifiche (Messaggio)
        VALUES (CONCAT('Rifornimento di materie prime necessario per il magazzino con codice ', NEW.Codice_Magazzino));
    END IF;
END;
//
DELIMITER ;

-- TRIGGER: Verifica disponibilità materia prima
DELIMITER //
CREATE TRIGGER verifica_disponibilita_materia BEFORE INSERT ON Collocate
FOR EACH ROW
BEGIN
    DECLARE disponibilita BOOLEAN;

    SELECT Disponibilità
    INTO disponibilita
    FROM Materie_prime
    WHERE Codice_Materia = NEW.Codice_Materia;

    IF disponibilita = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La materia prima non è disponibile.';
    END IF;
END;
//
DELIMITER ;

-- PROCEDURE: Macchinari per tipologia
DELIMITER //
CREATE PROCEDURE GetMacchinariByTipologia(IN tipologia VARCHAR(50))
BEGIN
    SELECT *
    FROM Macchinari
    WHERE Tipologia = tipologia;
END;
//
DELIMITER ;

-- PROCEDURE: Aggiorna prezzo vendita prodotto
DELIMITER //
CREATE PROCEDURE UpdatePrezzoVendita(IN prodotto_id INT, IN nuovo_prezzo DECIMAL(10, 2))
BEGIN
    UPDATE Prodotti
    SET Prezzo_Vendita = nuovo_prezzo
    WHERE Codice_Prodotto = prodotto_id;
END;
//
DELIMITER ;

-- PROCEDURE: Inserisci nuovo ordine
DELIMITER //
CREATE PROCEDURE InserisciNuovoOrdine(
    IN data_ordine DATE,
    IN stato BOOLEAN,
    IN commenti VARCHAR(100),
    IN data_consegna DATE,
    IN codice_cliente INT,
    IN codice_corriere INT,
    IN prodotti_table_type JSON
)
BEGIN
    DECLARE nuovo_ordine_id INT;

    INSERT INTO Ordini (Data_Ordine, Stato, Commenti, Data_Consegna, Codice_Cliente, Codice_Corriere)
    VALUES (data_ordine, stato, commenti, data_consegna, codice_cliente, codice_corriere);

    SET nuovo_ordine_id = LAST_INSERT_ID();

    -- Assuming prodotti_table_type is a JSON array like:
    -- [{ "prodotto_id": 1, "quantita": 5 }, ...]
    -- Needs to be handled by app logic or rewritten if MySQL doesn't support JSON iteration directly

END;
//
DELIMITER ;

-- PROCEDURE: Calcola salario medio per settore
DELIMITER //
CREATE PROCEDURE CalcolaSalarioMedioSettore(IN settore_id INT, OUT salario_medio DECIMAL(10, 2))
BEGIN
    SELECT AVG(Salario)
    INTO salario_medio
    FROM Dipendenti
    WHERE Codice_Settore = settore_id;
END;
//
DELIMITER ;

-- PROCEDURE: Ordini del cliente nel mese di maggio
DELIMITER //
CREATE PROCEDURE GetOrdiniClienteMaggio(IN codice_cliente INT)
BEGIN
    SELECT *
    FROM Ordini
    WHERE Codice_Cliente = codice_cliente
      AND MONTH(Data_Ordine) = 5;
END;
//
DELIMITER ;
