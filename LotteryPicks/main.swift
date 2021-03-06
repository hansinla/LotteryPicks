//  main.swift
//  LotteryPicks
//
//  Created by Hans van Riet on 11/10/14.
//  Copyright (c) 2014 Hans van Riet. All rights reserved.

import Foundation

/*  PowerBall Rules:
    5 numbers from 1 to 69 (inclusive)
    1 PowerBall number from 1 to 26 (inclusive)
*/

let bottomNumber = 1
let topNumber: UInt32 = 69
let numNumbers = 5

let bottomMega = 1
let topMega: UInt32 = 26
let numMega = 1


func drawNumbers(_ lowerLimit: Int, upperLimit: UInt32, amount: Int) -> Array<Int> {
    
    var currentPick: Int
    var lotteryPicks = Array<Int>() // init an empty array
    
    repeat {
        // Generate a random number and put it in the array if it's unique
        currentPick = lowerLimit + Int(arc4random_uniform(upperLimit))
        if !(lotteryPicks.contains(currentPick)) {
                lotteryPicks.append(currentPick)
            }
    } while (lotteryPicks.count < amount) // Loop for until array is full
    
    lotteryPicks.sort { $0 < $1 } // sort the array for output
    
    return lotteryPicks
}

print("Generating 5 Powerball quick picks for you.\n")

for _ in 1...5 {

    print("Lottery numbers:  ", terminator: "")
    print(drawNumbers(bottomNumber, upperLimit: topNumber, amount: numNumbers))

    print("Powerball number: ", terminator: "")
    print(drawNumbers(bottomMega, upperLimit: topMega, amount: numMega))
    
    print()
    

}
