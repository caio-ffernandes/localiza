const mysql = require("mysql2")

class Database{

    #connection 

    constructor(){
        this.#connection = mysql.createPool({
            host: "localhost",
            user:"root",
            password:"",
            database:"localizar"
        }).promise()
    }
   
    async selecionarUsuario(){
       const usuariosData = await this.#connection.query("select * from usuarios;")
       return usuariosData[0]
    } 
    async insertUsuario(nome,email,nivel,senha){
        const retorno = await this.#connection.execute(`
        insert into usuarios (nome_usuario, email_usuario,nivel_usuario,senha_usuario)
             
            values ('${nome}','${email}','${nivel}','${senha}')
        `)
    }
   async selecionarPontos(){
    const pontosData = await this.#connection.query("select * from pontos;")
       return pontosData[0]
   }
   async selecionarPontosgeral(tipo) {
    const query = 'SELECT * FROM pontos WHERE tipo_ponto = ?';
    const pontosData = await this.#connection.query(query, [tipo]);
    return pontosData[0];
}

   async insertPontos(tipo, nome, rua, bairro,num,telefone,cep,foto){
    const retorno = await this.#connection.execute(`
    insert into pontos (tipo_ponto, nome_ponto, rua_ponto, bairro_ponto, num_ponto, telefone_ponto, cep_ponto,foto_ponto)
         
        values ('${tipo}','${nome}','${rua}','${bairro}','${num}','${telefone}','${cep}','${foto}')
    `)
}
   async selecionarConfirmacoes(){
    const confirmacoesData = await this.#connection.query("select * from confirmacoes;")
       return confirmacoesData[0]
   }
   async insertConfirmacoes(confirma, usuarios, eventos){
    const retorno = await this.#connection.execute(`
    insert into confirmacoes (confirma_confirmacao, Usuarios_id_usuario, Eventos_id_evento)
         
        values ('${confirma}','${usuarios}','${eventos}')
    `)
}
   async selecionarEventos(){
    const eventosData = await this.#connection.query("select * from eventos;")
       return eventosData[0]
   }
   async consultarEvento() {
    const eventosData = await this.#connection.query(`
        SELECT eventos.id_evento, eventos.nome_evento, eventos.data_evento, eventos.horario_evento, eventos.custo_evento, 
               eventos.foto_evento, eventos.Pontos_id_ponto, pontos.nome_ponto, pontos.rua_ponto, 
               pontos.num_ponto, pontos.bairro_ponto ,pontos.telefone_ponto ,pontos.cep_ponto 
        FROM eventos 
        INNER JOIN pontos ON eventos.Pontos_id_ponto = pontos.id_ponto;
    `);

    return eventosData[0];
}


   async insertEventos(nome, data, horario,custo,foto,pontos){
    const retorno = await this.#connection.execute(`
    insert into eventos (nome_evento, data_evento, horario_evento,custo_evento,foto_evento,Pontos_id_ponto)
         
        values ('${nome}','${data}','${horario}','${custo}','${foto}','${pontos}')
    `)
}
async verificarLogin(email, senha) {
    try {
        const sql = 'SELECT id_usuario FROM usuarios WHERE email_usuario = ? AND senha_usuario = ?';
        const [rows, fields] = await this.#connection.execute(sql, [email, senha]);
        return rows;
    } catch (error) {
        console.error('Erro ao verificar login:', error);
        throw error;
    }
}

}

module.exports = Database