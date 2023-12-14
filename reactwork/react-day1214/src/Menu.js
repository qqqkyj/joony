import React from 'react';
import {NavLink} from 'react-router-dom';

function Menu(props) {
    return (
        <div>
            <ul className='menu'>
                <li><NavLink to='/'>Home</NavLink></li>
                <li><NavLink to='/about'>About</NavLink></li>
                <li><NavLink to='/about/Kang'>About2</NavLink></li>
                <li><NavLink to='/food/베베/나쵸'>점심메뉴</NavLink></li>
                <li><NavLink to='/food/그릭요거트/더단백'>저녁메뉴</NavLink></li>
            </ul>
        </div>
    );
}

export default Menu;