$(document).ready(function(){
  var PlayerController = function (formular,input) {
    this.url = "https://api.spotify.com/v1/";
    this.button =  $('.btn-play')
    this.player =   $('.js-player')
    this.formular = $('#search')
    this.formInput = $('#search-input')
    this.progress = $('progress')
    this.cover = $('.cover img')
    this.title = $('.title')
    this.author = $('.author')
    this.song = {title:"",url:"",artist:"",cover:"",totalTime:""}
    this.setListeners()
  }
  PlayerController.prototype.play=function(){
    if(this.button.hasClass('playing')){
      this.player.trigger('pause');
      this.button.removeClass("playing");
    }else{
      this.player.trigger('play');
      this.button.addClass("playing");
    }
  }
  PlayerController.prototype.updateTime = function(){
    var current = this.player.prop('currentTime');
    this.progress.attr("value",current);
  }
  PlayerController.prototype.render = function(){
    this.cover.attr("src",this.song.cover);
    this.player.attr("src",this.song.url);
    this.title.html(this.song.title);
    this.author.html(this.song.artist);
  }
  PlayerController.prototype.setListeners = function (){
    this.formular.submit(this.searchSongs.bind(this));
    this.button.click(this.play.bind(this))
    this.player.on('timeupdate', this.updateTime.bind(this));
  }
  PlayerController.prototype.save = function(data){
    console.log(data);
    if(data.tracks.items.length > 0){
      this.song.url = data.tracks.items[0].preview_url
      this.song.title = data.tracks.items[0].name
      this.song.cover = data.tracks.items[0].album.images[0].url
      this.song.artist = data.tracks.items[0].artists[0].name
      this.song.totalTime = data.tracks.items[0].duration_ms
    }
    this.render()
  }
  PlayerController.prototype.searchSongs = function(e){
    e.preventDefault();
    $.ajax({
     type: 'GET',
     url: this.url + 'search?q=' + this.formInput.val() + '&type=track',
     success: this.save.bind(this),
     error: function (err) {
     }
   });
  }
  var controller = new PlayerController();
});
