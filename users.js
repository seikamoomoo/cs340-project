module.exports = function(){
    var express = require('express');
    var router = express.Router();

    /*get user*/
    function getUser(res, mysql, context, complete){
        mysql.pool.query("SELECT userID, username FROM Users WHERE userID = :userID_input", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.people = results;
            complete();
        });
    }


    /*get user data*/
    router.get('/', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts = ["deleteperson.js","filterpeople.js","searchpeople.js"];
        var mysql = req.app.get('mysql');
        getPeople(res, mysql, context, complete);
        getPlanets(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('people', context);
            }

        }
    });


    return router;
}();
