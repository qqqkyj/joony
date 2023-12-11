import React from 'react';
import Alert from '@mui/material/Alert';
import AcUnitIcon from '@mui/icons-material/AcUnit';

function FourApp(props) {

    //배열변수선언
    const names=['영환','성경','호석','민규','성신','형준'];

    //반복문을 변수에 저장후 출력해도 된다
    const nameList=names.map((name)=>(<li>{name}</li>));

    //색상을 5개 배열로 주시고, 결과물을 div로 출력하세요(box로 className주고 할 것)
    const box=['red','orange','yellow','green','blue'];

    const boxList=box.map((color)=>(<div style={{backgroundColor:color, width:"500px"}}>wow</div>));

    return (
        <div>
            <h3 className='alert alert-info'>FourApp입니다.</h3>
            <Alert severity="error">배열연습<AcUnitIcon/></Alert>
            <hr/>
            {
                box.map((color)=>(<div className='box' style={{backgroundColor:color}}/> ))
            }
            <br/>
            <div>
                <h3>map연습</h3>
                <ol>
                    {
                        //반복문을 직접 리턴에 주기
                        names.map((name,index)=>(<b style={{marginLeft:'10px'}}>{index}:{name}</b>))
                    }    
                </ol>

                <ol>{nameList}</ol><br/>
                <ol>{boxList}</ol><br/>
            </div>
        </div>
    );
}

export default FourApp;