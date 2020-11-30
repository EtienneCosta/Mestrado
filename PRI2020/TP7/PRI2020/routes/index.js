var express = require('express');
var router = express.Router();

const Aluno = require('../controller/aluno');
const aluno = require('../models/aluno');

/* GET home page. */
router.get('/', function(req, res, next) {

  Aluno.listar().then(dados => res.render('index',{title: 'Turma PRI 2020', lista:dados}))
  .catch(e => res.render('error',{error:e}))

});


router.get('/alunos',function(req,res) {

    Aluno.listar().then(dados => res.render('alunos',{lista:dados}))
                  .catch(e => res.render('error',{error:e}))
  
})


router.get(/\/alunos\/:[A-Za-z0-9]+/,function(req,res){
  
  console.log("REQUEST:"+req.url);
  var id = req.url.split(":")[1];
  console.log(id);

  Aluno.consultar(id).then(dados => res.render('alunos',{lista:dados}))
                     .catch(e => res.render('error',{error:e}))             

})



router.get('/alunos/registar',function(req,res) {

  res.render('registo', { title: 'Registar Aluno' });
  

});



router.get('/alunos/editar',function(req,res){
  
  res.render('edit', { title: 'Editar Aluno'});


});


router.get('/alunos/apagar',function(req,res){
  
  res.render('delete', { title: 'Remover Aluno'});


});



router.post('/alunos',function(req,res) {
  Aluno.inserir(req.body);
  res.redirect('/');

});


router.post('/alunos/edit',function(req,res) {
  Aluno.actualizar(req.body);
  res.redirect('/');

});


router.post('/alunos/delete',function(req,res) {
  Aluno.apagar(req.body.Número);
  res.redirect('/');

});






module.exports = router;
