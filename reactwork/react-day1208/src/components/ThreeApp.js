import React, { useState } from 'react';
import img1 from '../image/맹구.png';
import img2 from '../image/짱구.png';
import img3 from '../image/훈이.png';
import img4 from '../image/해바라기.png';
import img5 from '../image/noimg.png';

function ThreeApp(props) {

    const[hp1, setHp1]=useState('02');
    const[hp2, setHp2]=useState('1111');
    const[hp3, setHp3]=useState('2222');
    const[photo,setPhoto]=useState(1);

    const changeHp1=(e)=>{
        setHp1(e.target.value);
    }
    
    const changeHp2=(e)=>{
        setHp2(e.target.value);
    }

    const changeHp3=(e)=>{
        setHp3(e.target.value);
    }

    const changePhoto=(e)=>{
        
        let img=e.target.value;
        setPhoto(img==1?img1:img==2?img2:img==3?img3:img==4?img4:img5);
    }


    return (
        <div>
            <h3 className='alert alert-info'>ThreeApp입니다._문제1</h3>
            <div className='d-inline-flex' style={{height:'50px'}}>
                <select style={{width:'100px'}} onChange={changeHp1}>
                    <option value='02'>02</option>
                    <option value='010'>010</option>
                    <option value='031'>031</option>
                    <option value='017'>017</option>
                    <option value='052'>052</option>
                </select>
                <b>-</b>
                <input type='text' maxLength='4' className='form-control' style={{width:'120px'}} onKeyUp={changeHp2}/>
                <b>-</b>
                <input type='text' maxLength='4' className='form-control' style={{width:'120px'}} onKeyUp={changeHp3}/>

                <b style={{marginLeft:'50px', width:'50px'}}>이미지 선택: </b>
                <select className='form-control' onChange={changePhoto}>
                    <option value='1'>이미지1</option>
                    <option value='2'>이미지2</option>
                    <option value='3'>이미지3</option>
                    <option value='4'>이미지4</option>
                    <option value='5' selected>이미지5</option>
                </select>
            </div>

            <br/><br/>
            {hp1}-{hp2}-{hp3}<br/>
            <img src={photo} style={{width:'500px'}}/>

        </div>
    );
}

export default ThreeApp;