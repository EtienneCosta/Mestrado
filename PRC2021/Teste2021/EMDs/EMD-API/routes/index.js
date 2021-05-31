var express = require('express');
var router = express.Router();
var axios = require('axios');
var gdb = require('../utils/graphdb');

/* GET /api/emd - Devolve a lista de EMD apenas com os campos "id", "nome", "data" e "resultado" */
router.get('/api/emd',async function(req,res) {

if(req.query.res=="OK"){
  var query = `  
  select ?id ?nome ?data ?resultado where {
    ?id a :EMD;
       :resultado  ?resultado;  
       :dataEMD ?data .
   ?s a :Atleta;
      :realizou ?id;
      :nome ?nome .
      
      filter (?resultado= "True"^^xsd:boolean)
  } 
  `
  var result = await gdb.execQuery(query);
  result = result.results.bindings.map(e => {
    return{
      id : e.id.value.split('#')[1],
      nome : e.nome.value,
      data : e.data.value,
      resultado : e.resultado.value
    }
  });
}


else{
var query = `  
select ?id ?nome ?data ?resultado where {
  ?id a :EMD;
     :resultado ?resultado;
     :dataEMD ?data .
 ?s a :Atleta;
    :realizou ?id;
    :nome ?nome .
} 
`
var result = await gdb.execQuery(query);
result = result.results.bindings.map(e => {
  return{
    id : e.id.value.split('#')[1],
    nome : e.nome.value,
    data : e.data.value,
    resultado : e.resultado.value
  }
  });
}
res.jsonp(result);

});


/*  GET /api/modalidades - Devolve a lista de modalidades, sem repetições; */
router.get('/api/modalidades',async function(req,res) {
  var query = `  
  select  ?Modalidade where {
    ?s a :Modalidade;
        :nome ?Modalidade .
  }
  `
  var result = await gdb.execQuery(query);
  result = result.results.bindings.map(m => {
    return{
      Nome : m.Modalidade.value
    }
  });
  res.jsonp(result);
  
  });


/*GET /api/atletas?gen=F - Devolve uma lista ordenada alfabeticamente com os nomes dos atletas de género feminino; */
router.get('/api/atletas',async function(req,res) {

if (req.query.gen){
  var query = `  
  select   ?nome where {
      ?s a :Atleta;
           :nome ?nome;
           :género ?género.
      filter (?género="${req.query.gen}")
  }
  order by ?nome 
    `
    var result = await gdb.execQuery(query);
    result = result.results.bindings.map(e => {
      return{
        nome : e.nome.value
      }
    });
    
  }

  else if (req.query.clube){

    var query = `  
    select  ?nome where {
      ?s a :Atleta;
           :nome ?nome;
           :pertence ?clube.
      ?clube :nome ?c
      filter (?c="${req.query.clube}")
  }
  order by ?nome 
    `
    var result = await gdb.execQuery(query);
    result = result.results.bindings.map(e => {
      return{
        nome : e.nome.value
      }
    });

  }
    res.jsonp(result);
});


/*GET /api/modalidades/:id - Devolve a lista de EMD referentes à modalidade passada como parâmetro;  */
router.get('/api/modalidades/:id',async function(req,res) {
  var query = `  
  select ?id ?nome ?data ?resultado where {
    ?id a :EMD;
       :resultado  ?resultado;  
       :dataEMD ?data .
   ?s a :Atleta;
      :realizou ?id;
      :pratica :${req.params.id};
      :nome ?nome .
  } 
  `
  var result = await gdb.execQuery(query);
  result = result.results.bindings.map(e => {
    return{
      id : e.id.value.split('#')[1],
      nome : e.nome.value,
      data : e.data.value,
      resultado : e.resultado.value,
      modalidade : req.params.id

    }
  });
  res.jsonp(result);  
});


/* GET /api/emd/:id - Devolve a informação completa de um EMD; */


router.get('/api/emd/:id',async function(req,res) {
  var query = `  
  select  ?nome ?data ?resultado ?Clube ?Modalidade where {
    :${req.params.id} a :EMD;
       :resultado ?resultado;
       :dataEMD ?data .
   ?s a :Atleta;
      :realizou :${req.params.id};
      :nome ?nome ;
      :pratica ?m;
      :pertence ?c.
     ?c :nome ?Clube.
     ?m :nome ?Modalidade .
  } 
  `
  var result = await gdb.execQuery(query);
  result = result.results.bindings.map(m => {
    return{
      Atleta : m.nome.value,
      Data : m.data.value,
      Resultado : m.resultado.value,
      Clube : m.Clube.value,
      Modalidade : m.Modalidade.value
    }
  });
  res.jsonp(result);
  
  });

module.exports = router;