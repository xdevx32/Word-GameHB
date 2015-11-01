//
//  main.swift
//  Word-GameHB
//
//  Created by Angel Kukushev on 10/31/15.
//  Copyright © 2015 xdevx332. All rights reserved.
//

import Foundation
//
//func input() -> String {
//    let keyboard = NSFileHandle.fileHandleWithStandardInput()
//    let inputData = keyboard.availableData
//    return NSString(data: inputData, encoding: NSUTF8StringEncoding) as! String
//}

func input() -> String {
    var keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = keyboard.availableData
    var strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    
    return strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
}
extension String {
    var length: Int {
        return characters.count
    }  // Swift 2.0
}


var NumRows = 4
var NumColumns = 5
var table = Array(count:NumColumns, repeatedValue:Array(count:NumRows, repeatedValue:String()))
print("Please input the charachters of your 4x5 table, by pressing Enter")

for i in 0...4{
    for j in 0...3{
       table[i][j] = input()
    }
}

print("Here's your table !")
for i in 0...4{
    for j in 0...3{
        print("\(table[i][j]) ", terminator: "")
    }
    print("\n")
}
print("Now please input the word you're searching for !")
var word: String = input()

// Possible words
var masterCount = 0
var wordCollection: [String] = ["","","","",""]

//var word1Rev: String = String(word1.characters.reverse())

// Checking the regular words

for w in 0...4{
    for i in 0...3{
        wordCollection[w] = wordCollection[w] + table[w][i]
    }
}

for i in 0...4{
    if wordCollection[i] == word{
        masterCount += 1
    }
}
// Checking the reversed words

for i in 0...4{
    if String(wordCollection[i].characters.reverse()) == word{
        masterCount += 1
    }
}

// Checking the diagonal words


print("\(masterCount)")
