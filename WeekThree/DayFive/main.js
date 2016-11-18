var Game = require('./lib/Game.js');
var Player = require('./lib/Player.js');
var Question = require('./lib/Question.js');
var read = require('read');
var player1 = new Player('player1');
var player2 = new Player('player2');
var question1 = new Question(1,'2 +2 ??','4');
var question2 = new Question(2,'2 + 3 ??','5');
var question3 = new Question(3,'4*3??','12');
var question4 = new Question(4,'20+20 ??','40');

var game = new Game([player1,player2],[question1,question2,question3,question4]);
game.start();
