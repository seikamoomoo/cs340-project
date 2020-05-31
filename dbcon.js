var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_mahmuds',
  password        : '7489',
  database        : 'cs340_mahmuds'
});
module.exports.pool = pool;
