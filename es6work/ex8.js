//es6 좀 더 언어적으로 바뀜, Set, Map가능(컬렉션)
let set = new Set("abcccdddeeefffff");//중복문자 걸러냄
console.log(set);

set.add("g");//없으니깐 추가 가능
console.log(set);

console.log(set.has("a"));//포함하면 true
console.log(set.has("h"));//안포함하면 false
console.log("길이: "+set.size);

console.log(...set);//중복없이 set을 펼쳐줌
set.delete("a");//하나씩 삭제
console.log(...set);

set.clear();//전체삭제
console.log(set.size);

//비교연산자
let a=6;
let b="6";

console.log(a==b);//값으로만 비교(true)
console.log(a===b);//값과 타입이 같아야 됨(false)