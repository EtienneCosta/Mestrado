var mongoose = require('mongoose');


var alunoSchema = new mongoose.Schema({

    Número:String,
    Nome: String,
    Git: String,
    tpc: [Number]
});

module.exports = mongoose.model('Aluno', alunoSchema, 'work')