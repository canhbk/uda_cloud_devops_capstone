const express = require("express");
const app = express();
const port = 3000;

app.get("/", (req, res) => {
  res.send(
    "Hello Udacity! I am CanhNV6, a student of CloudDevops Nano Degree class"
  );
});

app.listen(port, () => {
  console.log(`App is listening on port ${port}`);
});
