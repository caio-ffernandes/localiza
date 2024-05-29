const path = require('path')
const PontoDAO = require('../../DAO/pontosDAO')
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
const pontoDAO = new PontoDAO();
const upload = multer({ storage: storage });
module.exports= (app) =>{
    app.get("/pontos", async (req, res) => {
        
        const pontoDAO = new PontoDAO();
        res.setHeader("Access-Control-Allow-Origin","*")

        res.status(201).json(await pontoDAO.consultarPonto())

    })
    app.get("/pontosmida", async (req, res) => {
        
      const pontoDAO = new PontoDAO();
      res.setHeader("Access-Control-Allow-Origin","*")

      res.status(201).json(await pontoDAO.consultarPontomida())

  })
    app.get("/ponto", (req, res) => {
        res.setHeader("Access-Control-Allow-Origin","*")
        
        res.sendFile(path.resolve("mvc/views/ctrldev/ponto/ponto.html"))
    })
    app.get("/pontos/:tipo", async (req, res) => {
      const tipo = req.params.tipo;
      res.setHeader("Access-Control-Allow-Origin", "*");
      const pontoDAO = new PontoDAO();
      const lista_pontos = await pontoDAO.consultarPontoge(tipo);
      res.render('pontos',{pontos:lista_pontos})
    
  });
    // app.post("/registrarpontos",(req,res) =>{
    //     const pontoDAO = new PontoDAO();
    //     res.setHeader("Acess-Control-Allow-Origin","*")
    //     const {txttipo, txtnome,txtrua,txtbairro,txtnumero,txttelefone,txtcep} = req.body;

    //     pontoDAO.registrarPonto(txttipo, txtnome,txtrua,txtbairro,txtnumero,txttelefone,txtcep)

    //     res.redirect("/home");
    // })
    app.post('/registrarpontos', upload.single('imagem'), async (req, res) => {
       
        
        try {
          const extensao = path.extname(req.file.originalname);
          const nomeArquivo = crypto.createHash('md5').update(req.file.originalname + Date.now().toString()).digest('hex') + extensao;
    
          const caminhoDestino = path.join(__dirname, '..', 'views', 'public', 'images', 'upload', nomeArquivo);
    
          await fs.rename(req.file.path, caminhoDestino);
    
          console.log('Upload bem-sucedido');
    
          const {
            txtid: id,
            txttipo: tipo,
            txtnome: nome,
            txtrua: rua,
            txtbairro: bairro,
            txtnumero:numero,
            txttelefone:telefone,
            txtcep:cep
          } = req.body;
    
    
          let status;
    
          if (!id) {
            status = await pontoDAO.registrarPonto( tipo,nome, rua, bairro, numero,telefone,cep,nomeArquivo);
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