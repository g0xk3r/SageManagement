const express = require('express');
const morgan = require('morgan');
const path = require('path');
const mysql = require('mysql');
const myConnection = require('express-myconnection');

//A ver si logramos hacer algo
//Initializations
const app = express();

//Settings
app.set('port', process.env.PORT || 4000);
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

//Middlewares
app.use(morgan('dev'));
app.use(myConnection(mysql, {
    host: "localhost",
    user: 'root',
    password: 'n0m3l0',
    port: 3306,
    database:'sagemanagmentdb'
}, 'single'));
app.use(express.json());

//Global variables
app.use((req, res, next) => {
    next();
});

//Routes
app.use(require('./routes'));
app.use(require('./routes/authentication'));

//Public
app.use(express.static(path.join(__dirname, 'public')));

//Starting the server
app.listen(app.get('port'), () => {
    console.log(`Server on port ${app.get('port')}`);
});


//REVISAR PORQUE NO ESTA HACIENDO CONEXION CON LA BASE DE DATOS