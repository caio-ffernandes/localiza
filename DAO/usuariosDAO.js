const Usuario = require ("../mvc/models/usuariosModel");
const Database = require ("../repository/database");

class UsuarioDAO {
    #conexao
    constructor(){
        this.#conexao= new Database();
    }
    async consultarUsuario(){
        const lista_usuarios = []
        const usuarios = await this.#conexao.selecionarUsuario()

        if (usuarios) {
            for (const usuario of usuarios) {
                const objUsuario = new Usuario()
                objUsuario.id = usuario.id_usuario
                objUsuario.nome = usuario.nome_usuario
                objUsuario.email = usuario.email_usuario
                objUsuario.nivel = usuario.nivel_usuario
                objUsuario.senha = usuario.senha_usuario
                
                lista_usuarios.push(objUsuario.toJson())
            }
        }

        return lista_usuarios
    }
    registrarUsuario(nome, email,nivel,senha){
    
        const usuario = new Usuario()
    
        usuario.nome = nome
        usuario.email = email
        usuario.nivel = nivel
        usuario.senha = senha

        this.#conexao.insertUsuario( usuario.nome,usuario.email,usuario.nivel,usuario.senha)
    }
}

module.exports = UsuarioDAO