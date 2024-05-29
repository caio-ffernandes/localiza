const path = require('path')
const EventoDAO = require('../../DAO/eventosDAO')
const PontoDAO= require('../../DAO/pontosDAO')
const multer = require('multer');
const crypto = require('crypto');
const fs = require('fs').promises;

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, '..', 'views', 'public', 'images', 'upload'));
  },
  filename: function (req, file, cb) {
    const extensao = path.extname(file.originalname);

    const nomeArquivo = crypto.createHash('md5').update(file.originalname + Date.now().toString()).digest('hex') + extensao;
    cb(null, nomeArquivo);
  },
});
const eventoDAO = new EventoDAO();
const upload = multer({ storage: storage });
module.exports= (app) =>{
    app.get("/eventos", async (req, res) => {
        
        const eventoDAO = new EventoDAO();
        res.setHeader("Access-Control-Allow-Origin","*")

        res.status(201).json(await eventoDAO.consultarEvento())

    })
    app.get("/eventoos", async (req, res) => {
        
      const eventoDAO = new EventoDAO();
      res.setHeader("Access-Control-Allow-Origin","*")

      res.status(201).json(await eventoDAO.consultarEventop())

  })
    app.get("/evento", async (req, res) => {
        res.setHeader("Access-Control-Allow-Origin","*")
        const pontoDAO = new PontoDAO();
        const lista_pontos = await pontoDAO.consultarPonto();
        res.render('evento/evento',{pontos:lista_pontos})
    })
    app.get("/eventos/evento", async (req, res) => {
      res.setHeader("Access-Control-Allow-Origin", "*");
      const lista_eventos = await eventoDAO.consultarEventop();
      res.render('eventos', {userID: req.session.user.id, eventos: lista_eventos });
  });
    // app.post("/rieongoerg",(req,res) =>{
    //     const eventoDAO = new EventoDAO();
    //     res.setHeader("Acess-Control-Allow-Origin","*")
    //     const {txtnome, txtdata,txthorario,txtcusto,txtponto} = req.body;

    //     eventoDAO.registrarEvento(txtnome, txtdata,txthorario,txtcusto,txtponto)

    //     res.redirect("/home");
    // })
    app.post('/registrarevento', upload.single('imagem'), async (req, res) => {
       
        
        try {
          const extensao = path.extname(req.file.originalname);
          const nomeArquivo = crypto.createHash('md5').update(req.file.originalname + Date.now().toString()).digest('hex') + extensao;
    
          const caminhoDestino = path.join(__dirname, '..', 'views', 'public', 'images', 'upload', nomeArquivo);
    
          await fs.rename(req.file.path, caminhoDestino);
    
          console.log('Upload bem-sucedido');
    
          const {
            txtid: id,
            txtnome: nome,
            txtdata: data,
            txthorario: horario,
            txtcusto: custo,
            txtponto:ponto
          } = req.body;
    
    
          let status;
    
          if (!id) {
            status = await eventoDAO.registrarEvento( nome, data, horario, custo,nomeArquivo,ponto);
          } else {
           console.log("nem")
          
          }
          res.redirect("/home");
        } catch (error) {
          console.error(error);
          
          res.status(500).send('Erro ao realizar o upload. É necessário selecionar uma imagem');
        }
      });
}