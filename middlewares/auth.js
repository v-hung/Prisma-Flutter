const jwt = require("../utils/jwt");

const auth = async (req, res, next) => {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];

  if (token == null)
    return res.status(401).send({
      error: {
        status: 401,
        name: "Unauthorized",
        message: "Unauthorized",
        details: {},
      },
    });

  await jwt
    .verifyAccessToken(token)
    .then((user) => {
      req.user = user;
      next();
    })
    .catch((e) => {
      res.status(403).send({
        error: {
          status: 403,
          name: "Forbidden",
          message: "Forbidden",
          details: {},
        },
      });
    });
};

module.exports = auth;
