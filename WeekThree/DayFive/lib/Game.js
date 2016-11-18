var read = require('read');
var Player = require('./Player.js');
//falete object ;(
var Game = function(users,questions){
  this.currentQuestion = 0;
  this.users = users;
  this.points = 0;
  this.questions = questions;
  this.actualPlayer = null;
  this.featuredQuestion = Math.floor(Math.random() * this.questions.length) + 0;
  this.setPlayer = function(err,input){
    if(input == null){
      this.start();
    }
    //TODO: check if the player exists
    this.actualPlayer = input;
    this.quizPlayer();
  };
  //prompt to create player
  this.showCreatePlayer = function(){
    var prompt = '¿Tu nombre?\n';
    var options= {
       prompt: prompt
   }
    read(options,this.createPlayer.bind(this));
  };
  //prompt to choose player
  this.showChoosePlayer = function(){
    var prompt = '¿con que usuario quieres jugar?\n';
    var options= {
       prompt: prompt
   }
    read(options,this.setPlayer.bind(this));
  };
  //creates a new player in the array
  this.createPlayer = function(name){
    var newUser = new Player(name);
    users.push(newUser);
    console.log('El usuario se ha creado correctamente');
    this.start();
  };
  //start game
  this.start = function(){
    var startPrompt = '¿Que quieres hacer?\nCrear jugador=>crear\nempezar=>jugar\n';
    var options= {
        prompt: startPrompt
    }
    read(options, checkStartInput.bind(this));
    function checkStartInput(err, input){
        if(input == 'jugar'){
          this.showChoosePlayer();
        }else if(input == 'crear'){
          this.showCreatePlayer();
        }
        else{
          console.log('No puedo hacer eso!');
          this.start();
        }
    };
  }
  this.endGame = function(){
    console.log('Your score is ' + this.points + ' points');
    console.log("Game ended");
    return;
  }
  //TODO: refactor please...
  this.quizPlayer = function (text){
    if(text == undefined){
      text = this.questions[this.currentQuestion].description;
    }
    var options= {
        prompt: text
    }
    read(options,checkAnswer.bind(this));
    function checkAnswer(err,input){
      if(this.questions[this.currentQuestion].answer == input){
        this.currentQuestion++;
        if(this.currentQuestion == this.questions.length){
          this.endGame();
          return;
        }
        this.quizPlayer(this.questions[this.currentQuestion].description);
        //TODO:store the points in the user object
        if(this.currentQuestion ==this.featuredQuestion){
          this.points += 20;
        }else{
          this.points += 10;
        }
      }
      else{
          console.log("error");
          this.quizPlayer(this.questions[this.currentQuestion].description)
      }
    }
  };
}
module.exports = Game;
