const express = require('express');

const app = express();

app.use(express.static("generated"));

app.listen(4444, () => {
    console.log('Prisma server start');
})