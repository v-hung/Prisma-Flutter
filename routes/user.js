const router = require('express').Router();
const user = require('../controllers/user');


router.get("/:id", user.findUserDataById);

module.exports = router;