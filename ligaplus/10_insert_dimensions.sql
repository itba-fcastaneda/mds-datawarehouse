
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


--- Greate Segment
INSERT INTO public."Segment"("Id", "Description") VALUES 
	(1, 'Jóven Consumo Alto'),
	(2, 'Jóven Consumo Bajo'),
	(3, 'Jóven Nuevo'),
	(4, 'Adulto Consumo Alto'),
	(5, 'Adulto Consumo Bajo'),
	(6, 'Adulto Nuevo'),
	(7, 'Adulto Mayor Consumo Alto'),
	(8, 'Adulto Mayor Consumo Bajo'),
	(9, 'Adulto Mayor Nuevo');