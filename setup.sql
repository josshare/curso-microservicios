CREATE TABLE Adults (
  Id INT PRIMARY KEY IDENTITY(1,1),
  Name NVARCHAR(100),
  Lastname NVARCHAR(100),
  BirthYear INT,
  ImageUrl NVARCHAR(MAX)
);

INSERT INTO Adults (Name, Lastname, BirthYear, ImageUrl)
VALUES
('Amin', 'Espinosa', 1985, 'amin.jpg'),
('Carlos', 'Moreno', 1994, 'carlos.jpg'),
('Sandra', 'Martínez', 1980, 'sandra.jpg');
