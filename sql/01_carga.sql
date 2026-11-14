CREATE DATABASE cumpleanos_mx CHARACTER SET utf8mb4;

USE cumpleanos_mx;

SHOW VARIABLES LIKE 'secure_file_priv';

CREATE TABLE nacimientos_raw (
    fecha_nacimiento  VARCHAR(20),
    hora_nacimiento   VARCHAR(10),
    sexo              VARCHAR(10),
    entidad_parto     VARCHAR(10),
    municipio_parto   VARCHAR(10),
    anio_archivo      SMALLINT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/2023_Nacimientos_2023.csv'
INTO TABLE nacimientos_raw
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
  -- columnas 1 a 29: no las usamos
  @x,@x,@x,@x,@x,@x,@x,@x,@x,@x,
  @x,@x,@x,@x,@x,@x,@x,@x,@x,@x,
  @x,@x,@x,@x,@x,@x,@x,@x,@x,
  -- columnas 30, 31, 32: fecha, hora y sexo del bebé
  fecha_nacimiento, hora_nacimiento, sexo,
  -- columnas 33 a 55: no las usamos
  @x,@x,@x,@x,@x,@x,@x,@x,@x,@x,
  @x,@x,@x,@x,@x,@x,@x,@x,@x,@x,
  @x,@x,@x,
  -- columnas 56 y 57: estado y municipio donde nació el bebé
  entidad_parto, municipio_parto,
  -- columnas 58 a 68: no las usamos
  @x,@x,@x,@x,@x,@x,@x,@x,@x,@x,
  @x
)
SET anio_archivo = 2023;

SELECT COUNT(*)FROM nacimientos_raw;

SELECT * FROM nacimientos_raw LIMIT 2;

