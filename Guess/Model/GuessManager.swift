import UIKit

struct GuessManager{

    var target:Int = 0
    var choose:Int = 0
    var min:Int = 0
    var max:Int = 100
    var numOfGuess:Int = 0
    var informString:String = ""
    var guessString:String = ""
    var isRight = false

    mutating func setChoose(number:Int){
        choose = number
    }

    mutating func start(){
        target = 0
        choose = 0
        min = 0
        max = 100
        numOfGuess = 0
        isRight = false
        target = Int.random(in: 0...101)
        guessString = "Number of guess so far: 0"
        informString = "Waiting for your guess"
    }

    mutating  func processInput(){
        numOfGuess += 1
        guessString = "Number of guess so far: \(numOfGuess)"
        if choose == target{
            informString = "You got number \(target) right after \(numOfGuess) guess"
            isRight = true
        }else if choose > target{
            max = choose
            informString = "Sorry, please choose again :("
        }else {
            informString = "Sorry, please choose again :("
            min = choose
        }
    }
}
