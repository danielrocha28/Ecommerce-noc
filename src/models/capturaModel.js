var database = require("../database/config")

function buscarUltimasCapturas(fk_servidor, limite_linhas) {
    var instrucaoSql = `
        SELECT nome, valor, tipo, horario 
        FROM captura 
        WHERE fk_servidor = ${fk_servidor} 
        ORDER BY id DESC 
        LIMIT ${limite_linhas};
    `;
    
    return database.executar(instrucaoSql);
}

function buscarTempoReal(fk_servidor, tipo) {
    var instrucaoSql = `
        SELECT valor, horario 
        FROM captura 
        WHERE fk_servidor = ${fk_servidor} AND tipo = '${tipo}'
        ORDER BY id DESC 
        LIMIT 1;
    `;
    
    return database.executar(instrucaoSql);
}

function inserirCaptura(nome, valor, tipo, fk_dashboard, fk_servidor) {

    var instrucaoSql = `INSERT INTO captura
    (nome, valor, tipo, fk_dashboard, fk_servidor) 
    VALUES
    ('${nome}', ${valor}, '${tipo}', ${fk_dashboard}, ${fk_servidor})`;
    
    return database.executar(instrucaoSql);
}

module.exports = {buscarTempoReal, buscarUltimasCapturas, inserirCaptura}