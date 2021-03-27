// Back End

const { request } = require('express')
const express  = require('express') //Servidor Web
const restful = require('node-restful')
const server = express() //start
const mongoose = restful.mongoose
const bodyParser = require('body-parser')
const cors = require('cors') // frontend --> backend:outra-porta


// Conexão com o Database(MongoDB) //
mongoose.Promise = global.Promise //usando API de Promise do NODE
mongoose.connect('mongodb://db/mydb')
// db = nome do servidor de banco (container)
// mydb = Schema


// Middlewares
server.use(bodyParser.urlencoded({extended:true}))
server.use(bodyParser.json())
server.use(cors())

// ODM
const Client = restful.model('Client', {
    name: { type: String, required: true }
})

// Rest API
Client.methods(['get', 'post', 'put', 'delete'])
Client.updateOptions({new: true, runValidators: true})



// Routes
Client.register(server, '/clients') //raiz da rota: /clients

// Start server
server.listen(3000)



