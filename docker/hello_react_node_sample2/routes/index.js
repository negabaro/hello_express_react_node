var express = require('express');
var router = express.Router();

//server-side rendering
var React = require('react');
require('node-jsx').install({harmony:true});
var App = require('../template/index');


/* GET home page. */
router.get('/', function(req, res, next) {
  var user = {
     email : "mix@mix.co.jp"
  };
  var json = JSON.stringify(user);
  res.render('index', { title: 'Express',
                         // サーバー側でもreactで要素を作って、ectに取り込む
			userForm: React.renderToString(React.createElement(App, {user:user})),
			initialData: json
  });
});

module.exports = router;
