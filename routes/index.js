const router = require('express').Router();
const auth = require('./auth');
const post = require('./post')
const storage = require('./storage')
const user = require('./user')

router.get("/", (req, res) => {
  res.send("Hello World!");
});

// use router
router.use('/api/auth', auth)
router.use('/api/users', user)
router.use('/api/posts', post)
router.use('/storage', storage)


// clear all database
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
