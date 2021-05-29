var express = require('express');
var router = express.Router();
var axios = require('axios');
var gdb = require('../utils/graphdb');

/* GET cidades. */
router.get('/cidades',async function(req,res) {
var query = `  
select ?s ?Nome ?Distrito where {    
  ?s a :cidade ;
       :nome ?Nome;
       :distrito ?Distrito . 
}
order by ?Nome 
`
var result = await gdb.execQuery(query);
result = result.results.bindings.map(c => {
  return{
    ID : c.s.value.split('#')[1],
    Nome : c.Nome.value,
    Distrito : c.Distrito.value
  }
});
res.jsonp(result);

});

/* GET cidade. */
router.get('/cidades/:id',async function(req,res) {
  var query = `  
  select ?Nome ?Distrito ?População ?Descrição  where {
    :${req.params.id}  :nome ?Nome ;
         :distrito ?Distrito;
         :população ?População;
         :descrição ?Descrição. 
}
  `

  var query2 = `
  select ?cidade ?Nome ?Distância where {
    ?s a :ligação ;
       :temOrigem :c1;
       :temDestino ?cidade;
       :distância ?Distância.
    ?cidade :nome ?Nome .
    
}`

  var result = await gdb.execQuery(query);
  var ligações = await gdb.execQuery(query2);

  ligações = ligações.results.bindings.map(l => {
    return {
      ID : l.cidade.value.split('#')[1],
      Nome : l.Nome.value,
      Distância : l.Distância.value
    }
  })
  result = result.results.bindings.map(c => {
    return{
      ID : req.params.id,
      Nome : c.Nome.value,
      Distrito : c.Distrito.value,
      População : c.População.value,
      Descrição : c.Descrição.value,
      Ligações : [ligações]
    }
  });
  res.jsonp(result[0]);
  });




/* POST cidade. */
router.post('/cidades/',async function(req,res) {
  var query = `  
  INSERT DATA {
    :${req.body.id} rdf:type owl:NamedIndividual, :cidade;
       :nome  "${req.body.nome}" ;
       :distrito  "${req.body.distrito}" ;
       :população  "${req.body.população}" ;
       :descrição  "${req.body.descrição}" .
  }
  `
  await gdb.execTransaction(query);
  res.jsonp({Log:"Triplos inseridos com sucesso "});
  });


/* DELETE cidade. */
router.delete('/cidades/:id',async function(req,res) {
  var cidade = await axios.get('http://localhost:8000/cidades/'+req.params.id);
  var query = `  
  DELETE DATA {
    :${req.params.id}  :nome  "${cidade.data.nome}" ;
       :distrito  "${cidade.data.distrito}" ;
       :população  "${cidade.data.população}" ;
       :descrição  "${cidade.data.descrição}" .
  }
  `
  await gdb.execTransaction(query);
  res.jsonp({Log:"Triplos removidos com sucesso ",Data:cidade.data});
  });

module.exports = router;