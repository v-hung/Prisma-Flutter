const userModel = require("../models/user");
const jwt = require("../utils/jwt");

module.exports = {
  register: async (req, res, next) => {
    try {
      const { user, jwt } = await userModel.register(req.body);

      res.status(200).json({
        jwt: jwt,
        data: user,
      });
      
    } catch (error) {
      res.status(error?.status || 500).send({ error })
    }
  },

  login: async (req, res, next) => {
    try {
      const { user, jwt } = await userModel.login(req.body);

      res.status(200).json({
        jwt: jwt,
        data: user,
      });
      
    } catch (error) {
      res.status(error?.status || 500).send({ error })
    }
  },

  logged: async (req, res, next) => {
    try {
      const { user } = await userModel.findOne(req.user)

      const token = await jwt.signAccessToken(user);

      res.status(200).json({
        jwt: token,
        data: user,
      });
      
    } catch (error) {
      res.status(error?.status || 500).send({ error })
    }
  },
};
