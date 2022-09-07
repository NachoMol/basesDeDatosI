-- Parte 1
SELECT facturas.facturaID , facturas.FechaFactura , correos.compania , clientes.Contacto , categorias.CategoriaNombre , productos.ProductoNombre , productos.precioUnitario , facturadetalle.Cantidad
FROM facturas 
INNER JOIN correos ON facturas.envioVia = correos.CorreoID
INNER JOIN clientes ON facturas.ClienteID = clientes.ClienteID
INNER JOIN facturadetalle ON facturas.facturaID = facturaDetalle.facturaID
INNER JOIN productos ON facturadetalle.ProductoID = productos.ProductoID
INNER JOIN categorias ON productos.CategoriaID = categorias.categoriaID;

-- Parte 2
SELECT categorias.* , productos.* from categorias
LEFT JOIN productos ON productos.CategoriaID = categorias.CategoriaID;

SELECT * FROM clientes
LEFT JOIN facturas on facturas.clienteID = clientes.clienteID
WHERE facturas.clienteID IS NULL;

SELECT productos.* , proveedores.* FROM productos
LEFT JOIN proveedores ON productos.proveedorID = proveedores.ProveedorID;

