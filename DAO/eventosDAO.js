const Evento = require ("../mvc/models/eventosModel");
const EventoP = require ("../mvc/models/eventopsModel");
const Ponto = require("../mvc/models/pontosModel");
const Database = require ("../repository/database");

class EventoDAO {
    #conexao
    constructor(){
        this.#conexao= new Database();
    }
    async consultarEvento(){
        const lista_eventos = []
        const eventos = await this.#conexao.selecionarEventos()

        if (eventos) {
            for (const evento of eventos) {
                const objevento = new Evento()
                objevento.id = evento.id_evento
                objevento.nome = evento.nome_evento
                objevento.data = evento.data_evento
                objevento.horario = evento.horario_evento
                objevento.custo = evento.custo_evento
                objevento.foto=evento.foto_evento
                objevento.pontos = evento.Pontos_id_ponto
                
                lista_eventos.push(objevento.toJson())
            }
        }

        return lista_eventos
    }
    async consultarEventop() {
        const eventosData = await this.#conexao.consultarEvento();
        const lista_eventos = [];
    
        if (eventosData) {
            for (const eventoData of eventosData) {
                const evento = new EventoP();
                evento.id = eventoData.id_evento;
                evento.nome = eventoData.nome_evento;
                evento.data = eventoData.data_evento;
                evento.horario = eventoData.horario_evento;
                evento.custo = eventoData.custo_evento;
                evento.foto = eventoData.foto_evento;
                evento.ponto = eventoData.nome_ponto;
                evento.rua = eventoData.rua_ponto;
                evento.num = eventoData.num_ponto;
                evento.bairro = eventoData.bairro_ponto;
                evento.telefone = eventoData.telefone_ponto;
                evento.cep = eventoData.cep_ponto;
    
                lista_eventos.push(evento.toJson());
            }
        }
    
        return lista_eventos;
    }
    
    
    async registrarEvento(nome, data,horario,custo,foto,pontos){
    
        const evento = new Evento()
    
        evento.nome = nome
        evento.data = data
        evento.horario = horario
        evento.custo = custo
        evento.foto = foto
        evento.pontos = pontos

        this.#conexao.insertEventos( evento.nome,evento.data,evento.horario,evento.custo,evento.foto,evento.pontos)
    }
}

module.exports = EventoDAO