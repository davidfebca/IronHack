var Game = require('./lib/Game.js');
var Weapon = require('./lib/Weapon.js');
var Saxon = require('./lib/Saxon.js');
var Viking = require('./lib/Viking.js');
//vikings weapons
var ironAxe = new Weapon('IronAxe', 100);
var ironSword = new Weapon('IronSword', 50);
//saxons weapons
var miniSword = new Weapon('MiniSword', 10);
var miniAxe = new Weapon('MiniAxe', 10);
//vikings!!!
var david = new Viking ("David", ironAxe , "Kill them all");
var matias = new Viking ("Matias", ironSword, "Fiiight!!");
var miguel = new Viking ("Miguel", ironAxe , "Saxons suucks");
var thor = new Viking ("Thor", ironSword, "Fiiight!!");
//nyeee, Saxons...
var saxon1 = new Saxon (miniAxe);
var saxon2 = new Saxon (miniSword);
var saxon3 = new Saxon (miniAxe);
var saxon4 = new Saxon (miniSword);
var saxon5 = new Saxon (miniAxe);
var saxon6 = new Saxon (miniSword);
var saxon7 = new Saxon (miniAxe);
var saxon8 = new Saxon (miniSword);
var saxon9 = new Saxon (miniSword);
var saxon10 = new Saxon (miniSword);
var saxon11 = new Saxon (miniSword);
var saxon12 = new Saxon (miniSword);
var saxon13 = new Saxon (miniSword);
var saxon14 = new Saxon (miniSword);
var saxon15 = new Saxon (miniSword);
var saxon16 = new Saxon (miniSword);
var saxon17 = new Saxon (miniSword);
var saxon18 = new Saxon (miniSword);
var saxon19 = new Saxon (miniSword);
var saxon20 = new Saxon (miniSword);
var saxonsArray = [saxon1,saxon2,saxon3,saxon4,saxon5,saxon6,saxon7,saxon8,saxon9,saxon10,saxon11,saxon12,saxon13,saxon14,saxon15];
var game = new Game([david,matias,miguel,thor],saxonsArray);
console.log("---------------- WELKOME TO VIKINGS WAR ----------------\n")
console.log('The Sun raises. They don\'t expect us. The slaughter begins.');
console.log(game.showShouts())
console.log('-------------------------------\n');
game.startFight();
console.log('What a great batle!!');
console.log(game.showResult());
