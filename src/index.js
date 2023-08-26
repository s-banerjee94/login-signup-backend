const express = require('express');
const mongoose = require('mongoose');
require('./db/dbConnect');
const userSchemaModule = require('./model/user')

const app = express();
const port = process.env.port || 3000;

app.use(express.json())
app.post('/singup',async function (req, res) {
  console.log(req.body)
  try{
    const user = new userSchemaModule(req.body)
    await user.save().then((data) => {
      console.log(data)
      res.send(data)
    })
  } catch (e) {
    
    res.status(401).send(e)
  }
})

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
