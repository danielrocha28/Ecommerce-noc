var database = require("../database/config")

function buscarUltimasCapturas(fk_servidor, limite_linhas, nome) {
    var instrucaoSql = `
        SELECT nome, valor, horario 
        FROM captura 
        WHERE fk_servidor = ${fk_servidor} and nome = ${nome} 
        ORDER BY id DESC 
        LIMIT ${limite_linhas};

        
    `;
// a view é =
//      SELECT nome, valor, horario
//      FROM vwCapturas
//      WHERE fk_servidor = ${fk_servidor} and nome = ${nome} 
//      ORDER BY captura_id DESC
//      LIMIT ${limite_linhas};
    return database.executar(instrucaoSql);
}

function buscarTempoReal(fk_servidor, nome, limite_linhas) {
    var instrucaoSql = `
        SELECT valor, horario 
        FROM captura 
        WHERE fk_servidor = ${fk_servidor} AND nome = '${nome}'
        ORDER BY id DESC 
        LIMIT ${limite_linhas};
    `;
    
    // a view é =
//      SELECT valor, horario
//      FROM vwCapturas
//      WHERE fk_servidor = ${fk_servidor} and nome = ${nome} 
//      ORDER BY captura_id DESC
//      LIMIT ${limite_linhas};
    return database.executar(instrucaoSql);
}

function inserirCaptura(nome, valor, fk_dashboard, fk_servidor) {

    var instrucaoSql = `INSERT INTO captura
    (nome, valor, , fk_dashboard, fk_servidor) 
    VALUES
    ('${nome}', ${valor}, ${fk_dashboard}, ${fk_servidor})`;
    
    return database.executar(instrucaoSql);
}

module.exports = {buscarTempoReal, buscarUltimasCapturas, inserirCaptura}