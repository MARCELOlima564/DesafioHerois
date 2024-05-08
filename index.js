const express = require('express');
const { Pool } = require('pg');

const app = express();
const port = 4000;

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'desafioherios',
    password: 'ds564',
    port: 7007, 
  });

  app.use(express.json());

  app.get('/', (req, res) => {
    res.send('A rota está funcionando');
});

app.get('/herois', async (req, res) =>{
  try {
    const resultado = await pool.query('SELECT * FROM  herois');
    res.status(200).json({
      total: resultado.rowCount,
      herois: resultado.rows,
    })
  } catch (error) {
    console.error('Erro ao obter os herois', error);
    res.status(500).send('Erro ao obter os bruxos cadastrados');
  }
});

app.post('/herois' , async (req, res) =>{
  try {
    const {nome, poder, nivel , hp} = req.body;

    await pool.query('INSERT INTO herois (nome, poder, nivel, hp) VALUES ($1, $2, $3, $4)', [nome, poder, nivel, hp]);
    res.status(201).send({ mensagem: 'Heroi criado com sucesso!' });
  } catch (error) {

    console.error('Erro ao criar heroi', error);
    res.status(500).json({ message: 'Erro ao criar heroi' });
  }
});

app.put('/herois/:id', async (req, res) =>{
 
    try {
      const { id } = req.params;
      const { nome, poder, nivel, hp } = req.body;

      await pool.query('UPDATE herois SET nome = $1, poder = $2, nivel = $3, hp = $4 WHERE id = $5', [nome, poder, nivel, hp, id]);
      res.status(201).send({mensagem: 'Heroi editado com sucesso'});
    } catch (error) {
      console.error('Erro ao editar heroi', error);
      res.status(500).send('Erro ao editar heroi');
    }
});

app.delete('/herois/:id', async (req, res) =>{
  try {
    const { id } = req.params;
     await pool.query('DELETE FROM herois WHERE id = $1', [id]);
    res.status(200).send({mensagem: 'Heroi excluido com sucesso'});
} catch (error) { 

  console.error('Erro ao excluir heroi', error);
   res.status(500).send('Erro ao excluir heroi');
}
});

app.get('/herois/:id', async (req, res) =>{
  try {
    const { id } = req.params;
    const resultado = await pool.query('SELECT * FROM herois WHERE id = $1', [id]);

    if(resultado.rowCount == 0){
      res.status(404).send({mensagem: 'Id não encontrado'})
  } else{
      res.json({
          heroi: resultado.rows[0],
      });
  }
  } catch (error) {
    console.error('Erro ao obter heroi pelo id', error); 
    res.status(500).send('Erro ao obter heroi pelo id');
  }
});

app.post("/batalhas", async (req, res) => {
  const { heroi1, heroi2 } = req.body;

  try {
    const heroi11 = await pool.query("SELECT * FROM herois WHERE id = $1", [
      heroi1,
    ]);
    const heroi22 = await pool.query("SELECT * FROM herois WHERE id = $1", [
      heroi2,
    ]);

    const heroi1Nivel = heroi11.rows[0].nivel;
    const heroi2Nivel= heroi22.rows[0].nivel;

    let heroi1Hp = heroi11.rows[0].hp;
    let heroi2Hp = heroi22.rows[0].hp;

    let ganhador_id = null;
    

    while (heroi1Nivel > 0 && heroi2Nivel > 0) {
      heroi2Nivel -= heroi1Hp;
      heroi1Nivel -= heroi2Hp;
    }

    if (heroi1Nivel == heroi2Nivel) {
      ganhador_id = null;
      res.json("Empate");
    } else if (heroi1Nivel < heroi2Nivel) {
      ganhador_id = heroi22.rows[0].id;
      res.json(`${heroi22.rows[0].nome} venceu`,);
    } else {
      ganhador_id = heroi11.rows[0].id;
      res.json(`${heroi11.rows[0].nome} venceu`);
    }

    await pool.query(
      "INSERT INTO batalhas (heroi1_id, heroi2_id, ganhador_id) VALUES ($1, $2, $3)",
      [heroi1, heroi2, ganhador_id]
    );
  } catch (error) {
    console.error("Erro ao criar batalha", error);
    res.status(500).json({ error: error.message });
  }
});


app.listen(port, () => {
  console.log(`Servidor rodando na porta ${port}`);
});