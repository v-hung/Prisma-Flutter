const router = require('express').Router();
const auth = require('./auth');

router.get("/", (req, res) => {
  res.send("Hello World!");
});

router.use('/api/auth', auth)


const { PrismaClient } = require('@prisma/client')
router.get("/clear", (req, res) => {
  const prisma = new PrismaClient();
  const propertyNames = Object.getOwnPropertyNames(prisma);
  const modelNames = propertyNames.filter(
    (propertyName) => !propertyName.startsWith('_')
  );

  Promise.all(modelNames.map((model) => prisma[model].deleteMany()))
    .then((values) => {
      res.status(200).send("Success")
    })
    .catch((e) => {
      res.status(500).send({
        error: {
          status: 500,
          name: "",
          message: "not clear",
          details: [],
        },
      })
    })
})

// router.use("/auth", auth);
router.use(async (req, res, next) => {
  res.status(404).send({
    error: {
      status: 404,
      name: "",
      message: "Route not Found",
      details: [],
    },
  })
});

module.exports = router;
