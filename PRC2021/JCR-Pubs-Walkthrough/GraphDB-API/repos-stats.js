var axios= require('axios')

axios.get('http://localhost:7200/rest/repositories/ufc/size')
    .then (dados => {
    console.dir(dados.data)
    })
    .catch(e => console.log(e))