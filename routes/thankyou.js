var db = require('./config/db');

exports.thankyou = function(req, res){
	res.render('thankyou', {});
	//res.send('Thank you for adding this user!!!!!');
};

