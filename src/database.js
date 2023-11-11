const mysql = require('mysql');
const { promisify } = require('util');

const { database } = require('./keys.js');

const pool = mysql.createPool(database);

pool.getConnection((err, connection) => {
    if (err){
        if (err.code === 'PROTOCOL_CONNECTION_LOST'){
            console.error("Database Connection Lost");
        }
        if (err.code === 'ER_CON_COUN_ERR'){
            console.error("Database Has To Many Connections");
        }
        if (err.code === 'ECONNREFUSED'){
            console.error('Database Connection Was Refused');
        }
    }
    if (connection) connection.release();
    console.log(`DB Is Connected`);
    return;

});

//Promisify Pool Query
pool.query = promisify(pool.query);

module.exports = pool;