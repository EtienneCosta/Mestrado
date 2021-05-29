var http = require('http')

http.createServer( (req,res)=>{
    res.writeHead(200,{'Content-Type':'text/plain;charset=utf-8'});
    res.end('Hello World !');
}).listen(7777);

console.log("Servidor à escuta na porta 7777")