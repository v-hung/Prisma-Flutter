const router = require('express').Router();
const fs = require('fs')
const path = require('path');


router.get("/:filename", (req, res, next) => {
  try {
    let filepath = `storage/${req.params.filename.split('-')[0]}/${req.params.filename}`

    if (!fs.existsSync(filepath)) {
      throw ""
    }

    res.sendFile(filepath, { root: path.join(__dirname, '../') })

  } catch (e){
    res.status(404).send({
      error: {
        status: 404,
        name: "",
        message: "File not found",
        details: [],
      },
    })
  }
});

module.exports = router;