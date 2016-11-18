var fs = require('fs');
function makeStars(rating){
  rating = Math.floor(rating);
  var stars = "";
  for(var i=0; i<rating; i++){
    stars += "*";
  }
  return stars;
}
function displayEpisodes(episodes){
  var result= "";
  for(var episode in episodes){
      result += 'Title:' + episodes[episode].title + '\n' + episodes[episode].description +'\nRating: ' + episodes[episode].rating + makeStars(episodes[episode].rating) + '\n' ;
  }
  console.log(result);
}
function orderEpisodes(episodes){
  episodes = episodes.sort(function(a, b){
    return a.episode_number - b.episode_number;
  });
  return episodes;
}
function filterEpisodes(episodes){
  episodes = episodes.filter(function(episode){
    return  episode.rating> 8.5;
  });
  return episodes;
}
function searchFor(episodes,name){
  var result;
  result = episodes.find(function(episode){
    return episode.description.indexOf(name) > -1
  });
  return result;
}
function fileActions(err, file){
    if (err) {
        throw err;
    }
    var episodes = JSON.parse(file);
    episodes = orderEpisodes(episodes);
    //episodes = filterEpisodes(episodes);
    displayEpisodes(episodes);
    console.log("John Snow is in the episode");
    var found = searchFor(episodes,"Jon Snow");
    if(found != undefined){
      console.log(found.episode_number);
    }else{
      console.log("Jon Snow is dead!!")
    }

}
fs.readFile("./chapters.txt", 'utf8', fileActions);
