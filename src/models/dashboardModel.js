var database = require("../database/config.js")

function inserirDash(fk_empresa) {
    var instrucaoSql = `INSERT INTO dashboard (fk_empresa) VALUES (${fk_empresa})`;

    return database.executar(instrucaoSql)
}

function buscarDashId(id) {
    var instrucaoSql = `SELECT * FROM dashboard WHERE id = ${id}`;
    return database.executar(instrucaoSql);
}

function listarPorEmpresa(fk_empresa) {
    var instrucaoSql = `SELECT * FROM dashboard WHERE fk_empresa = ${fk_empresa};`;
    return database.executar(instrucaoSql);
}



module.exports = {inserirDash, buscarDashId, listarPorEmpresa};