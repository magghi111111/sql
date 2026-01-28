
SELECT --è una proiezione dei dati
-- Per estrarre informazioni dal database si usa il comando SELECT


SELECT --<elenco attributi>
FROM --<elenco tabelle>
WHERE --<condizione>;

LIMIT --viene eseguita per ultima e limita il numero di righe restituite nel risultato finale

--è valutata dal motore del DBMS nell’ordine: FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT


SELECT 'Area del rettangolo', 5*4 AS area;

AS --Alias che sono strumenti di comunicazione che rendono i nostri risultati comprensibili

ALL --mantiene tutti i record, inclusi quelli duplicati
DISTINCT --che elimina i duplicati

ORDER BY --organizza i nostri risultati secondo criteri logici e funzionali

ASC --ordinamento crescente (default)
DESC --ordinamento decrescente
-
BETWEEN --verifica se l’espressione è maggiore o uguale al valore minimo e minore o uguale al valore massimo

SELECT ISBN, Titolo, Prezzo
FROM Libro
WHERE Prezzo BETWEEN 10 AND 13;

LIKE --introduce un elemento di flessibilità nella ricerca testuale, permettendoci di trovare corrispondenze parziali attraverso i caratteri jolly

SELECT ISBN, Autore, Editore
FROM Libro
WHERE Editore LIKE ‘S%’ OR Editore LIKE ‘M%’;

JOIN --rappresenta lapproccio più elegante quando le tabelle condividono campi con nomi identici che rappresentano la stessa informazione, Il sistema deduce automaticamente su quali campi effettuare la congiunzione

SELECT NomeEditore, ISBN, Titolo, Citta
FROM Libro NATURAL JOIN Editore;

INNER JOIN --offre controllo completo sui criteri di unione e garantisce che solo i record con corrispondenze in entrambe le tabelle vengano inclusi nel risultato

SELECT L.Titolo, L.NomeAutore, E.Citta --Implicita
FROM Libro L, Editore E
WHERE L.NomeEditore = E.NomeEditore;

SELECT L.Titolo, L.NomeAutore, E.Citta --Esplicita
FROM Libro L
INNER JOIN Editore E ON L.NomeEditore = E.NomeEditore;

--join naturale : chiamare le chiave primaria nello stesso modo di quella secondaria