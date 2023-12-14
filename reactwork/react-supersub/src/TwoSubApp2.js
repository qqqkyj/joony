import React, { useState } from 'react';

function TwoSubApp2(props) {

    const [color, setColor]=useState('');

    const buttonEvent=()=>{
        props.onAddColor(color);
    }

    return (
        <div style={{width:'500px'}}>
            <h4>Two2컴포넌트</h4>
            <div>
                <b>색상선택: </b>
                <input type='color' defaultValue='#ffccff'
                style={{width:'100px'}} onChange={(e)=>{
                    setColor(e.target.value);
                }}/>
                <button type='button' className='btn btn-info btn-sm'
                onClick={buttonEvent}>색상추가</button>
            </div>
        </div>
    );
}

export default TwoSubApp2;