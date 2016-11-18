PokemonApp.Pokemon = function(pokemonUri){
    this.id = PokemonApp.Pokemon.idFromUri(pokemonUri)
};
PokemonApp.Pokemon.idFromUri = function(pokemonUri){
  var uriSegments = pokemonUri.split("/");
  var secondLast = uriSegments.length -2;
  return uriSegments[secondLast];
}
PokemonApp.Pokemon.prototype.render = function(target){
  var self = this;
  $.ajax({
    url:"/api/pokemon/" + this.id,
    success:function(response){
      self.info = response;
      var image = PokemonApp.getImage(self.info.sprites[0].resource_uri);
      var description = PokemonApp.getDescription(self.info.descriptions[self.info.descriptions.length -1].resource_uri);
      var formatedString = "<h2>" + self.info.name + "</h2>";
      formatedString += "<p>Height: "+ self.info.height +"</p>"
      formatedString += "<p>Weight: "+ self.info.weight +"</p>"
      formatedString += "<p>Attack: "+ self.info.attack +"</p>"
      formatedString += "<p>Defense: "+ self.info.defense +"</p>"
      formatedString += "<p>Sp attack: "+ self.info.sp_atk +"</p>"
      formatedString += "<p>Sp defense: "+ self.info.sp_def +"</p>"
      formatedString += "<p>Speed: "+ self.info.speed +"</p>"
      formatedString += "<p>Types:";
      for(var i = 0; i < self.info.types.length;i++){
        formatedString += "<span class='pkmn-type' data-resource='" + self.info.types[i].resource_uri + "'>" + self.info.types[i].name + "</span> ";
      }
      formatedString += "</p>";
      formatedString +="<img src='" + image  + "'/>";
      formatedString += "<p>" + description  + "</p>"
      $(target).html(formatedString);
    }
  });
};
PokemonApp.getImage = function(resource){
  $.ajax({
    url:resource,
    success:function(response){
      return "http://pokeapi.co/" + response.image;
    }
  });
};
PokemonApp.getDescription = function(resource){
  $.ajax({
    url:resource,
    success:function(response){
        return response.description;
    }
  });
};
PokemonApp.PokemonEvolutions = function(id,info){
  this.id = id;
  this.info = info;
}
PokemonApp.PokemonEvolutions.prototype.render = function(){
  if(this.info.evolutions !=undefined){
    for (var i = 0; i < this.info.evolutions.length; i++){
      $('.evolutions').append("<div class='single-evolution' id='evolution-" + i +"'</div>");
      var pokemon = new PokemonApp.Pokemon(this.info.evolutions[i].resource_uri);
      pokemon.render('#evolution-' + i);
    }
  }
}
PokemonApp.Type = function(uri){
    this.id = PokemonApp.Type.idFromUri(uri)
};
PokemonApp.Type.idFromUri = function(uri){
  var uriSegments = uri.split("/");
  var secondLast = uriSegments.length -2;
  return uriSegments[secondLast];
}
PokemonApp.Type.prototype.render = function(target){
  var self = this;
  $.ajax({
    url:"/api/types/" + this.id,
    success:function(response){
      console.log(response);
      var formatedString = "";
      $(target).html(formatedString);
    }
  });
};
$(document).ready(function(){
  $('.js-show-pokemon').click(function(event){
    var $button = $(event.currentTarget);
    var pokemonUri = $button.data('pokemon-uri');
    var pokemon = new PokemonApp.Pokemon(pokemonUri);
    pokemon.render('#pokemon-info');
    $('#get-evolutions').click(function(){
      var evolutions = new PokemonApp.PokemonEvolutions(pokemon.id,pokemon.info);
      evolutions.render();
      $('.js-evolutions-modal').modal("show");
    });
    $('.js-pokemon-modal').modal('show');
  });
  $('.pkmn-type').click(function(){
    alert("ara");
    var url = $(this).attr('data-resource');
    var type = new PokemonApp.Type(url);
    type.render('.types');
    $('.js-types-modal').modal('show');
  });
  //events to clear the data when modal closes
  $('.js-pokemon-modal').on('hidden.bs.modal', function () {
    $('#pokemon-info').html(' ');
  });
  $('.js-evolutions-modal').on('hidden.bs.modal', function () {
    $('.evolutions').html(' ');
  });
  $('.js-types-modal').on('hidden.bs.modal', function () {
    $('.types').html(' ');
  });
});
