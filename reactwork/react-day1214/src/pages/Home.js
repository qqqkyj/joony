import React from 'react';
import { useNavigate } from 'react-router-dom';

function Home(props) {

    // 즉시 이동하는 것
    const nav1=useNavigate();

    return (
        <div>
            <button type='button' className='btn btn-info'
            onClick={()=>{
                nav1("/about");
            }}>About</button>
            <button type='button' className='btn btn-warning'
            onClick={()=>{
                nav1("/about/영자");
            }}>About2</button>
            <button type='button' className='btn btn-danger'
            onClick={()=>{
                nav1("/food/더단백/베베");
            }}>점심메뉴</button>
            <button type='button' className='btn btn-success'
            onClick={()=>{
                nav1("/food/그릭요거트/나쵸");
            }}>저녁메뉴</button>
        </div>
    );
}

export default Home;