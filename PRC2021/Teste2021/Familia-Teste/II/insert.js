let axios = require('axios')

let prefixes = `
prefix : <http://prc.di.uminho.pt/2021/myfamily#> 
prefix owl: <http://www.w3.org/2002/07/owl#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix xml: <http://www.w3.org/XML/1998/namespace> 
prefix xsd: <http://www.w3.org/2001/XMLSchema#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
base <http://prc.di.uminho.pt/2021/myfamily> 
`   
let querie1 = encodeURI(prefixes + `
    CONSTRUCT {
        ?p3 :bisavo ?bn .    
    } WHERE {
        ?bn :temProgenitor ?p1 .
        ?p1 :temProgenitor ?p2 .
        ?p2 :temProgenitor ?p3 .
    }`
)

axios.get('http://localhost:7200/repositories/Familia/statements?query=' + querie1)
        .then(res => {
            let querie2 = `INSERT DATA { ${res.data} }`
            axios.get('http://localhost:7200/repositories/Familia/statements?query=' + encodeURI(querie2))
              .then(e => console.log(e.data))
        })