import React from 'react'
import Navbar from '../components/Navbar'

function Login() {
  return (
    <div>
      <Navbar/>
      <div class="flex w-screen h-screen flex-col pt-15 items-center">
        <div class="card w-xl basis-lg bg-white justify-center">
          <div class="rounded-t-[0.5em] bg-pink-main flex justify-center">
            <h2 class="card-title font-merriweather text-6xl text-white px-3 py-3">Welcome!</h2>
          </div>
          <div class="flex basis-full flex-col justify-center items-center gap-5 m-5 pb-6">
            <div>
              <p class="font-nunito font-semibold text-lg text-black">Email Address</p>
              <input id="user_email" type="text" placeholder="Type here" className="input bg-cream border border-pink-main border-2 w-md" />
            </div>
            <div>
              <p class="font-nunito font-semibold text-lg text-black">Password</p>
              <input id="user_password" type="password" placeholder="Type here" className="input bg-cream border border-pink-main border-2 w-md" />
            </div>
            <button className="btn w-50 text-white font-merriweather text-lg bg-pink-main border-0">Sign In</button>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Login