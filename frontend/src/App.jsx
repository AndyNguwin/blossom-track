import { Routes, Route } from 'react-router-dom'
import Dashboard from './pages/Dashboard'
import Login from './pages/Login'

function App() {
  return (
    <>
      <div>
        <Routes>
          <Route  path='/' element={<Dashboard/>}/>
          <Route  path='/dashboard' element={<Dashboard/>}/>
          <Route  path='/login' element={<Login/>}/>
          <Route  path='/habits' element={<Dashboard/>}/>
        </Routes>
      </div>
    </>
  )
}

export default App
