//배열연습
var numbers=[1,2,3,4,5];
//map:Calls a defined callback function on each element of an array, and returns an array that contains the results.
var processd=numbers.map(function(num){
    return num*num;
});

console.log(processd);//1, 4, 9, 16, 25

var colors=['red','pink','gray','yellow','cyan'];

colors.map((color,index)=>{
    console.log(color,index);
})