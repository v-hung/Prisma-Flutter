const router = require('express').Router();
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
const createError = require("http-errors");

router.get("/", (req, res) => {
  res.send("Hello World!");
});

router.get("/api/post", async (req, res) => {
  const posts = await prisma.post.findMany({
    where: { published: false },
    include: { author: true },
  })
  res.json({
    data: posts,
    meta: {}
  })
});

// router.use("/auth", auth);
router.use(async (req, res, next) => {
  res.status(404).send({
    error: {
      status: 404,
      name: "",
      message: "Route not Found",
      details: {},
    },
  })
});

module.exports = router;
