const array=[1,2,3,4,5]; //3을 제거하고 싶다.
//const delIndex=2;

//splice
array.splice(2,1);//2번 인덱스를 1개만 삭제하겠다.
console.log(array);

//slice은 원본 배열은 건드리지 않고 수정된(복사)배열을 리턴한다(교체는 안됨)
//3,4를 출력
var array2=[1,2,3,4,5];
var a2 = array2.slice(2,4);//시작인덱스, 마지막인덱스-1(내가 뽑고자 하는 인덱스자리+1)
var a3 = array2.slice(1,4);
console.log(a2);
console.log(a3);

//Arrays.concat(value);
//concat메서드는 원하는 값을 원본배열에 추가한 뒤 새로운 배열을 만든다.
let con=[1,2,3].concat([4,5,],[6,7]);
console.log(con);

//filter, 이미지에서 x버튼 눌렀을 떄 삭제하고 싶을 때 사용됨
var arr = [1,2,3,4,5];//2를 제거하고 싶다.
var delIndex=1; //2의 인덱스가 1

arr=arr.filter(function(item,index){//filter안에 인자로 함수를 받고, index만 필요하니까 명시
   
    return index !== delIndex;//배열을 돌면서 인덱스 1이 아닌 나머지만 다시 소집한다.
})

console.log(arr);

