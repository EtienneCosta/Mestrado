var express = require('express');
var router = express.Router();
var axios = require('axios')

var prefixes = `
PREFIX :    <http://www.di.uminho.pt/prc2021/publicacoes#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
`

/* 
  http://localhost:7777/pubs

  Devolve a lista de publicações com os seguintes campos :
      - id
      - type
      - title
      - year 
*/
router.get('/pubs', function (req, res, next) {
  if (!req.query.type) {
    var query = `select  ?s ?title  ?year ?type where {
                                  ?s a :Publication;
              	                  :title ?title ;
                                  :year  ?year;
                                  rdf:type ?type.
                          }
                                  order by asc (?year)
              `
    var getLink = 'http://epl.di.uminho.pt:8738/api/rdf4j/query/A76089-TP5?query='
    var encoded = encodeURIComponent(prefixes + query)
    axios.get(getLink + encoded)
      .then(dados => {
        var publications = dados.data.results.bindings.map(bind => {
          if (bind.type.value.split('#')[1] != "Publication" && bind.type.value.split('#')[1] != "NamedIndividual" && bind.type.value.split('#')[1] != "Resource")
            return ({
              id: bind.s.value.split('#')[1],
              type: bind.type.value.split('#')[1],
              title: bind.title.value,
              year: bind.year.value
            })
        });

        res.status(200).jsonp(publications.filter(x => x !== undefined));

      })
      .catch(error => {
        res.status(500).jsonp(error);
      })
  }


  else {

    /* 
        http://localhost:7777/pubs?type=Inproceedings

        Devolve a lista de publicações com os seguintes campos :
        - id
        - type
        - title
        - year 
    
    
    
    */

    var type = req.query.type
    var query = `select ?s ?title where {
      ?s a :${type};
      :title ?title . 
   }
  `
    var getLink = 'http://epl.di.uminho.pt:8738/api/rdf4j/query/A76089-TP5?query='
    var encoded = encodeURIComponent(prefixes + query)
    axios.get(getLink + encoded)
      .then(dados => {
        var publications = dados.data.results.bindings.map(bind => {

          return ({
            id: bind.s.value.split('#')[1],
            title: bind.title.value

          })
        });
        res.status(200).jsonp(publications);
      })

      .catch(error => {
        res.status(500).jsonp(error);
      })

  }

});


router.get('/pubs/:id', function (req, res, next) {

  var id = req.params.id
  console.log("ID:" + id)
  var query = `select * where {
              :${id} ?p ?o.
             } `
  var getLink = 'http://epl.di.uminho.pt:8738/api/rdf4j/query/A76089-TP5?query='
  var encoded = encodeURIComponent(prefixes + query)
  axios.get(getLink + encoded)
    .then(dados => {
      var publication = dados.data.results.bindings.map(bind => {

        return ({
          p: bind.p.value.split('#')[1],
          o: (bind.o.type == 'literal') ? bind.o.value : bind.o.value.split('#')[1]

        })

      });

      res.status(200).jsonp(publication);

    })
    .catch(error => {

      res.status(500).jsonp(error);

    })
})


router.get('/authors/', function (req, res, next) {
  var query = `select ?s ?name (count (?s1) as ?pubs) where { 
                            ?s a :Author;
                            :name ?name .
                            ?s1 :wrotedBy ?s.
                    }
                            group by ?s ?name
                            order by asc (?pubs)
              `

  var getLink = 'http://epl.di.uminho.pt:8738/api/rdf4j/query/A76089-TP5?query='
  var encoded = encodeURIComponent(prefixes + query)
  axios.get(getLink + encoded)
    .then(dados => {
      var authors = dados.data.results.bindings.map(bind => {

        return ({
          id: bind.s.value.split("#")[1],
          name: bind.name.value,
          total: bind.pubs.value
        })

      });
      res.status(200).jsonp(authors.filter(x => x !== undefined));

    })
    .catch(error => {

      res.status(500).jsonp(error);

    })
})


router.get('/authors/pubs/:id', function (req, res, next) {
  var id = req.params.id;
  var query = `select distinct  ?s ?title  ?year ?type where {
                        ?s a :Publication;
                        :title ?title ;
                        :year  ?year;
                        :wrotedBy :${id};
                        rdf:type ?type.
            }
        `
  var getLink = 'http://epl.di.uminho.pt:8738/api/rdf4j/query/A76089-TP5?query='
  var encoded = encodeURIComponent(prefixes + query)
  axios.get(getLink + encoded)
    .then(dados => {
      var authors = dados.data.results.bindings.map(bind => {
        if (bind.type.value.split('#')[1] != "Publication" && bind.type.value.split('#')[1] != "NamedIndividual" && bind.type.value.split('#')[1] != "Resource")
          return ({
            id: bind.s.value.split('#')[1],
            type: bind.type.value.split('#')[1],
            title: bind.title.value,
            year: bind.year.value
          })
      });
      res.status(200).jsonp(authors.filter(x => x!=undefined));

    })
    .catch(error => {
      res.status(500).jsonp(error);
    })
})

router.get('/author/:id', function (req, res, next) {

  var id = req.params.id
  console.log("ID:" + id)
  var query = `select distinct ?name  where {
                       :${id} ?p ?o;
                        :name ?name.
           }
    `
  var getLink = 'http://epl.di.uminho.pt:8738/api/rdf4j/query/A76089-TP5?query='
  var encoded = encodeURIComponent(prefixes + query)
  axios.get(getLink + encoded)
    .then(dados => {
      var author = dados.data.results.bindings.map(bind => {

        return ({
          name: bind.name.value
        })

      });

      res.status(200).jsonp(author[0]);

    })
    .catch(error => {

      res.status(500).jsonp(error);

    })
})

/* POST,UPDATE,DELETE ... :( */

module.exports = router;