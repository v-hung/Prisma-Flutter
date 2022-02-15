module.exports = {
  "data": [
    // ...
  ],
  "meta": {
    // Pagination by page
    "pagination": {
      "page": 1,
      "pageSize": 10,
      "pageCount": 5,
      "total": 48
    },
    // Pagination by offset
    "pagination": {
      "start": 0,
      "limit": 10,
      "total": 42
    }
  },
  "error": {
    "status": "", // HTTP status
    "name": "", // error name ('ApplicationError' or 'ValidationError')
    "message": "", // A human reable error message
    "details": {
      // error info specific to the error type
    }
  }
}