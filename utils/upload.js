const multer = require("multer");
const fs = require('fs')
const path = require('path');

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    let filesDir = `storage/${file.fieldname}/`
    if (!fs.existsSync(filesDir)) {
      fs.mkdirSync(filesDir);
    }
    cb(null, path.join(filesDir))
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + "-" + Date.now() + path.extname(file.originalname))
  },
});

const uploadPost = multer({
  storage,
  limits: {
    fileSize: 4 * 1024 * 1024,
  },
  fileFilter: (req, file, cb) => {
    var ext = path.extname(file.originalname);
    if (ext !== ".png" && ext !== ".jpg" && ext !== ".gif" && ext !== ".jpeg") {
      return cb(new Error("Only images are allowed"));
    }
    cb(null, true);
  },
}).any('post');

const uploadProfile = multer({
  storage,
  limits: {
    fileSize: 4 * 1024 * 1024,
  },
  fileFilter: (req, file, cb) => {
    var ext = path.extname(file.originalname);
    if (ext !== ".png" && ext !== ".jpg" && ext !== ".gif" && ext !== ".jpeg") {
      return cb(new Error("Only images are allowed"));
    }
    cb(null, true);
  },
}).single('profile');

module.exports = {
  uploadPost,
  uploadProfile
};
