import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbMin: UILabel!
    @IBOutlet weak var lbMax: UILabel!
    @IBOutlet weak var sdChoose: UISlider!
    @IBOutlet weak var lbInform: UILabel!
    @IBOutlet weak var lbGuess: UILabel!

    var guessManager = GuessManager()

    private func updateUI() {
        lbMin.text = "\(guessManager.min)"
        lbMax.text = "\(guessManager.max)"
        lbInform.text = guessManager.informString
        lbGuess.text = guessManager.guessString
        sdChoose.maximumValue = Float(guessManager.max)
        sdChoose.minimumValue = Float(guessManager.min)
        sdChoose.value = sdChoose.minimumValue
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider(sdChoose: sdChoose)
        guessManager.start()
        updateUI()
    }

    @IBAction func onSliderChanged(_ sender: UISlider) {
        guessManager.setChoose(number: Int(sender.value))
    }

    private func showAlertWhenGuessRight(){
        let alert = UIAlertController(
                title: "Wow wow wow",
                message: guessManager.informString,
                preferredStyle: .alert)

        let actionOK = UIAlertAction(title: "OK",
                style: .default,
                handler: {action in
                    self.guessManager.start()
                    self.updateUI()
                })

        alert.addAction(actionOK)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onButtonOKPressed(_ sender: UIButton){
        guessManager.processInput()
        if guessManager.isRight{
            showAlertWhenGuessRight()
        }else {
            updateUI()
        }
    }

    private func showAlertWhenClickRestart(){
        let alert = UIAlertController(
                title: "Restart?",
                message: "Game data will be reset, continue?",
                preferredStyle: .alert)

        let actionOK = UIAlertAction(title: "OK",
                style: .default,
                handler: {action in
                    self.guessManager.start()
                    self.updateUI()
                })
        let actionCancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)

        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onButtonRestartPressed(_ sender: UIButton){
        showAlertWhenClickRestart()
    }
}
