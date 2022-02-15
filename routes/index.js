const router = require('express').Router();
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
const createError = require("http-errors");

router.get("/", (req, res) => {
  res.send("Hello World!");
});

router.get("/post", async (req, res) => {
  const posts = await prisma.post.findMany({
    where: { published: false },
    include: { author: true },
  })
  res.json({
    data: posts
  })
});

// router.use("/auth", auth);
router.use(async (req, res, next) => {
  next(createError.NotFound("Route not Found"));
});

router.use((err, req, res, next) => {
  res.status(err.status || 500).json({
    status: false,
    message: err.message,
  });
});
module.exports = router;
