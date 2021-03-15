var express = require('express');
var router = express.Router();
var axios = require('axios')

var prefixes = `
    PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
    PREFIX owl: <http://www.w3.org/2002/07/owl#>
    PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
    PREFIX noInferences: <http://www.ontotext.com/explicit>
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
    PREFIX adv: <http://www.di.uminho.pt/prc2021/charada#>
    `

/* GET home page. */
router.get('/', function(req, res, next) {
  axios.get("http://localhost:7200/rest/repositories")
    .then(dados=>{
      res.render('index', { repos: dados.data });

    })
    .catch(erro => console.log(erro))
  
});


/* GET all classes from  repo. */
router.get('/repositorio/:id', function(req, res, next) {
  const id = req.params.id
  var query = `select * where { 
              ?s ?p owl:Class
            }`
  var getLink = "http://localhost:7200/repositories/"+id+"?query=" 
  var encoded = encodeURIComponent(prefixes + query)
 
  axios.get(getLink + encoded)
    .then(dados =>{
        var c = dados.data.results.bindings.map(bind => bind.s.value)
        res.render('classes', { classes: c,repo:id });

    })
    .catch(erro => console.log(erro))
  
});


/* GET all individuals from  class. */
router.get(/\/repositorio\/[A-Za-z \-0-9]+\/[A-Za-z ]+$/, function(req, res, next) {
  const id = req.url.split("/")[3]
  const classname = req.url.split("/")[2]
  var query = `select ?s where { ?s rdf:type adv:${id} }`
  var getLink = "http://localhost:7200/repositories/"+classname+"?query=" 
  var encoded = encodeURIComponent(prefixes + query)
  
  axios.get(getLink + encoded)
    .then(dados =>{
        var i = dados.data.results.bindings.map(bind => bind.s.value)
        res.render('individuals', { individuals: i ,repo:classname});

    })
    .catch(erro => console.log(erro))
  
});

/* GET the info of individual . */
router.get(/\/repositorio\/[A-Za-z \-0-9]+\/individuo\/A[0-9]+$/, function(req, res, next) {
  const individuo = req.url.split("/")[4]
  const classname = req.url.split("/")[2]
  var query = `select * where { adv:${individuo} ?p ?o }`
  var getLink = "http://localhost:7200/repositories/"+classname+"?query=" 
  var encoded = encodeURIComponent(prefixes + query)
  
  axios.get(getLink + encoded)
    .then(dados =>{

        var props = dados.data.results.bindings.map(bind => {return {
          p: bind.p.value.split('#')[1],
          o: (bind.o.type == 'literal') ? bind.o.value : bind.o.value.split('#')[1]
        }})
        console.dir(props)

        res.render('individual', { individual: props ,repo:classname,});

    })
    .catch(erro => console.log(erro))
  
});


module.exports = router;