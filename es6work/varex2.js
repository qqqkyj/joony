/*
var:함수형변수
let:영역형변수(변수 재선언 안됨)
const:영역형변수 상수(FINAL)
*/

//var Test:재선언 가능, 업데이트 가능
var Hello="안녕";
var Hello="헬루우";
var cnt=5;

if(cnt<6){
    var Hello1="say hello~";
    console.log(Hello1);
}

console.log(Hello1);
console.log(Hello);

/*
say hello~
say hello~
헬루우
*/

let a="안녕";
//let a="하이";재선언시 에러

//let Test:재선언 불가능 but 업데이트는 가능(영역에서 벗어나면 undefined)
let hi="hi";
hi="하이라고 할게";

let times = 5;

if(times>3){
    let hi1 = "say hi~";
    console.log(hi1);
}

//console.log(hi1);
console.log(hi);

//const Test:업데이트 안됨, 재선언 안됨
//json방식으로 출력가능
const hi3={
    message:"3th say hi~~",
    times:3
}

/*hi3={
    message:"4th say hi~~",
    times:4
}*/

hi3.message="이렇게는 될까?";
hi3.times=4;

console.log(hi3);