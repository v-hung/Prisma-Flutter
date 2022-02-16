const argon2 = require("argon2");
const jwt = require("../utils/jwt");
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

module.exports = {
  register: async (data) => {
    try {
      const { email, name, password } = data;

      if (!email || !name || !password) {
        throw {
          status: 400,
          name: "",
          message: "Login information is missing",
          details: [],
        };
      }

      data.password = await argon2.hash(password);
      const user = await prisma.user.create({
        data,
      })
        .catch((e) => {
          throw ""
        })
        
      delete user.password;

      const token = await jwt.signAccessToken(user);

      return { user, jwt : token };
    }
    catch(error) {
      throw {
        status: error.status || 500,
        name: error.name || "Internal Server Error",
        message: error.message || "Internal Server Error",
        details: error.details || [],
      };
    }
  },

  login: async (data) => {
    try {
      const { email, password } = data;

      if (!email || !password) {
        throw {
          status: 400,
          name: "",
          message: "Login information is missing",
          details: [],
        };
      }

      const user = await prisma.user.findUnique({
        where: {
          email,
        },
      });

      if (!user) {
        throw {
          status: 404,
          name: "",
          message: "User not found",
          details: [],
        };
      }

      const checkPassword = await argon2.verify(user.password, password);
      if (!checkPassword)
        throw {
          status: 403,
          name: "",
          message: "Email address or password not valid",
          details: [],
        };

      delete user.password;
      const token = await jwt.signAccessToken(user);

      return { user, jwt : token };
    }
    catch(error) {
      throw {
        status: error.status || 500,
        name: error.name || "Internal Server Error",
        message: error.message || "Internal Server Error",
        details: error.details || [],
      };
    }
  },

  findOne: async (data) => {
    try {
      const { email } = data;

      if ( !email ) {
        throw {
          status: 400,
          name: "",
          message: "Data missing",
          details: [],
        };
      }
      const user = await prisma.user.findUnique({
        where: {
          email: email
        }
      })
        .catch((e) => {
          throw {
            status: 404,
            name: "",
            message: "User not found",
            details: [],
          };
        })
        
      delete user.password;

      return { user };
    }
    catch(error) {
      throw {
        status: error.status || 500,
        name: error.name || "Internal Server Error",
        message: error.message || "Internal Server Error",
        details: error.details || [],
      };
    }
  }
};
