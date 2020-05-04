var path = require('path');

//express setup
var express = require('express');
var app = express();
var exphbs = require('express-handlebars');

var port = process.env.PORT || 3000;

app.engine('handlebars', exphbs({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');

//socket.io setup
//var server = require('http').Server(app);
//var io = require('socket.io')(server);

//bodyParser setup
var bodyParser = require('body-parser');
app.use(bodyParser.json());

//favicon.icon
//var favicon = require('serve-favicon');
//app.use(favicon(__dirname + '/public/favicon.ico'));

//==Handle incoming requests
app.use(express.static('public'));

app.get('/', function (req, res, next) {
  res.status(200).render('index', {});
});

app.get('*', function (req, res) {
  res.status(404).render('404', {});
});

app.listen(port, function (err) {
  if (err) {
    throw err;
  }
  console.log("== Server is listening on port", port);
});
