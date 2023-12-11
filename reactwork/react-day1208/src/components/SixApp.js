import React, { useState } from 'react';
import Alert from '@mui/material/Alert';

function SixApp(props) {

    const[names,setNames]=useState(['진평','현규','희찬','민규','성신']);
    const[irum,setIrum]=useState('');

    //추가버튼 이벤트
    const btnInsert=()=>{
        setNames(names.concat(irum));//배열에 irum 데이터를 추가
        setIrum('');//배열에 추가 후 초기화
    }

    //Enter이벤트
    const txtEnter=(e)=>{
        if(e.key==='Enter'){
            btnInsert();
        }
    }

    //input창에 입력이 되도록... 이벤트
    const txtInput=(e)=>{
        setIrum(e.target.value);
    }

    //더블클릭시 삭제
    const dataRemove=(index)=>{
        console.log("remove: "+index);

        //방법1.slice
        /*setNames([
            //선택한 index만 제거하고 뒷부분을 다시 붙여서 설정
            ...names.slice(0,index),
            ...names.slice(index+1,names.length)
        ])*/

        //방법2.filter
        //i에서 index가 아닌것만 넣어준다.
        setNames(names.filter((item,i)=>i!==index));

    }

    return (
        <div>
            <h3 className='alert alert-info'>SixApp입니다.</h3>
            <Alert severity="error">배열연습</Alert>

            <input value={irum} onChange={txtInput} onKeyUp={txtEnter} placeholder='이름입력'/>
            <button type='button' onClick={btnInsert} className='btn btn-info' style={{marginLeft:'10px'}}>추가</button>
            <br/>
            <h4>이름을 더블클리하면 삭제됩니다.</h4>
            <ul>
                {
                    names.map((name, index)=>(<li className='data'
                    onDoubleClick={()=>dataRemove(index)}>{name}</li>))
                }
            </ul>

        </div>
    );
}

export default SixApp;