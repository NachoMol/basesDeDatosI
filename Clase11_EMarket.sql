-- Categorias y Productos
SELECT * FROM categorias;
SELECT CategoriaNombre , Descripcion FROM categorias;
SELECT * FROM productos;
SELECT * FROM productos WHERE discontinuado = 1;
SELECT * FROM productos WHERE ProveedorId = 8;
SELECT * FROM productos WHERE PrecioUnitario BETWEEN 10 AND 22;
SELECT * FROM productos WHERE UnidadesStock < NivelReorden;
SELECT * FROM productos WHERE UnidadesStock < NivelReorden AND UnidadesPedidas = 0;

-- Clientes
SELECT * FROM clientes;
SELECT Contacto,Compania,Titulo,Pais FROM clientes ORDER BY Pais;
SELECT * FROM clientes WHERE titulo = 'Owner';
SELECT * FROM clientes WHERE Contacto LIKE 'C%';

-- Facturas
SELECT * FROM facturas;
SELECT * FROM facturas ORDER BY FechaFactura;
SELECT * FROM facturas WHERE PaisEnvio = 'USA' AND EnvioVia != 3;
SELECT * FROM facturas WHERE ClienteId = 'GOURL';
SELECT * FROM facturas WHERE EmpleadoID IN (2,3,5,8,9);

-- Parte 2
-- Productos
SELECT * FROM productos ORDER BY precioUnitario DESC;
SELECT * FROM productos ORDER BY precioUnitario DESC LIMIT 5 ;
SELECT * FROM productos ORDER BY UnidadesStock DESC LIMIT 10;

-- FacturaDetalle
SELECT * FROM facturaDetalle;
SELECT FacturaID,ProductoID,Cantidad FROM facturaDetalle;
SELECT FacturaID,ProductoID,Cantidad FROM facturaDetalle ORDER BY Cantidad DESC;
SELECT FacturaID,ProductoID,Cantidad FROM facturaDetalle WHERE Cantidad BETWEEN 50 AND 100;
SELECT FacturaID AS NroFactura , ProductoId AS Producto , PrecioUnitario*Cantidad AS Total FROM facturaDetalle; 

-- EXTRAS
SELECT * FROM clientes WHERE pais IN ('Brazil' , 'Mexico') OR titulo LIKE 'Sales%';
SELECT * FROM clientes WHERE Compania LIKE 'A%';
SELECT Ciudad, Contacto AS 'Apellido y Nombre' , Titulo AS Puesto FROM clientes WHERE Ciudad = 'Madrid';
SELECT * FROM Facturas where FacturaID BETWEEN 10000 AND 10500;
SELECT * FROM Facturas where FacturaID BETWEEN 10000 AND 10500 OR ClienteID LIKE "B%";
SELECT * FROM facturas WHERE CiudadEnvio = 'Vancouver' OR EnvioVia = 3;


