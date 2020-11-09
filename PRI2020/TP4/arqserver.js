/* Inclusão de um módulo */

var http = require ('http');
var fs   = require ('fs');
var url  = require ('url');


http.createServer(function(req,res){ // Cria o servidor


    if(req.url.match(/\/[0-9 *]+$/)){
        var id = req.url.split("/")[2];

        console.log('Identificador do HTML:'+id);

        if(id=='*')
            id='index'
        else
           id='arq'+id;

    fs.readFile('arqsite/'+id+'.html',function(err,data){

        if(err){

            console.log('Erro na leitura do ficheiro: ' + err);
            res.writeHead(200,{'Content-Type': 'text/html'});
            res.write("<p> Ficheiro inexistente. </p>");
            res.end();

        }
    
        else {

            res.writeHead(200,{'Content-Type': 'text/html'});
            res.write(data);
            res.end();


        }
    })

    }



    else{

        console.log('Erro: Foi pedido um ficheiro não esperado')
            res.writeHead(200,{'Content-Type': 'text/html'})
            res.write("<p> Ficheiro inexistente. </p>")
            res.end()


    }




}).listen(7777);


console.log('Servidor à escuta na porta 7777....');