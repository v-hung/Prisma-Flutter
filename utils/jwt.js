const jwt = require("jsonwebtoken");
require("dotenv").config();
const accessTokenSecret = process.env.ACCESS_TOKEN_SECRET;


module.exports = {
  signAccessToken(payload) {
    return new Promise((resolve, reject) => {
      jwt.sign({ payload }, accessTokenSecret, {}, (err, token) => {
        if (err) {
          reject(new Error('Can\'t create token'));
        }
        resolve(token);
      });
    });
  },
  verifyAccessToken(token) {
    return new Promise((resolve, reject) => {
      jwt.verify(token, accessTokenSecret, (err, payload) => {
        if (err) {
          return reject(new Error('Unauthorized'));
        }
        resolve(payload);
      });
    });
  },
};
