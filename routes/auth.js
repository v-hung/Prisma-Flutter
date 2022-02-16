const router = require('express').Router();
const user = require('../controllers/user');
const auth = require('../middlewares/auth');


router.get("/register", user.register);
router.get("/login", user.login);
router.get("/logged", auth , user.logged);

module.exports = router;