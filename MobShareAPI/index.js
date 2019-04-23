const app = require("express")();
const http = require("http").createServer(app);
var session = require('express-session');
const bodyParser = require("body-parser");

const mysql = require("mysql");

app.use(bodyParser.json());

app.use(bodyParser.urlencoded({
    extended: true
}))
app.use(session({
    secret : 'secret',
    resave : true,
    saveUninitialized : true
}));

const mysqlConnection = mysql.createConnection({
    host: "127.0.0.1",
    user: "root",
    password: "bcd127",
    database: "mob_share"
});

mysqlConnection.connect((erro)=>{
    if(!erro)
    console.log("Banco conectado com sucesso");
    else
    console.log("Erro de conexão" + erro);
});

app.get("/", (req, res) => {
    res.send("Bem Vindo a API da Mob'Share!")
})
//Listar todos os anuncios
app.get("/anuncios", (req, res) => {
    const sql = "SELECT * FROM view_anuncios";

    mysqlConnection.query(sql, function (erro, result, field){
        if(erro){
            res.send(erro);
            console.log("Erro: " + sql);
        }
        else{
            res.send(result);
            console.log(result);            
        } 
    });
})
//Listar anuncio por id
app.get("/anuncios/:id", (req, res) => {
	let id = parseInt(req.params.id);
    const sql = "SELECT * FROM view_anuncios where id_anuncio = " + id;
    
	mysqlConnection.query(sql, function (erro, result, field){
        if(erro){
            res.send(erro);
            console.log("Erro: " + sql);
        }
        else{
            res.send(result);
            console.log(result);            
        } 
    });
})

//Registrar um novo cliente
app.post("/register",async (req, res) => {

    const nome = req.body.nome_cliente;
    const email_cliente = req.body.email_cliente;
    const dt_nascimento = req.body.dtNascimento;
    const senha = req.body.senha;
    const conf_senha = req.body.conf_senha;

    var dia = dt_nascimento.split('/')[0];
    var mes = dt_nascimento.split('/')[1];
    var ano = dt_nascimento.split('/')[2];

    var dt_nasc = ano + "-" + mes + "-" + dia

    //Primeira consulta para verificar se o email existe
    var sql = `SELECT count(*) as linhas FROM tbl_cliente WHERE email ="${email_cliente}"`;
    let rows = await new Promise((resolve, reject) => {    
        mysqlConnection.query(sql, function (erro, result, field){
            resolve(result);
        });

    })
    console.log(nome + "/n" + email_cliente + "/n" + senha + "/n" + conf_senha + " " + dt_nasc);
    let num_rows = rows[0];
    if(num_rows.linhas >= 1)
        res.send({"sucesso"  : false, "mensagem" : "Este email já foi cadastrado! ", "aviso" : "Insira um email válido"});
    else{
        if(senha != conf_senha){
            res.send({"sucesso" : false, "mensagem" : "As senhas inseridas precisam ser iguais!"});
        }else{
            sql = `INSERT INTO tbl_cliente (nome_cliente, email, dt_nascimento, senha) VALUES ("${nome}", "${email_cliente}", "${dt_nasc}", "${senha}")`;
            mysqlConnection.query(sql, function (erro, result, field){
                if(!erro){
                    res.send({"sucesso": true, 
                            "mensagem" : "Cliente inserido com sucesso",
                            "aviso" : "Termine seu cadastro em nosso site da Mob'Share para anunciar!"});
                            
                }else{
                    res.send({"erro": erro}); 
                    console.log(erro);
                }
            });
        }
    }
        
});
app.post("/login", (req, res) => {
    
    const email = req.body.email_cliente;
    const senha = req.body.senha;
    const sql = `SELECT email, senha FROM tbl_cliente WHERE email = "${email}" AND senha = "${senha}"`;
    mysqlConnection.query(sql, function(erro, result){
        if(erro){
            console.log(erro);
        }
        else{
            if(result.length > 0){
                res.send({"sucesso" : true, "mensagem" : "Login efetuado com sucesso."});
            }
            else{
                res.send({"sucesso" : false, "mensagem" : "Email ou senha incorreto."});
            }
        }
    });
})
app.get("/cliente", (req, res) => {
    const sql = "SELECT * FROM tbl_cliente";

    mysqlConnection.query(sql, function (erro, result, field){
        if(erro){
            res.send(erro);
            console.log("erro: " + sql);
        }
        else{
            res.send(result);
            console.log(result);            
        } 
    });
});


//pegando conexao na porta 5001
http.listen(5001, () => {
    console.log("Servidor rodando na porta 5001")
})