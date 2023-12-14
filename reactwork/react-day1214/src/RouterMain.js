import React from 'react';
import Menu from './Menu';
import { Route, Routes } from 'react-router-dom';
import {Home, About, Food} from './pages';
import mainimg from './image/맹구.png';
import mainimg2 from './image/짱구.png';

function RouterMain(props) {
    return (
        <div>
            {/* 모든 페이지에서 공통으로 포함되는 컴포넌트나 이미지 */}
            <h1 className='alert alert-info'>React Router 공부하기</h1>
            <Menu/>
            <img src={mainimg} className='main_photo'/>
            <hr className='line'/>

            <div className='main_comp'>
                <Routes>
                    <Route path='/' element={<Home/>} />
                    <Route path='/about' element={<About/>}/>
                    <Route path='/about/:name' element={<About/>}/>
                    {/* name을 파라메타로 넘기겠다는 것 */}
                    <Route path='/login/*' element={
                        <div>
                            <h1>아직 로그인기능구현 전입니다.</h1>
                            <img src={mainimg2}/>
                            <h3>오늘 점심 이거 어때?</h3>
                        </div>
                    }/>

                    {/* 그 이외 맵핑이면... */}
                    <Route path='*' element={
                        <h1>잘못된 주소입니다.</h1>
                    }/>
                    <Route path='/food/:food1/:food2' element={<Food/>}/>

                </Routes>
            </div>
        </div>
    );
}

export default RouterMain;