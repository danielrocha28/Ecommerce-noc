var database = require("../database/config.js")

function inserirDash(id) {
    var instrucaoSql = `INSERT INTO dashboard` 
}

function buscarDashId(id) {
    var instrucaoSql = `SELECT * FROM dashboard WHERE id = '${id}'`
    return database.executar(instrucaoSql);
}


module.exports(buscarDashId)