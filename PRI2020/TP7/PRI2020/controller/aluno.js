var Aluno = require('../models/aluno');

// Devolve a lista de alunos 
module.exports.listar = () => {
    return Aluno.find().exec();
}

/*
Investigar a razão disso não funcionar !!!

Consultar
module.exports.consultar = id => {
    return Aluno.findOne({Número:id}).exec();
}
*/

// Consultar
module.exports.consultar = id => {
    return Aluno.find({Número:id}).exec();
}


// Inserir 
module.exports.inserir = a => {
    var novo = new Aluno(a);
    return novo.save();
}

// Actualizar
module.exports.actualizar = a => {
    var aluno = new Aluno(a);
    return Aluno.update({"Número":aluno.Número},{ $set: { "Número": aluno.Número , "Nome": aluno.Nome, "Git":aluno.Git }}).exec();
     
}



// Remover 

module.exports.apagar = id => {

    return Aluno.deleteOne({"Número":id}).exec();
}
