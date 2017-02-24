/**
 * Module dependencies.
 */
 var express = require('express');
 var app = module.exports = express.createServer(); 

var routes = require('./routes');
var db = require('./config/db');
 
// Configuration

app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);
app.use(express.static(__dirname + '/public'));

app.configure('development', function(){
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
});

app.configure('production', function(){
  app.use(express.errorHandler());
});

// Routes

app.get('/', routes.index);

app.get('/index', function(req,res){
  console.log(__dirname);
  res.render('index');
});


app.get('/thankyou', function(req,res){
  res.render('thankyou');
});


app.post('/signup', function (req, res) {
    var first_name = req.body.first_name;
    var last_name = req.body.last_name;
    var email = req.body.email;
    var address = req.body.address;
    var address2 = req.body.address2;
    var created = '2016-11-15 00:00:00';
    var modified = '2016-11-15 00:00:00';
    var data = {
        "error":1,
        "Users":""
    };
    if(!!first_name && !!last_name){
        db.query("INSERT INTO user_profiles (`id`, `first_name`, `last_name`, `address1`, `address2`, `email`, `modified`, `created`) VALUES ('',?,?,?,?,?,?,?)",[first_name,last_name,address,address2,email,modified,modified],function(err, rows, fields){
          if (err) throw err
            if(!!err){
                data["Users"] = "Error Adding User";
                res.json(data);
            }else{
                data["error"] = 0;
                data["Users"] = "User Added Successfully";
                //res.render('index', { title: 'Express' });
                res.redirect('/thankyou');
            }
        });
    }else{
        data["Users"] = "Please provide all required data (i.e : first_name, last_name, email)";
        res.json(data);
    }
})


app.get('/listusers', function (req, res) {
    var data = {
        "Users":""
    };
    db.query("SELECT * from user_profiles",function(err, rows, fields){
        if(rows.length != 0){
            data["Users"] = rows;
            var myJsonString = JSON.stringify(data);
            res.render('listusers', { stats: myJsonString});
        }else{
            data["Users"] = '';
            var myJsonString = JSON.stringify(data);
            res.render('listusers', { stats: myJsonString});
            //res.json(data);
        }
    });
})

app.get('/view', function(req,res){
  var user_id = req.query.id;
  var data = {
        "Users":""
      };
  if(user_id !=''){
      db.query("SELECT * from user_profiles WHERE id=?",[user_id],function(err, rows, fields){
          if(rows.length != 0){
              var myJsonString = JSON.stringify(rows);
              res.render('view', { 'userInfo': myJsonString});
          }else{
              data["Users"] = 'No User Detail Found..';
              res.JSON.stringify(data);
              res.render('view', { 'userInfo': myJsonString});
          }
      });
  }else{
      data["Users"] = 'No User Detail Found..';
      res.JSON.stringify(data);
      res.render('view', { 'userInfo': myJsonString});
  }
});


app.get('/edit', function(req,res){
  var user_id = req.query.id;
  var data = {
        "Users":""
      };
  if(user_id !=''){
      db.query("SELECT * from user_profiles WHERE id=?",[user_id],function(err, rows, fields){
          if(rows.length != 0){
              var myJsonString = JSON.stringify(rows);
              res.render('edit', { 'userInfo': myJsonString});
          }else{
              data["Users"] = 'No User Detail Found..';
              res.JSON.stringify(data);
              res.render('edit', { 'userInfo': myJsonString});
          }
      });
  }else{
      data["Users"] = 'No User Detail Found..';
      res.JSON.stringify(data);
      res.render('edit', { 'userInfo': myJsonString});
  }
});

var fileUpload = require('express-fileupload');
app.use(fileUpload());
var fs = require('fs');



app.get('/delete', function(req,res){
  var user_id = req.query.id;
  var data = {
        "Users":""
      };
  if(user_id !=''){
      db.query("delete from `user_profiles` WHERE id=?",[user_id],function(err, rows, fields){
          res.redirect('/listusers');
      });
  }else{
      res.redirect('/listusers');
  }
});
app.get('/upload', function(req,res){
  res.render('upload');
});



/********* IMAGE UPLOAD *************/
app.post('/file_upload', function (req, res) {
    var file = __dirname + "/public/images/profile_pic/" + req.files.file.name; // DESTINATION WHERE WE WANT TO UPLOAD PIC
    fs.readFile(req.files.file.path, function (err, data) {
        fs.writeFile(file, data, function (err) {
        if( err ){
          console.log( err );
        }else{
          response = {
                message:'File uploaded successfully',
                filename:req.files.file.name

            };
        }
          console.log( response );
          res.end( JSON.stringify( response ) );
        });
      });
  })
/********* IMAGE UPLOAD *************/
app.post('/save', function(req,res){
  var user_id = req.body.id;
  var first_name = req.body.first_name;
  var last_name = req.body.last_name;
  var email = req.body.email;
  var address = req.body.address;
  var address2 = req.body.address2;
  var originalfilename='';
  var response = [];
  var file = __dirname + "/public/images/profile_pic/" + req.files.file.name; // DESTINATION WHERE WE WANT TO UPLOAD PIC
  var file1 = __dirname + "/public/images/profile_pic/1482_radha-krishna-hd-wallpaper-04.jpg";
  
  //fs.unlinkSync(file1);
  /*fs.unlink(file1){
      if (err) throw err;
      console.log('successfully deleted /tmp/hello');
  });*/
    fs.readFile(req.files.file.path, function (err, data) {
        fs.writeFile(file, data, function (err) {
        if( err ){
          console.log( err );
          file_name = '';
        }else{
          /*response = {
                message:'File uploaded successfully',
                filename:req.files.file.name
          };*/
          originalfilename = req.files.file.name;
          var data = {
                "Users":""
              };
          if(user_id !=''){
              db.query("UPDATE `user_profiles` SET  `first_name` = ?, `last_name`=?, `email`=?,`profile_pic`=?, `address1`=?, `address2`=? WHERE id=?",[first_name,last_name,email,originalfilename,address,address2,user_id],function(err, rows, fields){
                  res.redirect('/listusers');
              });
          }else{
              res.redirect('/listusers');
          }
          //res.end( JSON.stringify( response ) );
        }
      })
    }); 
  
  
});
// default options 

app.listen(8080, function(){
  console.log("Express server listening on port http://localhost:8080/  %d in %s mode", app.address().port, app.settings.env);
});
