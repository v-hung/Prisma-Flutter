const router = require('express').Router();
const user = require('../controllers/user');
// const auth = require('../middlewares/auth');
const { uploadProfile } = require('../utils/upload')


// router.get("/add", auth, user.register);
// router.get("/:id/edit", auth, user.login);
// router.get("/:id/del", auth , user.logged);

router.post("/upload", uploadProfile, (req, res, next) => {
  const file = req.file

  console.log(req.file);
  if (!file) {
    res.status(404).send({
      error: {
        status: 404,
        name: "",
        message: "Please upload a file",
        details: [],
      },
    })
  }
  res.send(file)
})

module.exports = router;