var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
        SELECT id, nome, email, fk_empresa as empresaId, cargo FROM usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, email, senha, cargo, fk_empresa) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha, fk_empresa);
    
    var instrucaoSql = `
        INSERT INTO usuario (nome, email, senha, cargo, fk_empresa) VALUES ('${nome}', '${email}', '${senha}', '${cargo}', '${fk_empresa}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function remover(nome, email, cargo,  fk_empresa) {
    var instrucaoSql = `
        delete from usuario
        where id = (
            select idUsuario
            from (
                select id as idUsuario
                from usuario
                where nome = '${nome}'
                and email = '${email}'
                and fk_empresa = ${fk_empresa}
                limit 1
            ) as subconsulta)
        and fk_empresa = ${fk_empresa};`

        return database.executar(instrucaoSql)
}

function atualizar(nome, email, nova_senha, cargo, fk_empresa) {
    var instrucaoSql = `
        update usuario
        set senha = '${nova_senha}'
        where id = (
            select idUsuario
            from (
                select id as idUsuario
                from usuario
                where nome = '${nome}'
                and email = '${email}'
                and cargo = '${cargo}'
                and fk_empresa = ${fk_empresa}
                limit 1
            ) as subconsulta)
        and fk_empresa = ${fk_empresa};`

        return database.executar(instrucaoSql)
}


function listar() {
  var instrucaoSql = `SELECT id, nome, email, cargo, fk_empresa FROM usuario`;

  return database.executar(instrucaoSql);
}


module.exports = {
    autenticar,
    cadastrar,
    remover,
    atualizar,
    listar
};