const postModel = require("../models/post");

module.exports = {
  create: async (req, res, next) => {
    try {
      const { post } = await postModel.create(req.body);

      res.status(200).json({
        data: post,
      });
      
    } catch (error) {
      res.status(error?.status || 500).send({ error })
    }
  },
};
