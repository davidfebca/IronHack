var Car = function(model,noise){
  this.model = model;
  this.noise = noise;
  this.wheels = 4;
}
Car.prototype.makeNoise = function(){
  console.log(this.noise);
}
var car = new Car("Ferrari","Brooom brrooom");
car.makeNoise();
