
import React, { useState } from 'react';

function TwoApp(props) {

    const[photo, setPhoto]=useState('../image2/짱구.png');

    const changPhoto=(e)=>{
        setPhoto(e.target.value);
    }

    return (
        <div>
            <h3 className='alert alert-info'>TwoApp입니다_Radio버튼</h3>
            <div>
                <b>이미지 선택: </b>
                <label>
                    <input type='radio' name='photo' value='../image2/맹구.png' onChange={changPhoto}/>이미지1
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type='radio' name='photo' value='../image2/짱구.png' onChange={changPhoto} defaultChecked/>이미지2
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type='radio' name='photo' value='../image2/훈이.png' onChange={changPhoto}/>이미지3
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type='radio' name='photo' value='../image2/해바라기.png' onChange={changPhoto}/>이미지4
                </label>
                &nbsp;&nbsp;
            </div>

            <img src={photo} style={{width:'700px'}}/>

        </div>
    );
}

export default TwoApp;