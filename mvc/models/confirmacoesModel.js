class Confirmacoes{
    #id
    get id() {
        return this.#id
    }
    set id(value) {
        this.#id = value
    }

    #confirma
    get confirma() {
        return this.#confirma
    }
    set confirma(value) {
        this.#confirma = value
    }
    #usuarios
    get usuarios() {
        return this.#usuarios
    }
    set usuarios(value) {
        this.#usuarios = value
    }
    #eventos
    get eventos() {
        return this.#eventos
    }
    set eventos(value) {
        this.#eventos = value
    }
  
   
   
    constructor(id, confirma,usuarios,eventos){
        this.#id = id
        this.#confirma = confirma
        this.#usuarios = usuarios
        this.#eventos = eventos
      
     
    }
    toJson(){
        return {
            "id": this.#id,
            "confirma": this.#confirma,
            "usuarios": this.#usuarios,
            "eventos": this.#eventos

        }
    }
}
module.exports= Confirmacoes