const router = require('express').Router();
const user = require('../controllers/user');
const auth = require('../middlewares/auth')


router.get("/:id", user.findUserDataById);
router.post("/:id/follow", auth, user.follow);
router.post("/:id/unfollow", auth, user.unFollow);

module.exports = router;