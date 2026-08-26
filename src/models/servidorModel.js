var database = require("../database/config.js")

function buscarServidorId(id) {
    var instrucaoSql = `SELECT * FROM servidor WHERE id = ${id}`;
    return database.executar(instrucaoSql);
}

function inserirServidor(nome, fk_empresa) {
    var instrucaoSql = `INSERT INTO dashboard (nome, fk_empresa) VALUES ('${nome}', ${fk_empresa})`;

    return database.executar(instrucaoSql)
}

function listarPorEmpresa(fk_empresa) {
    var instrucaoSql = `SELECT * FROM servidor WHERE fk_empresa = ${fk_empresa};`;
    return database.executar(instrucaoSql);
}

function excluirDash(id) {
    var instrucaoSql = `DELETE FROM dashboard WHERE id = ${id};`;
    return database.executar(instrucaoSql);
}

function buscarDashComEmpresa(id) {
     var instrucaoSql = `SELECT d.id, e.nome_fantasia
     FROM dashboard d
     JOIN empresa e on e.fk_empresa = d.id 
     WHERE d.id = ${id}`;

     return database.executar(instrucaoSql)
}


module.exports = {buscarServidorId, inserirServidor, listarPorEmpresa, excluirDash, buscarDashComEmpresa}