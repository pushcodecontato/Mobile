const app = require("express")();
const http = require("http").createServer(app);
var fs = require("fs");
var uniqid = require("uniqid");
const bodyParser = require("body-parser");

const mysql = require("mysql");

app.use(bodyParser.json({limit : "50mb"}));

var sql = "";

app.use(bodyParser.urlencoded({
    extended: true,
	limit : "50mb"
}))
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
app.post("/anuncios", (req, res) => {
    
    let id_tipo_veiculo = parseInt(req.body[0]);
    let id_tipo_marca = parseInt(req.body[1]);
    let id_modelo = parseInt(req.body[2]);
    let sql =" SELECT * FROM view_anuncios ";
    let wheres = []; 
    
    if(id_tipo_veiculo > 0 )wheres.push(`id_tipo_veiculo = ${id_tipo_veiculo}`);

    if( id_tipo_marca > 0) wheres.push(`id_tipo_marca = ${id_tipo_marca}`);

    if(id_modelo > 0) wheres.push(`id_modelo = ${id_modelo}`);
    
    if(wheres.length >=1) sql += ' WHERE '+ wheres.join(' AND ');

    console.log(sql);
    

    mysqlConnection.query(sql, function (erro, result, field){
        if(erro){
            res.send(erro);
            console.log("Erro: " + sql);
        }
        else{
            res.send(result);       
        } 
    });
})
//Listar anuncio por id
app.get("/anuncios/:id", (req, res) => {
	let id = parseInt(req.params.id);
    sql = "SELECT * FROM view_anuncios where id_anuncio = " + id;
    
	mysqlConnection.query(sql, function (erro, result, field){
        if(erro){
            res.send(erro);
            console.log("Erro: " + sql);
        }
        else{
            res.send(result);     
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
	const img_cliente64 = req.body.foto_cliente;

    var dia = dt_nascimento.split('/')[0];
    var mes = dt_nascimento.split('/')[1];
    var ano = dt_nascimento.split('/')[2];

    var dt_nasc = ano + "-" + mes + "-" + dia
	
	var imagemBinary = new Buffer(img_cliente64, 'base64');
	var imgCliente = "img/" + uniqid() + ".jpg";
	

    //Primeira consulta para verificar se o email existe
    sql = `SELECT count(*) as linhas FROM tbl_cliente WHERE email ="${email_cliente}"`;
    let rows = await new Promise((resolve, reject) => {    
        mysqlConnection.query(sql, function (erro, result, field){
            resolve(result);
        });

    })
    
    let num_rows = rows[0];
    if(num_rows.linhas >= 1)
        res.send({"sucesso"  : false, "mensagem" : "Este email já foi cadastrado! ", "aviso" : "Insira um email válido"});
    else{
        if(senha != conf_senha){
            res.send({"sucesso" : false, "mensagem" : "As senhas inseridas precisam ser iguais!"});
        }else{
            sql = `INSERT INTO tbl_cliente (foto_cliente, nome_cliente, email, dt_nascimento, senha) VALUES ("${imgCliente}", "${nome}", "${email_cliente}", "${dt_nasc}", "${senha}")`;
            mysqlConnection.query(sql, function (erro, result, field){
                if(!erro){				
					res.send({"sucesso": true, 
						"mensagem" : "Cliente inserido com sucesso",
                        "aviso" : "Termine seu cadastro em nosso site da Mob'Share para anunciar!"});
                        salvarImagem(img_cliente64);
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
	
	sql = `SELECT * FROM tbl_cliente WHERE email = "${email}" AND senha = "${senha}"`;
	
    mysqlConnection.query(sql, function(erro, result){
        if(erro){
            console.log(erro);
        }
        else{
            if(result.length > 0){
                res.send(result);
            }
            else{
                res.send({"sucesso" : false, "mensagem" : "Email ou senha incorreto."});
            }
        }
    });
})
app.get("/tipoVeiculo", (req,res) => {
	sql = "SELECT * FROM tbl_tipo_veiculo";
	
	let result_res = [];
	result_res.push({"id_tipo_veiculo":0,"nome_tipo_veiculo":"Selecione","excluido":0})
	mysqlConnection.query(sql, function (erro, result, field){
        if(erro){
            res.send(erro);
            console.log("erro: " + sql);
        }
        else{
			result.filter(tipoVeiculo=>{
				result_res.push(tipoVeiculo);
			})
            res.send(result_res);          
        } 
    });
});
app.get("/tipoVeiculo/marca/:id_tipoVeiculo", (req, res) => {
		let id_tipoVeiculo = parseInt(req.params.id_tipoVeiculo);
		let result_res = [];
		
		result_res.push({"id_marca_veiculo":0,"nome_marca":"Selecione","status":1});
		if(id_tipoVeiculo >=1){
			sql = `SELECT id_marca_veiculo, nome_marca FROM view_tipo_marca where id_tipo_veiculo = "${id_tipoVeiculo}"`;
		}else{
			sql = `SELECT id_marca_veiculo, nome_marca FROM tbl_marca_veiculo`;
		}
		
	
	mysqlConnection.query(sql, function (erro, result, field){
        if(erro){
            res.send(erro);
            console.log("erro: " + sql);
        }
        else{
			result.filter(marcaVeiculo => {
				result_res.push(marcaVeiculo);
			});
            res.send(result_res);       
        } 
    });
});

app.get("/tipoVeiculo/marca/modelo/:id_tipo_marca", (req, res) => {
    let id_tipo_marca = parseInt(req.params.id_tipo_marca);
    let result_res = [];
    result_res.push({"id_modelo":0,"nome_modelo":"Selecione","status":1});

    if(id_tipo_marca >=1){
        sql = `SELECT * FROM tbl_modelo_veiculo as modelo where id_marca_tipo = "${id_tipo_marca}"`;
    }else{
        sql = `SELECT * FROM tbl_modelo_veiculo as modelo`;
    }
    mysqlConnection.query(sql, function (erro, result, field){
        if(erro){
            res.send(erro);
            console.log("erro: " + sql);
        }
        else{
            result.filter(modeloVeiculo => {
				result_res.push(modeloVeiculo);
			});
            res.send(result_res);          
        } 
    });
});
app.get("/getVeiculos/:idCliente", (req, res) => {
    let idCliente = parseInt(req.params.idCliente);
    sql = `SELECT * FROM view_meus_veiculo WHERE id_cliente = ${idCliente}`;

    mysqlConnection.query(sql, function(erro, result, field){
        if(erro){
            res.send(erro);
            console.log("Erro: " + sql);
        }else{
            res.send(result);
            console.log(sql);
            console.log(result);
        }
    });
});
function salvarImagem(img_cliente64){
    var imagemBinary = new Buffer(img_cliente64, 'base64');
    var imgCliente = "img/" + uniqid() + ".jpg";

	fs.appendFile(imgCliente, imagemBinary , function(erro){
		if(erro) throw erro
			console.log("ERRO AO CARREGAR IMAGEM: " + erro);
    });

}
//pegando conexao na porta 5001
http.listen(5001, () => {
    console.log("Servidor rodando na porta 5001")
})