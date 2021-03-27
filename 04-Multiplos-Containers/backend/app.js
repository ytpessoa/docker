// Back End

const { request } = require('express')
const express  = require('express') //Servidor Web
const restful = require('node-restful')
const server = express() //start
const mongoose = restful.mongoose


// Conexão com o Database(MongoDB) //
mongoose.Promise = global.Promise //usando API de Promise do NODE
mongoose.connect('mongodb://db/mydb')
// db = nome do servidor de banco (container)
// mydb = Schema

// Teste:
    // req: request
    // res: resposta
server.get('/', (req, res, next) => res.send('Backend') )


// Start server
server.listen(3000)
