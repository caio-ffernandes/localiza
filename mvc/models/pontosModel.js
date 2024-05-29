class Pontos{
    #id
    get id() {
        return this.#id
    }
    set id(value) {
        this.#id = value
    }

    #tipo
    get tipo() {
        return this.#tipo
    }
    set tipo(value) {
        this.#tipo = value
    }
    #nome
    get nome() {
        return this.#nome
    }
    set nome(value) {
        this.#nome = value
    }
    #rua
    get rua() {
        return this.#rua
    }
    set rua(value) {
        this.#rua = value
    }
    #bairro
    get bairro() {
        return this.#bairro
    }
    set bairro(value) {
        this.#bairro = value
    }
    #num
    get num() {
        return this.#num
    }
    set num(value) {
        this.#num = value
    }
    #telefone
    get telefone() {
        return this.#telefone
    }
    set telefone(value) {
        this.#telefone = value
    }
    #cep
    get cep() {
        return this.#cep
    }
    set cep(value) {
        this.#cep = value
    }
    #foto
    get foto() {
        return this.#foto
    }
    set foto(value) {
        this.#foto = value
    }
   
    constructor(id, tipo, nome,rua,bairro,num,telefone,cep,foto){
        this.#id = id
        this.#tipo = tipo
        this.#nome = nome
        this.#rua = rua
        this.#bairro = bairro
        this.#num = num
        this.#telefone = telefone
        this.#cep = cep
        this.#foto = foto
     
    }
    toJson(){
        return {
            "id": this.#id,
            "tipo": this.#tipo,
            "nome": this.#nome,
            "rua": this.#rua,
            "bairro": this.#bairro,
            "num": this.#num,
            "telefone": this.#telefone,
            "cep": this.#cep,
            "foto":this.#foto

        }
    }
}
module.exports= Pontos