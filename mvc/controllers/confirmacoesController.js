const path = require('path')
const ConfirmacoesDAO = require('../../DAO/confirmacoesDAO')
const EventoDAO=require('../../DAO/eventosDAO')

const UsuarioDAO = require('../../DAO/usuariosDAO')

module.exports= (app) =>{
    app.get("/confirmacoes", async (req, res) => {
        
        const confirmacoesDAO = new ConfirmacoesDAO();
        res.setHeader("Access-Control-Allow-Origin","*")

        res.status(201).json(await confirmacoesDAO.consultarConfirmacoes())

    })
    app.get("/confirmacao", async (req, res) => {
        res.setHeader("Access-Control-Allow-Origin","*")
        const eventoDAO = new EventoDAO();
        const lista_eventos = await eventoDAO.consultarEvento();
        const usuarioDAO = new UsuarioDAO();
        const lista_usuarios = await usuarioDAO.consultarUsuario();
        res.render("confirmacoes/confirmacoes",{eventos:lista_eventos,usuarios:lista_usuarios})
    })
    app.post("/registrarconfirmacoes",(req,res) =>{
        const confirmacoesDAO = new ConfirmacoesDAO();
        res.setHeader("Acess-Control-Allow-Origin","*")
        const {txtconfirma, txtusuario,txtevento} = req.body;

        confirmacoesDAO.registrarconfirmacoe(txtconfirma, txtusuario,txtevento)

        res.redirect("/home");
    })
    app.post("/registraconfirmacoes", async (req, res) => {
        const confirmacoesDAO = new ConfirmacoesDAO();
        res.setHeader("Access-Control-Allow-Origin", "*");
        
        const { txtconfirma, txtusuario, txtevento } = req.body;
        
        try {
            // Chame o método registrarconfirmacoes do ConfirmacoesDAO para inserir os dados na tabela de confirmações
            await confirmacoesDAO.registrarconfirmacoe(txtconfirma, txtusuario, txtevento);
            
            // Envie uma resposta de sucesso ao cliente
            res.status(200).send('Confirmação registrada com sucesso!');
        } catch (error) {
            // Em caso de erro, envie uma resposta de erro ao cliente
            console.error('Erro ao registrar confirmação:', error);
            res.status(500).send('Erro ao registrar confirmação.');
        }
    });
}