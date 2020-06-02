// direct to public
var path = require('path');

var mysql = require('./dbcon.js');

//express setup
var express = require('express');
var app = express();

// handlebars setup
let handlebars = require('express-handlebars').create({ defaultLayout: 'main' });
app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');

app.set('port', process.argv[2]);

// bodyParser setup
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

// app.use('/users', require('./users.js'));
// app.use('/posts', require('./posts.js'));

// favicon.icon
// var favicon = require('serve-favicon');
// app.use(favicon(__dirname + '/public/favicon.ico'));

// Handle incoming requests
app.use(express.static('public'));

app.get('/', function (req, res, next) {
  res.status(200).render('index', {
    posts: require('./postData')
  });
});

app.get('/login', function (req, res, next) {
  res.status(200).render('login', {});
});

app.get('/create-profile', function (req, res, next) {
  res.status(200).render('create-profile', {});
});

app.get('/users/:userID', function (req, res, next) {
  var userID = req.params.userID;
  if(userData[userID]) {
    res.status(200).render('profile', {});
  }
  else {
    next();
  }
});

app.get('*', function (req, res) {
  res.status(404).render('404', {});
});

app.listen(app.get('port'), function (err) {
  if (err) {
    throw err;
  }
  console.log("== Server is listening on port", app.get('port'));
});
