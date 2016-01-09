//
//  main.swift
//  LotteryPicks
//
//  Created by Hans van Riet on 11/10/14.
//  Copyright (c) 2014 Hans van Riet. All rights reserved.
//

import Foundation

/* 
    PowerBall Rules:
    5 numbers from 1 to 75 (inclusive)
    1 Mega number from 1 to 15 (inclusive)
*/

let bottomNumber = 1
let topNumber: UInt32 = 69
let numNumbers = 5

let bottomMega = 1
let topMega: UInt32 = 26
let numMega = 1


func drawNumbers(lowerLimit: Int, upperLimit: UInt32, amount: Int) -> Array<Int> {
    
    var currentPick: Int
    
    // init an empty array
    var lotteryPicks = Array<Int>()
    
    // Loop for until array is full
    repeat {
        // Generate a random number and put it in the array if it's unique
        currentPick = lowerLimit + Int(arc4random_uniform(upperLimit))
        if !(lotteryPicks.contains(currentPick)) {
                lotteryPicks.append(currentPick)
            }
    } while (lotteryPicks.count < amount)
    
    lotteryPicks.sortInPlace { $0 < $1 }
    
    return lotteryPicks
}

print("Generating 10 Powerball quick picks for you.\n")

for _ in 1...10 {

    print("Lottery numbers:  ", terminator: "")
    print(drawNumbers(bottomNumber, upperLimit: topNumber, amount: numNumbers))

    print("Powerball number: ", terminator: "")
    print(drawNumbers(bottomMega, upperLimit: topMega, amount: numMega))
    


}