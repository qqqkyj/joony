//import logo from './logo.svg';
import './App.css';

function App() {//모든 태그는 짝이 맞아야 되고 return에는 하나의 div만 넣을 수 있음
  return (
    <div className="App">
      {/* <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          리액트 시작!!<br/><hr/>
        </a>
      </header> */}
      
      <h3 className='alert alert-info'>오늘부터 리액트 시작!!</h3>
    </div>
  );
}

export default App;
