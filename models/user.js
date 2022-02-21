const argon2 = require("argon2");
const jwt = require("../utils/jwt");
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

module.exports = {
  ...prisma.users,

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
      const user = await prisma.users.create({
        data: {
          ...data,
          profile: {
            create: {
              image: ''
            }
          }
        },
        include: {
          profile: true
        }
      })
        .catch((e) => {
          throw ""
        })
        
      delete user?.password;
      delete user?.profile;

      const token = await jwt.signAccessToken(user);

      return { user, jwt : token };
    }
    catch(error) {
      console.log(e);
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

      var user = await prisma.users.findUnique({
        where: {
          email,
        },
        select: {
          id: true,
          name: true,
          email: true,
          password: true,
          profile: {
            select: {
              image: true,
              _count: {
                select: {
                  followers: true,
                  following: true
                }
              }
            }
          }
        }
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

      user = {
        ...user,
        ...user.profile,
        ...user.profile._count
      }

      console.log(user);

      delete user?.password
      delete user?.profile
      delete user?._count
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
      const user = await prisma.users.findUnique({
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

      if ( !user ) {
        throw {
          status: 404,
          name: "",
          message: "User not found",
          details: [],
        };
      }
        
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
  },

  findUserDataById: async (data) => {
    try {
      const { id } = data;

      if ( !id ) {
        throw {
          status: 400,
          name: "",
          message: "Data missing",
          details: [],
        };
      }

      console.log(parseInt(id));

      var user = await prisma.users.findUnique({
        where: {
          id: parseInt(id)
        },
        select: {
          id: true,
          name: true,
          profile: {
            select: {
              image: true,
              _count: {
                select: { 
                  followers: true, 
                  following: true 
                }
              }
            }
          }
        }
      })
        .catch((e) => {
          console.log(e);
          throw {
            status: 404,
            name: "",
            message: "User not found",
            details: [],
          };
        })
        
      if ( !user ) {
        throw {
          status: 404,
          name: "",
          message: "User not found",
          details: [],
        };
      }

      console.log(user);

      // format user data
      user = {
        ...user,
        ...user.profile,
        ...user.profile._count
      }

      delete user?.password
      delete user?.email
      delete user?.profile
      delete user?._count

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
  },

  follow: async (data) => {
    try {
      if (data.user_id == data.user_follow) {
        throw {
          status: 400,
          name: "",
          message: "Can not follow myself",
          details: [],
        }
      }

      const profile = await prisma.profiles.findUnique({
        where: {
          user_id: parseInt(data.user_id)
        }
      })

      const profileFollow = await prisma.profiles.findUnique({
        where: {
          user_id: parseInt(data.user_follow)
        }
      })
      
      if ( !profile || !profileFollow ) {
        throw {
          status: 404,
          name: "",
          message: "User not found",
          details: [],
        }
      }

      const checkFollow = await prisma.follows.findFirst({
        where: {
          profile_id: profile.id,
          profile_follow: profileFollow.id
        }
      })

      if ( checkFollow ) {
        throw {
          status: 400,
          name: "",
          message: "Follow already exists",
          details: [],
        }
      }

      const follow = await prisma.follows.create({
        data: {
          profile_id: profile.id,
          profile_follow: profileFollow.id
        }
      })
      
      return { follow }

    } catch (error) {
      throw {
        status: error.status || 500,
        name: error.name || "Internal Server Error",
        message: error.message || "Internal Server Error",
        details: error.details || [],
      };
    }
  },

  unFollow: async (data) => {
    try {
      if (data.user_id == data.user_follow) {
        throw {
          status: 400,
          name: "",
          message: "Can not unfollow myself",
          details: [],
        }
      }

      const profile = await prisma.profiles.findUnique({
        where: {
          user_id: parseInt(data.user_id)
        }
      })

      const profileFollow = await prisma.profiles.findUnique({
        where: {
          user_id: parseInt(data.user_follow)
        }
      })
      
      if ( !profile || !profileFollow ) {
        throw {
          status: 404,
          name: "",
          message: "User not found",
          details: [],
        }
      }

      const follow = await prisma.follows.deleteMany({
        where: {
          profile_id: profile.id,
          profile_follow: profileFollow.id
        }
      })
      
      return { follow }

    } catch (error) {
      throw {
        status: error.status || 500,
        name: error.name || "Internal Server Error",
        message: error.message || "Internal Server Error",
        details: error.details || [],
      };
    }
  }
};
