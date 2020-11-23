const bp = require("body-parser");
const { urlencoded } = require("express");
const express = require("express");
const app = express();

var tasks = [];
var solved = [];
var canceled = [];


app.set("view engine", "ejs");
app.use(bp.urlencoded({extended:true}));


app.get("/", function (req, res) {

    var today = new Date();
    var currentDay = today.getDay();
    var day = "";

    switch (currentDay) {
        case 0:
            day = "Domingo";
            break;

        case 1:
            day = "Segunda-Feira";
            break;

        case 2:
            day = "Terça-Feira";
            break;

        case 3:
            day = "Quarta-Feira";
            break;

        case 4:
            day = "Quinta-Feira";
            break;

        case 5:
            day = "Sexta-Feira";
            break;

        case 6:
            day = "Sábado";
            break;

        default:
            console.log("Erro: dia da semana igual à : "+currentDay);
    }

    res.render("list", { kindofDay: day,tasksofDay : tasks });
});



app.post("/",function(req,res){

    var task = {description:req.body.description, person:req.body.person, data:req.body.data }; 
    tasks.push(task);

    console.log(tasks);
    res.redirect("/");
    
});


app.listen(7777, function () {

    console.log("Servidor à escuta na porta 7777....");
})