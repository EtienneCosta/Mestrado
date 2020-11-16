var http = require('http')
var axios = require('axios')

http.createServer(function (req, res) {
    console.log(req.method + ' ' + req.url)
    if (req.method == 'GET') {
        if (req.url == '/') {
            res.writeHead(200, { 'Content-Type': 'text/html;charset=utf-8' })

            res.write('<head>');
            res.write('<title>Escola de Música 🎶</title>');
            res.write('</head>');

            res.write(' <body style="background-color: blanchedalmond; font-family: Arial Black;">')

            res.write('<h2 style=" text-align:center;font-family:Arial Black; font-size:40px"> Escola de Música</h2>')
            res.write('<ul>')
            res.write('<li><a href="/alunos">Lista de alunos</a></li>')
            res.write('<li><a href="/cursos">Lista de Cursos</a></li>')
            res.write('<li><a href="/instrumentos">Lista de instrumentos</a></li>')
            res.write('</ul>')
            res.write('</body>');

            res.end()
        }

        else if (req.url == '/alunos') {
            axios.get('http://localhost:3000/alunos?_sort=id')
                .then(function (resp) {
                    alunos = resp.data;
                    res.writeHead(200, { 'Content-Type': 'text/html;charset=utf-8' })


                    res.write('<head>');
                    res.write('<title>Escola de Música: Alunos </title>');
                    res.write('</head>');

                    res.write(' <body style="background-color: blanchedalmond; font-family: Arial ;">')

                    res.write('<h2 style=" text-align:center;font-family:Arial Black; font-size:40px">  Lista de Alunos</h2>')

                    res.write('<ul>')

                    alunos.forEach(a => {
                        res.write(`<li> <a href="http://localhost:3001/alunos/${a.id}"> ${a.id}  -   ${a.nome} </a> </li>`)

                    });

                    res.write('</ul>')
                    res.write('<address>[<a href="http://localhost:3001">Voltar ao índice </a>]</address>');

                    res.write('</body>');

                    res.end()
                })
                .catch(function (error) {
                    console.log('Erro na obtenção da lista de alunos: ' + error);
                });
        }





        else if (req.url == '/cursos') {
            axios.get('http://localhost:3000/cursos?_sort=id')
                .then(function (resp) {
                    cursos = resp.data;
                    res.writeHead(200, { 'Content-Type': 'text/html;charset=utf-8' })


                    res.write('<head>');
                    res.write('<title>Escola de Música: Cursos </title>');
                    res.write('</head>');

                    res.write(' <body style="background-color: blanchedalmond; font-family: Arial ;">')

                    res.write('<h2 style=" text-align:center;font-family:Arial Black; font-size:40px">  Lista de Cursos</h2>')

                    res.write('<ul>')

                    cursos.forEach(c => {
                        res.write(`<li> <a href="http://localhost:3001/cursos/${c.id}"> ${c.id}  -   ${c.designacao} </a> </li>`)

                    });

                    res.write('</ul>')
                    res.write('<address>[<a href="http://localhost:3001">Voltar ao índice </a>]</address>');

                    res.write('</body>');

                    res.end()
                })
                .catch(function (error) {
                    console.log('Erro na obtenção da lista de cursos ' + error);
                });
        }



        else if (req.url == '/instrumentos') {
            axios.get('http://localhost:3000/instrumentos')
                .then(function (resp) {
                    instrumentos = resp.data;
                    res.writeHead(200, { 'Content-Type': 'text/html;charset=utf-8' })


                    res.write('<head>');
                    res.write('<title>Escola de Música: Instrumentos </title>');
                    res.write('</head>');

                    res.write(' <body style="background-color: blanchedalmond; font-family: Arial ;">')

                    res.write('<h2 style=" text-align:center;font-family:Arial Black; font-size:40px">  Lista de Instrumentos </h2>')

                    res.write('<ul>')

                    instrumentos.forEach(i => {
                        res.write(`<li> <a href="http://localhost:3001/instrumentos/${i.id}"> ${i.id} - ${i.text}  </a> </li>`)

                    });

                    res.write('</ul>')
                    res.write('<address>[<a href="http://localhost:3001">Voltar ao índice </a>]</address>');

                    res.write('</body>');

                    res.end()
                })
                .catch(function (error) {
                    console.log('Erro na obtenção da lista de instrumentos ' + error);
                });
        }



        else if (req.url.match(/\/alunos\/A(E\-)?[0-9]+/)) {
            var sp = req.url.split("/");
            axios.get('http://localhost:3000/alunos?q=' + sp[2])
                .then(resp => {
                    res.writeHead(200, {
                        'Content-Type': 'text/html; charset=utf-8'
                    })

                    res.write('<head>');
                    res.write('<title>Aluno: ' + sp[2] + '</title>');






                    res.write('</head>');

                    res.write(' <body style="background-color: blanchedalmond; font-family: Arial ;">')

                    alunos = resp.data;
                    res.write('<ul>')
                    alunos.forEach(a => {

                        res.write(`<h2 style=" text-align:center;font-family:Arial Black; font-size:40px"> ${a.nome} </h2>`)

                        res.write(`<li>ID: ${a.id} </li>`);
                        res.write(`<li>NOME: ${a.nome} </li>`);
                        res.write(`<li>DATA DE NASCIMENTO: ${a.dataNasc} </li>`);
                        res.write(`<li>CURSO: ${a.curso} </li>`);
                        res.write(`<li>INSTRUMENTO: ${a.instrumento} </li>`);

                    });
                    res.write('</ul>')
                    res.write('<address>[<a href="http://localhost:3001/alunos">Voltar a Lista de Alunos</a>]</address>');
                    res.write('</body>')
                    res.end();
                })
                .catch(error => {
                    console.log('ERRO: ' + error);
                    res.writeHead(200, {
                        'Content-Type': 'text/html; charset=utf-8'
                    })
                    res.write('<p>Erro a tentar aceder a informação do aluno: ' + sp[2] + '</p> ');
                    res.end()
                });
        }



        else if (req.url.match(/\/cursos\/C[BS][0-9]+/)) {
            var sp = req.url.split("/");

            axios.get('http://localhost:3000/cursos?id=' + sp[2])
                .then(resp => {
                    res.writeHead(200, {
                        'Content-Type': 'text/html; charset=utf-8'
                    })

                    res.write('<head>');
                    res.write('<title>Curso: ' + sp[2] + '</title>');
                    res.write('</head>');

                    res.write(' <body style="background-color: blanchedalmond; font-family: Arial ;">')

                    cursos = resp.data;


                    
                    res.write('<ul>')
                    cursos.forEach(c => {

                        res.write(`<h2 style=" text-align:center;font-family:Arial Black; font-size:40px"> ${c.designacao} </h2>`)

                        res.write(`<li>ID: ${c.id} </li>`);
                        res.write(`<li>DESIGNAÇÃO: ${c.designacao} </li>`);
                        res.write(`<li>DURAÇÃO: ${c.duracao} </li>`);
                        res.write(`<li>INSTRUMENTO ${c.instrumento.text} </li>`);

                    });
                    res.write('</ul>')
                    res.write('<address>[<a href="http://localhost:3001/cursos">Voltar a Lista de Cursos</a>]</address>');
                    res.write('<script src="myScript.js"></script>');

                    res.write('</body>')
                    res.end();
                })
                .catch(error => {
                    console.log('ERRO: ' + error);
                    res.writeHead(200, {
                        'Content-Type': 'text/html; charset=utf-8'
                    })
                    res.write('<p>Erro a tentar aceder a informação do curso: ' + sp[2] + '</p> ');
                    res.end()
                });
        }



        else if (req.url.match(/\/instrumentos\/I[0-9]+/)) {
            var sp = req.url.split("/");

            axios.get('http://localhost:3000/instrumentos?id=' + sp[2])
                .then(resp => {
                    res.writeHead(200, {
                        'Content-Type': 'text/html; charset=utf-8'
                    })

                    res.write('<head>');
                    res.write('<title>Instrumento: ' + sp[2] + '</title>');
                    res.write('</head>');

                    res.write(' <body style="background-color: blanchedalmond; font-family: Arial ;">')

                    instrumentos = resp.data;
                    res.write('<ul>')
                    instrumentos.forEach(i => {

                        res.write(`<h2 style=" text-align:center;font-family:Arial Black; font-size:40px"> ${i.text} </h2>`)

                        res.write(`<li>ID: ${i.id} </li>`);
                        res.write(`<li>INSTRUMENTO: ${i.text} </li>`);

                    });
                    res.write('</ul>')
                    res.write('<address>[<a href="http://localhost:3001/instrumentos">Voltar a Lista de Instrumentos</a>]</address>');

                     
                    res.write('</body>')
                    res.end();
                })
                .catch(error => {
                    console.log('ERRO: ' + error);
                    res.writeHead(200, {
                        'Content-Type': 'text/html; charset=utf-8'
                    })
                    res.write('<p>Erro a tentar aceder a informação do instrumento: ' + sp[2] + '</p> ');
                    res.end()
                });
        }


        else {
            res.writeHead(200, { 'Content-Type': 'text/html' })
            res.write("<p>Pedido não suportado: " + req.method + " " + req.url + "</p>")
            res.end()
        }
    }
    else {
        res.writeHead(200, { 'Content-Type': 'text/html' })
        res.write("<p>Pedido não suportado: " + req.method + " " + req.url + "</p>")
        res.end()
    }

}).listen(3001)

console.log('Servidor à  escuta na porta 3001...');
console.log('http://localhost:3001');