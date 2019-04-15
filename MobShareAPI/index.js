const app = require("express")();
const http = require("http").createServer(app);

const bodyParser = require("body-parser");

const mysql = require("mysql");

app.use(bodyParser.json());

app.use(bodyParser.urlencoded({
    extended: true
}))

function executarSQL(sql, res){
    const con = mysql.createConnection({
        host: "127.0.0.1",
        user: "root",
        password: "bcd127",
        database: "mob_share"
    });

    con.query(sql, function (erro, result, field){
        if(erro){
            res.send(erro);
            console.log(sql);
        }
        else{
            res.send(JSON.stringify(result));
            console.log(result);
        }
    });
}
//Teste
app.get("/", (req, res) => {
    console.log("teste");
})
//Teste
app.get("/anuncios", (req, res) => {
    var sql = "SELECT * FROM view_anuncios";
    executarSQL(sql, res);
})

//pegando conexao na porta 5001
http.listen(5001, () => {
    console.log("Servidor rodando na porta 5001")
})








