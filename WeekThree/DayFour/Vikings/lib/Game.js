var Game = function(vikings, saxons){
  this.vikings = vikings;
  this.saxons = saxons;
  this.turns = Math.floor(Math.random() * 8) + 5;
  this.showShouts = function(){
    var result = "";
    for (var viking in this.vikings) {
       result += "Viking " + this.vikings[viking].name + " shouts: " + this.vikings[viking].shout + "\n";
   }
    return result;

  };
  this.updatePlayers = function(){
    this.vikings = this.vikings.filter(function(viking){
        return viking.health > 0;
    });
    this.saxons = this.saxons.filter(function(saxon){
        return saxon.health > 0;
    });
  }
  this.startFight = function(){
    for (var i=0;i<=this.turns;i++){
      for(var viking in this.vikings){
        var random = Math.floor(Math.random()* this.saxons.length);
        var vikingName = this.vikings[viking].name;
        this.saxons[random].health = this.saxons[random].health - this.vikings[viking].weapon.damage;
        this.vikings[viking].health = this.vikings[viking].health - this.saxons[random].weapon.damage;
        console.log('The viking ' + this.vikings[viking].name + ' attacks a random saxon with the weapon ' + vikingName + '!!');
        if(this.saxons[random].health <= 0){
          console.log("The saxon dies");
        }
        if(this.vikings[viking].health <=0){
          console.log('The viking ' + vikingName + ' is now in valhalla');
        }
      }
    }
  };
  this.showResult = function(){
    this.updatePlayers();
    if(this.vikings.length > this.saxons.length){
      return "Vikingns wins!!"
    }else if(this.vikings.length < this.saxons.length){
      return "Saxons wins!!"
    }else{
      return "Draw"
    }
  }
}
module.exports = Game;
