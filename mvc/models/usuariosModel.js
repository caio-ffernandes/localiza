class Usuario{
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
    #email
    get email() {
        return this.#email
    }
    set email(value) {
        this.#email = value
    }
    #nivel
    get nivel() {
        return this.#nivel
    }
    set nivel(value) {
        this.#nivel = value
    }
    #senha
    get senha() {
        return this.#senha
    }
    set senha(value) {
        this.#senha = value
    }
   
   
    constructor(id, nome, email,nivel,senha){
        this.#id = id
        this.#nome = nome
        this.#email = email
        this.#nivel = nivel
        this.#senha = senha
     
    }
    toJson(){
        return {
            "id": this.#id,
            "nome": this.#nome,
            "email": this.#email,
            "nivel": this.#nivel,
            "senha": this.#senha,

        }
    }
}
module.exports= Usuario