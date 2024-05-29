const Ponto = require("../mvc/models/pontosModel");
const Database = require("../repository/database");

class PontosDAO {
    #conexao
    constructor() {
        this.#conexao = new Database();
    }
    async consultarPonto() {
        const lista_pontos = []
        const pontos = await this.#conexao.selecionarPontos()

        if (pontos) {
            for (const ponto of pontos) {
                const objPonto = new Ponto()
                objPonto.id = ponto.id_ponto
                objPonto.tipo = ponto.tipo_ponto
                objPonto.nome = ponto.nome_ponto
                objPonto.rua = ponto.rua_ponto
                objPonto.bairro = ponto.bairro_ponto
                objPonto.num = ponto.num_ponto
                objPonto.telefone = ponto.telefone_ponto
                objPonto.cep = ponto.cep_ponto
                objPonto.foto = ponto.foto_ponto

                lista_pontos.push(objPonto.toJson())
            }
        }

        return lista_pontos
    }
    async consultarPontoge(tipo) {
        const lista_pontos = [];
        const pontos = await this.#conexao.selecionarPontosgeral(tipo);

        if (pontos) {
            for (const ponto of pontos) {
                const objPonto = new Ponto();
                objPonto.id = ponto.id_ponto;
                objPonto.tipo = ponto.tipo_ponto;
                objPonto.nome = ponto.nome_ponto;
                objPonto.rua = ponto.rua_ponto;
                objPonto.bairro = ponto.bairro_ponto;
                objPonto.num = ponto.num_ponto;
                objPonto.telefone = ponto.telefone_ponto;
                objPonto.cep = ponto.cep_ponto;
                objPonto.foto = ponto.foto_ponto;

                lista_pontos.push(objPonto.toJson());
            }
        }

        return lista_pontos;
    }
    async registrarPonto(tipo, nome, rua, bairro,num,telefone,cep,foto) {

        const ponto = new Ponto()
        
        ponto.tipo = tipo
        ponto.nome = nome
        ponto.rua = rua
        ponto.bairro = bairro
        ponto.num = num
        ponto.telefone = telefone
        ponto.cep = cep
        ponto.foto = foto

        this.#conexao.insertPontos(ponto.tipo,ponto.nome,ponto.rua,ponto.bairro,ponto.num,ponto.telefone,ponto.cep,ponto.foto)
    }
}

module.exports = PontosDAO