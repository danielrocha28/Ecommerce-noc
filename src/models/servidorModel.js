var database = require("../database/config.js")

function buscarServidorId(id) {
    var instrucaoSql = `SELECT * FROM servidor WHERE id = ${id}`;
    return database.executar(instrucaoSql);
}

function inserirServidor(nome, fk_empresa) {
    var instrucaoSql = `INSERT INTO servidor (nome, fk_empresa) VALUES ('${nome}', ${fk_empresa})`;

    return database.executar(instrucaoSql)
}

function listarPorEmpresa(fk_empresa) {
    var instrucaoSql = `SELECT * FROM servidor WHERE fk_empresa = ${fk_empresa};`;
    return database.executar(instrucaoSql);
}

function excluirDash(id) {
    var instrucaoSql = `DELETE FROM servidor WHERE id = ${id};`;
    return database.executar(instrucaoSql);
}

function aviso(nome, id) {
    var instrucaoSql = `
    SELECT
        e.nome_fantasia,
        s.nome AS servidor,
        c.valor AS cpu
    FROM empresa e
    JOIN servidor s
        ON e.id = s.fk_empresa
    JOIN captura c
        ON s.id = c.fk_servidor
    WHERE c.nome = ${nome} and s.id = ${id}
    AND c.valor > 90;`
    return database.executar(instrucaoSql);
}

function buscarDashComEmpresa(id) {
     var instrucaoSql = `SELECT s.id, e.nome_fantasia
     FROM servidor s
     JOIN empresa e on e.id = s.fk_empresa 
     WHERE s.id = ${id}`;

     return database.executar(instrucaoSql)
}


module.exports = {buscarServidorId, inserirServidor, listarPorEmpresa, excluirDash, buscarDashComEmpresa}