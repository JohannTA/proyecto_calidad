--Bien
CREATE TABLE tipo_docente (
  tipo_docente_id int(10) NOT NULL AUTO_INCREMENT,
  tipo            char(1),
  PRIMARY KEY (tipo_docente_id)
);
--Bien
CREATE TABLE modalidad_curso (
  modalidad_curso_id int(10) NOT NULL AUTO_INCREMENT,
  modalidad          varchar(255),
  PRIMARY KEY (modalidad_curso_id)
);
--Bien
CREATE TABLE facultad (
  facultad_id     int(10) NOT NULL AUTO_INCREMENT,
  nombre_facultad varchar(50) NOT NULL,
  PRIMARY KEY (facultad_id)
);
--Bien
CREATE TABLE edificio (
  edificio_id     int(10) NOT NULL AUTO_INCREMENT,
  nombre_edificio int(10),
  PRIMARY KEY (edificio_id)
);
--Bien
CREATE TABLE escuela (
  escuela_id     int(10) NOT NULL AUTO_INCREMENT,
  nombre_escuela varchar(50) NOT NULL,
  facultad_id    int(10) NOT NULL,
  PRIMARY KEY (escuela_id),
  FOREIGN KEY (facultad_id) REFERENCES facultad (facultad_id)
);
--Bien
CREATE TABLE piso (
  piso_id     int(10) NOT NULL AUTO_INCREMENT,
  numero_piso int(2),
  edificio_id int(10) NOT NULL,
  PRIMARY KEY (piso_id),
  FOREIGN KEY (edificio_id) REFERENCES edificio (edificio_id)
);
--Bien
CREATE TABLE plan_estudio (
  plan_id     int(10) NOT NULL AUTO_INCREMENT,
  descripcion varchar(50) NOT NULL,
  estado_plan boolean NOT NULL,
  escuela_id  int(10) NOT NULL,
  PRIMARY KEY (plan_id),
  FOREIGN KEY (escuela_id) REFERENCES escuela (escuela_id)
);
--Bien
CREATE TABLE ambiente (
  ambiente_id          int(10) NOT NULL AUTO_INCREMENT,
  tipo_ambiente        char(2) NOT NULL,--Labs, aulas, Auditorio
  descripcion_ambiente varchar(50) NOT NULL,
  capacidad            int(10) NOT NULL,
  estado_ambiente      boolean NOT NULL,
  piso_id              int(10) NOT NULL,
  PRIMARY KEY (ambiente_id),
  FOREIGN KEY (piso_id) REFERENCES piso (piso_id)
);
--Bien
CREATE TABLE docente (
  docente_id           int(10) NOT NULL AUTO_INCREMENT,
  numero_documento     varchar(8) NOT NULL UNIQUE,
  nombres              varchar(50) NOT NULL,
  apellido_paterno     varchar(50) NOT NULL,
  apellido_materno     varchar(50) NOT NULL,
  estado_docente       boolean NOT NULL,
  ultimo_grado_docente char(1) NOT NULL,-- Bachiller (B),  Master(M) , Doctorado (D), PosDoctorado (P)
  tipo_docente_id      int(10) NOT NULL,
  PRIMARY KEY (docente_id),
  FOREIGN KEY (tipo_docente_id) REFERENCES tipo_docente (tipo_docente_id)
);
--Bien
CREATE TABLE intervalo (
  intervalo_id int(10) NOT NULL AUTO_INCREMENT,
  h_inicioDis  time(7) NOT NULL,
  h_finDis     time(7) NOT NULL,
  diaDis       char(1) NOT NULL,--dia disponible (1,2,3,4,5,6,7)
  PRIMARY KEY (intervalo_id)
);
--Bien
CREATE TABLE curso (
  curso_id           int(10) NOT NULL AUTO_INCREMENT,
  codigo_curso       varchar(20) NOT NULL,
  nombre_curso       varchar(30) NOT NULL,
  creditos           int(2) NOT NULL,
  h_teoria           int(1) NOT NULL,
  h_practica         int(1) NOT NULL,
  ciclo              int(2) NOT NULL,
  estado_curso       boolean NOT NULL,
  plan_estudio_id    int(10) NOT NULL,
  modalidad_curso_id int(10) NOT NULL,
  PRIMARY KEY (curso_id),
  FOREIGN KEY (plan_estudio_id) REFERENCES plan_estudio (plan_id),
  FOREIGN KEY (modalidad_curso_id) REFERENCES modalidad_curso (modalidad_curso_id)
);
--Bien
CREATE TABLE semestre (
  codigo_semestre char(6) NOT NULL,
  f_inicio        date NOT NULL,
  f_fin           date NOT NULL,
  estado_semestre boolean NOT NULL,
  PRIMARY KEY (codigo_semestre)
);
--Bien
CREATE TABLE grupo (
  grupo_id        int(10) NOT NULL AUTO_INCREMENT,
  numero_vacantes int(2) NOT NULL,
  estado_grupo    boolean NOT NULL,
  denominacion    char(1) NOT NULL,--A-B-C
  docente_id      int(10) NOT NULL,
  curso_id        int(10) NOT NULL,
  PRIMARY KEY (grupo_id),
  FOREIGN KEY (curso_id) REFERENCES curso (curso_id),
  FOREIGN KEY (docente_id) REFERENCES docente (docente_id)
);
--Bien
CREATE TABLE horario (
  horario_id      int(10) NOT NULL AUTO_INCREMENT,
  dia             char(1) NOT NULL,--dia disponible (1,2,3,4,5,6,7)
  h_inicio        time(7) NOT NULL,
  h_fin           time(7) NOT NULL,
  grupo_id        int(10) NOT NULL,
  ambiente_id     int(10) NOT NULL,
  codigo_semestre char(6) NOT NULL,
  PRIMARY KEY (horario_id),
  FOREIGN KEY (ambiente_id) REFERENCES ambiente (ambiente_id),
  FOREIGN KEY (grupo_id) REFERENCES grupo (grupo_id),
  FOREIGN KEY (codigo_semestre) REFERENCES semestre (codigo_semestre)
);
--Bien
CREATE TABLE disponibilidad (
  intervalo_id int(10) NOT NULL,
  docente_id   int(10) NOT NULL,
  PRIMARY KEY (intervalo_id, docente_id),
  FOREIGN KEY (docente_id) REFERENCES docente (docente_id),
  FOREIGN KEY (intervalo_id) REFERENCES intervalo (intervalo_id)
);

--Bien
CREATE TABLE usuario (
  usuario_id int(10) NOT NULL AUTO_INCREMENT,
  nombre_usuario     varchar(30),
  pass       varchar(50),
  escuela_id int(10) NOT NULL,
  PRIMARY KEY (usuario_id),
  FOREIGN KEY (escuela_id) REFERENCES escuela (escuela_id)
);
