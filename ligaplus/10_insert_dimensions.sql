
--- Location
INSERT INTO public."Location" ("Id", "State", "Country", "Lat", "Long" ) VALUES
(1, 'Andalusia', 'Spain', 37.3890924, -5.9844589),
(2, 'Aragon', 'Spain', 41.5976277, -0.9056621),
(3, 'Asturias', 'Spain', 43.3613951, -5.8593269),
(4, 'Balearic Islands', 'Spain', 39.5696005, 2.6501603),
(5, 'Basque Country', 'Spain', 43.2630136, -2.9351482),
(6, 'Canary Islands', 'Spain', 28.2915637, -16.6291304),
(7, 'Cantabria', 'Spain', 43.1828396, -3.9878424),
(8, 'Castile and León', 'Spain', 41.6822327, -4.4421391),
(9, 'Castilla-La Mancha', 'Spain', 39.2795606, -3.097702),
(10, 'Catalonia', 'Spain', 41.5911589, 1.5208624),
(11, 'Extremadura', 'Spain', 39.4747689, -6.3729635),
(12, 'Galicia', 'Spain', 42.5750554, -8.1338554),
(13, 'La Rioja', 'Spain', 42.2870733, -2.5396036),
(14, 'Madrid', 'Spain', 40.4167047, -3.7035825),
(15, 'Murcia', 'Spain', 37.9923795, -1.1305431),
(16, 'Navarre', 'Spain', 42.6953919, -1.6760691),
(17, 'Valencian Community', 'Spain', 39.4699075, -0.3762881);

--- Position
INSERT INTO public."Position" ("Id", "Position")
VALUES 
(1, 'Home'),
(2, 'Menu'),
(3, 'Search Box'),
(4, 'Carrousel'),
(5, 'Dropdown');


-- Insert data for Id 1
INSERT INTO public."Subscription" ("Id", "Type", "Description")
VALUES 
(1, 'Basic', 'Este es el plan minimo que un usuario con subscripcion paga puede acceder, el contenido que se ofrece es menor a los planes siguientes'),
(2, 'Standard', 'Este plan posee el contenido basico, mas una serie de eventos especiales dentro de los deportes nacionales mas vistos, como Petanca'),
(3, 'Premium', 'Este es el plan mas caro de la plataforma, posee todo el contenido disponible a la fecha, sin limites');

INSERT INTO public."Category" ("Id", "Description")
VALUES
(1, 'Futbol'),
(2, 'Baloncesto'),
(3, 'Tenis'),
(4, 'Golf'),
(5, 'Ciclismo'),
(6, 'Automovilismo'),
(7, 'Running'),
(8, 'Voleibol'),
(9, 'Balonmano'),
(10, 'Petanca'),
(11, 'Hockey'),
(12, 'Motociclismo'),
(13, 'Gimnasia'),
(14, 'eSports');

--- Create table time from 1900-01-01 to 2099-12-31
INSERT INTO public."Time" ("Id", "Day", "Month", "Year")
SELECT
    date_sequence AS "Id",
    EXTRACT(DAY FROM date_sequence) AS "Day",
    EXTRACT(MONTH FROM date_sequence) AS "Month",
    EXTRACT(YEAR FROM date_sequence) AS "Year"
FROM (
    SELECT generate_series(
        '1900-01-01'::date, '2099-12-31'::date, interval '1 day'
    )::date AS date_sequence
) AS date_series;

--- Greate Segment
INSERT INTO public."Segment"("Id", "Description") VALUES 
	(0, 'Jóven Consumo Alto'),
	(1, 'Jóven Consumo Bajo'),
	(2, 'Jóven Nuevo'),
	(3, 'Adulto Consumo Alto'),
	(4, 'Adulto Consumo Bajo'),
	(5, 'Adulto Nuevo'),
	(6, 'Adulto Mayor Consumo Alto'),
	(7, 'Adulto Mayor Consumo Bajo'),
	(8, 'Adulto Mayor Nuevo');