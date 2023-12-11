import React from 'react';
import Alert from '@mui/material/Alert';
import img1 from '../image/맹구.png';
import img2 from '../image/짱구.png';
import img3 from '../image/훈이.png';
import img4 from '../image/해바라기.png';

function FiveApp(props) {

    //이미지를 배열변수에 넣기(src)
    const imgArr=[img1,img2,img3,img4];

    //이미지를 변수에 넣기(public)
    const imgArr2=['맹구','짱구','훈이','해바라기','noimg'];

    return (
        <div>
            <h3 className='alert alert-info'>FiveApp입니다.</h3>
            <Alert severity="warning">배열연습</Alert>
            <h4>src이 이미지를 배열로 넣어 반복하기</h4>

            {
                imgArr.map((myimg)=>(<img src={myimg} style={{width:'100px'}}/>))
            }

            <h4>src이 이미지를 배열로 넣어 반복하기</h4>
            {
                //예전방싣
                 //imgArr2.map((photo)=>(<img src={'../image2/'+photo+'.png'} className='photo'/>))

                //리터럴방식
                imgArr2.map((photo)=>(<img src={`../image2/${photo}.png`} className='photo'/>))
            
            }

        </div>
    );
}

export default FiveApp;