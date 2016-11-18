if(window.PokemonApp === undefined){
  window.PokemonApp = {};
}
PokemonApp.init = function(){
  console.log("Pokemen App ONLINE!");
}
$(document).ready(function(){
  PokemonApp.init();
});
