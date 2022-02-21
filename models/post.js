const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

module.exports = {
  ...prisma.posts,

  create: async (data) => {
    try {
      
      
    } catch (error) {
      throw {
        status: error.status || 500,
        name: error.name || "Internal Server Error",
        message: error.message || "Internal Server Error",
        details: error.details || [],
      };
    }
  }
}