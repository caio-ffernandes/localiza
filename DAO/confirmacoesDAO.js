const Confirmacoes = require ("../mvc/models/confirmacoesModel");
const Database = require ("../repository/database");

class ConfirmacoesDAO {
    #conexao
    constructor(){
        this.#conexao= new Database();
    }
    async consultarConfirmacoes(){
        const lista_confirmacoes = []
        const confirmacoes = await this.#conexao.selecionarConfirmacoes()

        if (confirmacoes) {
            for (const confirmacoe of confirmacoes) {
                const objconfirmacoe = new Confirmacoes()
                objconfirmacoe.confirma = confirmacoe.confirma_confirmacao
                objconfirmacoe.usuarios = confirmacoe.Usuarios_id_usuario
                objconfirmacoe.eventos = confirmacoe.Eventos_id_evento
                
                
                lista_confirmacoes.push(objconfirmacoe.toJson())
            }
        }

        return lista_confirmacoes
    }
    registrarconfirmacoe(confirma, usuarios,eventos){
    
        const confirmacoes = new Confirmacoes()
    
        confirmacoes.confirma = confirma
        confirmacoes.usuarios = usuarios
        confirmacoes.eventos = eventos

        this.#conexao.insertConfirmacoes(confirmacoes.confirma,confirmacoes.usuarios,confirmacoes.eventos)
    }
}

module.exports = ConfirmacoesDAO