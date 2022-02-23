const jwt = require("jsonwebtoken");
require("dotenv").config();
const accessTokenSecret = process.env.ACCESS_TOKEN_SECRET;


module.exports = {
  signAccessToken: async (payload) =>{
    try {
      const token = await jwt.sign({ payload }, accessTokenSecret, {})
      return token
    } catch (error) {
      throw new Error('Can\'t create token')
    }
  },
  verifyAccessToken: async (token) => {
    try {
      const { payload } = await jwt.verify(token, accessTokenSecret, {})
      return payload
    } catch (error) {
      throw new Error('Unauthorized')
    }
  },
};
