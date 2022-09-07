SELECT * FROM clientes;
SELECT * FROM facturas;
SELECT * FROM productos;
SELECT * FROM facturadetalle;

SELECT facturaID , apellido FROM facturas INNER JOIN empleados ON facturas.EmpleadoID = empleados.EmpleadoID WHERE empleados.Apellido = 'Buchanan';

SELECT * FROM facturas
INNER JOIN correos ON facturas.EnvioVia = correos.CorreoId
WHERE correos.Compania = 'Speedy Express'; 

SELECT FacturaID , Nombre , Apellido FROM empleados 
INNER JOIN facturas ON empleados.EmpleadoID = facturas.EmpleadoID
group by facturas.FacturaID;

SELECT facturas.* FROM facturas
INNER JOIN clientes ON facturas.ClienteID = clientes.ClienteID
WHERE clientes.titulo = 'Owner' AND facturas.PaisEnvio = 'USA';

SELECT facturas.* FROM facturas
INNER JOIN empleados ON facturas.EmpleadoID = empleados.EmpleadoID
INNER JOIN facturadetalle ON facturas.facturaID = facturadetalle.facturaID
WHERE empleados.apellido = 'Leverling' OR facturadetalle.ProductoID = 42;

SELECT facturas.ClienteID , precioUnitario*cantidad AS total FROM facturadetalle
INNER JOIN facturas ON facturadetalle.FacturaID = facturas.FacturaID
INNER JOIN clientes ON facturas.ClienteID = clientes.ClienteID
GROUP BY facturas.ClienteID
ORDER BY total DESC LIMIT 5;
-- Preguntar a Rodri por que nos tiró error al ordenar por facturaDetalle.total

SELECT clientes.Clienteid , clientes.nombre , clientes.apellido , facturas.FacturaID , facturas.FechaFactura , paisEnvio , facturadetalle.total FROM clientes
INNER JOIN facturas ON clientes.FacturaID = facturas.FacturaID
INNER JOIN facturadetalle ON facturas.FacturaID = facturaDetalle.facturaID
ORDER BY FechaFactura DESC LIMIT 10;
-- No salió

