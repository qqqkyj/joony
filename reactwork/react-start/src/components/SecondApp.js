import React from 'react';
import img1 from '../image/맹구.png';

// props는 추후 부모자식간의 이벤트를 주고 받을 때 사용
function SecondApp(props) {

    const imgstyle={
        width:'150px',
        height:'150px',
        border:'5px solid green',
        borderRadius:'100px'
    }

    let helloEle=<h2 className='line2'>Hello~~</h2>;

    return (
        <div>
            <h2 className='alert alert-danger'>SecondApp입니다.</h2>
            <img src={img1} style={imgstyle}/>
            {helloEle}
        </div>
    );
}



export default SecondApp;