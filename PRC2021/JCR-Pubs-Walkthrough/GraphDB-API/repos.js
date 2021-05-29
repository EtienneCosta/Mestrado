var axios= require('axios')

axios.get('http://localhost:7200/rest/repositories')
    .then (dados => {
        repos=dados.data.map(r => {
            return ({
                id: r.id,
                title: r.title,
                uri: r.uri
            })
        })
    console.dir(repos)
    })
    .catch(e => console.log(e))