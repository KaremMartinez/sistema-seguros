const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'SistemaSeguros' //
});

connection.connect((err) => {
    if (err) throw err;
    console.log("Conectado exitosamente a la base de datos SistemaSeguros");
});

module.exports = connection;