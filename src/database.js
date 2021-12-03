const mysql = require("mysql");
const { promisify } = require("util");

const { database } = require("./keys");

const pool = mysql.createPool(database); //El método pool de mysql es para posibles fallos en producción

pool.getConnection((err, connection) => {
	if (err){
		if (err.code === "PROTOCOL_CONNECTION_LOST") {
			console.error("LA CONEXIÓN CON LA BASE DE DATOS FUE CERRADA");
		}
		if (err.code === "ER_CON_COUNT_ERROR") {
			console.error("LA BASE DE DATOS TIENE MÚLTIPLES CONEXIONES");
		}
		if (err.code === "ECONNREFUSED") {
			console.error("LA CONEXIÓN CON LA BASE DE DATOS FUE RECHAZADA");
		}
	}

	if (connection) connection.release();
	console.log("La conexión con la base de datos fue exitosa");
	return;
});

// Para convertir promesas (lo que antes era en callbacks)
pool.query = promisify(pool.query);

module.exports = pool;