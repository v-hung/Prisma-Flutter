const router = require('express').Router();
const user = require('../controllers/user');
const auth = require('../middlewares/auth');


router.post("/register", user.register);
router.post("/login", user.login);
router.get("/logged", auth , user.logged);

module.exports = router;