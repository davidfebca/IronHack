var words;
var message = "";
var words = [];
var sentence = "fill the proper tank for the cow";
function decoder(words){
  var index = 0;
  var secretMessage = '';
  /*for (var i = 0; i < words.length; i++) {
    secretMessage += words[i].charAt(index % 5);
    index++;
  }*/
  words.forEach(function(word,index){
    secretMessage += word[index % 5];
  })
  return secretMessage;
}


function buildArray(sentence,type,order){
  var array = sentence.split(' ');
  if(type == 'even'){
    array = array.filter(function(word,index){
      return index % 2 == 0;
    })
  }
  if(type == 'odd'){
    array = array.filter(function(word,index){
      return index % 2 != 0;
    })
  }
  if(order == 'reverse'){
    array = array.reverse();
  }
}

buildArray(sentence,true,true);
console.log(decoder(words));
