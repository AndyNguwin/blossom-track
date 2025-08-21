import React from 'react'
import '../theme.css'

function Navbar() {
  return (
    <div>
        <div class='bg-white text-white flex flex-1 flex-row items-center justify-between pl-2 pr-2 pt-3 pb-3'>
          <div class='flex flex-row items-center gap-4'>
            <div class='flex flex-row'>
              <h1 class='text-pink-main font-merriweather text-4xl'>Blossom</h1>
              <h1 class='text-gray font-merriweather text-4xl'>Track</h1>
            </div>
            <p class='text-gray font-nunito font-semibold text-20px'>Dashboard</p>
            <p class='text-gray font-nunito font-semibold text-20px'>Habit List</p>
          </div>
          <p class='text-gray font-nunito font-semibold text-20px'>Sign Out</p>
        </div>
    </div>
  )
}

export default Navbar