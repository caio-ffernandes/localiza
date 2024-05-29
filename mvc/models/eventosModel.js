class Eventos{
    #id
    get id() {
        return this.#id
    }
    set id(value) {
        this.#id = value
    }

    #nome
    get nome() {
        return this.#nome
    }
    set nome(value) {
        this.#nome = value
    }
    #data
    get data() {
        return this.#data
    }
    set data(value) {
        this.#data = value
    }
    #horario
    get horario() {
        return this.#horario
    }
    set horario(value) {
        this.#horario = value
    }
    #custo
    get custo() {
        return this.#custo
    }
    set custo(value) {
        this.#custo = value
    }
    #foto
    get foto() {
        return this.#foto
    }
    set foto(value) {
        this.#foto = value
    }
    #pontos
    get pontos() {
        return this.#pontos
    }
    set pontos(value) {
        this.#pontos = value
    }
   
   
    constructor(id, nome, data,horario,custo,foto,pontos){
        this.#id = id
        this.#nome = nome
        this.#data = data
        this.#horario = horario
        this.#custo = custo
        this.#foto= foto
        this.#pontos = pontos
    }
    toJson(){
        return {
            "id": this.#id,
            "nome": this.#nome,
            "data": this.#data,
            "horario": this.#horario,
            "custo": this.#custo,
            "foto": this.#foto,
            "pontos": this.#pontos
        }
    }
}
module.exports= Eventos