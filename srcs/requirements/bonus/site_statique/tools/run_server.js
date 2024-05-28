const express = require('express')

const app = express()

app.use(express.static('anon'))


app.listen(3000, () => {
    console.log("server running on port 3000")
})
