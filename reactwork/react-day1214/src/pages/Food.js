import React from 'react';
import { useNavigate, useParams } from 'react-router-dom';

function Food(props) {

    const {food1,food2}=useParams();

    const nav1=useNavigate();

    return (
        <div>
            <h3>오늘 식사 메뉴</h3>
            <button type='button' className='btn btn-info' 
            onClick={()=>{
                nav1(-1);
            }}>이전페이지</button>
            <img src={`../../image2/${food1}.PNG`} className='img-thumbnail'
            style={{width:'200px', height:'200px'}}/>
            <img src={`../../image2/${food2}.PNG`} className='img-thumbnail'
            style={{width:'200px', height:'200px'}}/>
        </div>
    );
}

export default Food;