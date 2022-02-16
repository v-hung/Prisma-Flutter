const userModel = require("../models/user");

module.exports = {
  register: async (req, res, next) => {
    try {
      const { user, jwt } = await userModel.register(req.body);

      res.status(200).json({
        jwt: jwt,
        data: user,
      });
      
    } catch (error) {
      res.sendStatus(error?.message?.error?.status || 500).send({ error: error?.message?.error || 'Server error'})
    }
  },
};
