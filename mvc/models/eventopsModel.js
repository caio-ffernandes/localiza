class Eventos {
    #id;
    #nome;
    #data;
    #horario;
    #custo;
    #foto;
    #ponto;
    #rua;
    #bairro;
    #num;
    #telefone;
    #cep;

    constructor(id, nome, data, horario, custo, foto, ponto, rua, bairro, num, telefone, cep) {
        this.#id = id;
        this.#nome = nome;
        this.#data = data;
        this.#horario = horario;
        this.#custo = custo;
        this.#foto = foto;
        this.#ponto = ponto;
        this.#rua = rua;
        this.#bairro = bairro;
        this.#num = num;
        this.#telefone = telefone;
        this.#cep = cep;
    }

    get id() {
        return this.#id;
    }

    set id(value) {
        this.#id = value;
    }

    get nome() {
        return this.#nome;
    }

    set nome(value) {
        this.#nome = value;
    }

    get data() {
        return this.#data;
    }

    set data(value) {
        this.#data = value;
    }

    get horario() {
        return this.#horario;
    }

    set horario(value) {
        this.#horario = value;
    }

    get custo() {
        return this.#custo;
    }

    set custo(value) {
        this.#custo = value;
    }

    get foto() {
        return this.#foto;
    }

    set foto(value) {
        this.#foto = value;
    }

    get ponto() {
        return this.#ponto;
    }

    set ponto(value) {
        this.#ponto = value;
    }

    get rua() {
        return this.#rua;
    }

    set rua(value) {
        this.#rua = value;
    }

    get bairro() {
        return this.#bairro;
    }

    set bairro(value) {
        this.#bairro = value;
    }

    get num() {
        return this.#num;
    }

    set num(value) {
        this.#num = value;
    }

    get telefone() {
        return this.#telefone;
    }

    set telefone(value) {
        this.#telefone = value;
    }

    get cep() {
        return this.#cep;
    }

    set cep(value) {
        this.#cep = value;
    }

    toJson() {
        return {
            "id": this.#id,
            "nome": this.#nome,
            "data": this.#data,
            "horario": this.#horario,
            "custo": this.#custo,
            "foto": this.#foto,
            "ponto": this.#ponto,
            "rua": this.#rua,
            "bairro": this.#bairro,
            "num": this.#num,
            "telefone": this.#telefone,
            "cep": this.#cep
        };
    }
}

module.exports = Eventos;
