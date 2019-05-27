 # `idEmpleado` CHAR(6) NOT NULL,
  #`nomEmpleado` VARCHAR(30) NULL,
  #`apeEmpleado` VARCHAR(30) NULL,
  #`dniEmpleado` INT NOT NULL,
  #`dirEmpleado` VARCHAR(30) NULL,
  #`emailEmpleado` VARCHAR(30) NULL DEFAULT 'NO TIENE',
  #`userEmpleado` CHAR(10) NULL,
  #`claveEmpleado` CHAR(10) NULL,
  #`cargoEmpleado` VARCHAR(30) NULL,
  #PRIMARY KEY (`idEmpleado`))
  
  insert into EMPLEADOS values ('123', 'Juan', 'Perez', '0326', 'Mzsad83', 'a@a.com', 'Juper', '12345', 'INGENIERO');
  
  select * from EMPLEADOS;