//rsf: function
//rcc: class
import React from 'react';
import './Mystyle.css'; //같은 폴더면 앞에 . 상위폴더면 .. 
import img1 from '../image/맹구.png';
import img2 from '../image/짱구.png';

function FirstApp(props) {

    //스타일은 변수에 지정
    const styleImg1={
        width:'200px',
        border:'5px solid green',
        marginTop: '20px'
    }

    return (
        <div>
            <h2 className='line2'>FirstApp Component!!</h2>
            <div style={{fontSize:'25px', marginLeft:'100px', backgroundColor:'lightgray'}}>
                안녕~~ 오늘은 목요일이야!!
            </div>
            {/* src의 이미지는 Import */}
            <img style={styleImg1} src={img1}/>
            <img style={{width:'200px', border:'3px dotted orange', marginLeft:'10px', marginTop:'20px'}} src={img2}/>

            {/* public image는 직접 호출가능 */}
            <h3>public image</h3>
            <img src='../image2/noimg.png' />
        </div>
    );
}

export default FirstApp;