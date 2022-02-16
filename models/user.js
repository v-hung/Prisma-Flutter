const argon2 = require('argon2');
const jwt = require('../utils/jwt');

module.exports = {
  register: async (data) => {
    const { email, name } = data;
    data.password = await argon2.hash(data.password);
    let user = prisma.user.create({
      data
    });
    const jwt = await jwt.signAccessToken(user);

    return { user, jwt };
  },

  login: async (data) => {
    const { email, password } = data;
    const user = await prisma.user.findUnique({
      where: {
        email
      }
    });
    if (!user) {
      throw new Error({
        error: {
          status: 404,
          name: "",
          message: "User not found",
          details: {},
      }})
    }
    const checkPassword = await argon2.verify(user.password, password)
    if (!checkPassword) 
      throw new Error({
        error: {
          status: 403,
          name: "",
          message: "Email address or password not valid",
          details: {},
      }})

    delete user.password
    const jwt = await jwt.signAccessToken(user)

    return { user, jwt }
  }
};
