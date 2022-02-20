const express = require('express');
require('@prisma/client');
const app = express();
require('dotenv').config();
const bodyParser = require('body-parser');
const multer = require('multer');
const path = require('path');


app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
app.use(express.static(path.join(__dirname, 'public')));

// redirect to routes/index.js
const route = require('./routes');
app.use('/', route);

const port = process.env.PORT || 5000;
app.listen(port, () => {
  console.log(`server is running on port ${port}`);
});