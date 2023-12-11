import React, { useState } from 'react';
import img1 from '../image/맹구.png';

function FourthApp(props) {

    const [name,setName]=useState('장순영');
    const[age,setAge]=useState(22);

    return (
        <div>
            <h3 className='alert alert-warning'>FourthApp입니다.
            <img src={img1} style={{width:'50px'}} className='img-thumbnail'/></h3>
            <b style={{fontSize:'30px'}}>이름:{name}  <span style={{marginLeft:'20px'}}>나이:{age}세</span></b>
            <br/>
            <button type='button' className='btn btn-success' onClick={()=>{
                setName('김영환');
                setAge(25);
            }}>값변경</button>
            <button type='button' className='btn btn-info' style={{marginLeft:'10px'}} onClick={()=>{
                setName('장순영');
                setAge(22);
            }}>초기화</button>
        </div>
    );
}

export default FourthApp;