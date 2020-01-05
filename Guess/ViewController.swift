import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sdChoose: UISlider!
    @IBOutlet weak var lbMin: UILabel!
    @IBOutlet weak var lbMax: UILabel!
    @IBOutlet weak var lbReturn: UILabel!
    @IBOutlet weak var lbStep: UILabel!
    @IBOutlet weak var bnOK: UIButton!
    
    private var target = 0
    private var input = 0
    private var max = 100
    private var min = 0
    private var step = 0
    
    private func setupSlider(){
        sdChoose.setThumbImage(UIImage(named: "sliderThumbNormal"), for: .normal)
        sdChoose.setThumbImage(UIImage(named: "sliderThumbHighlight"), for: .highlighted)
        
        let inset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        
        let leftTrack = UIImage(named: "sliderTrackerLeft")
        let leftImage = leftTrack!.resizableImage(withCapInsets: inset)
        sdChoose.setMinimumTrackImage(leftImage, for: .normal)
        
        let rightTrack = UIImage(named: "sliderTrackerRight")
        let rightImage = rightTrack!.resizableImage(withCapInsets: inset)
        sdChoose.setMaximumTrackImage(rightImage, for: .normal)
    }
    
    private func setupLabels(){
        lbMin.text = "0"
        lbMax.text = "100"
        lbReturn.text = "Waiting for your guess"
        lbStep.text = "Number of guess so far: 0"
    }
    
    private func startGame(){
        setupLabels()
        target = 0
        input = 0
        max = 100
        min = 0
        step = 0
        target = Int(arc4random_uniform(101))
        sdChoose.maximumValue = 100
        sdChoose.minimumValue = 0
        sdChoose.value = 50
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
        startGame()
    }
    
    @IBAction func onSliderChange(_ sender: Any) {
        input = Int(sdChoose.value)
    }
    
    private func showAlertWhenInputIsRight(){
        let alert = UIAlertController(
            title: "Wow",
            message: "You guess number \(target) right after \(step) guess",
            preferredStyle: .alert)
        let actionOK = UIAlertAction(
            title: "OK",
            style: .default,
            handler: {action in self.startGame()})
        alert.addAction(actionOK)
        present(alert, animated: true, completion: nil)
    }
    
    private func handleInput(){
        step += 1
        lbStep.text = "Number of guess so far \(step)"
        if input == target{
            showAlertWhenInputIsRight()
        }else if input > target{
            max = input
            lbReturn.text = "Wrong guess, try again"
            lbMax.text = "\(max)"
            sdChoose.maximumValue = Float(max)
            sdChoose.value = Float((max + min)/2)
        }else{
            min = input
            lbReturn.text = "Wrong guess, try again"
            lbMin.text = "\(min)"
            sdChoose.minimumValue = Float(min)
            sdChoose.value = Float((max + min)/2)
        }
    }
    
    @IBAction func bnOk(_ sender: UIButton) {
        handleInput()
    }
    
    private func showAlertWhenClickRestart(){
        let alert = UIAlertController(
            title: "Wanna restart game?",
            message: "Game data will be clear",
            preferredStyle: .alert)
        let actionOK = UIAlertAction(
            title: "OK",
            style: .default,
            handler: {action in self.startGame()})
        let actionCancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func bnRestart(_ sender: UIButton) {
        showAlertWhenClickRestart()
    }
    
    @IBAction func bnCredit(_ sender: UIButton) {
        performSegue(withIdentifier: "credit", sender: sender)
    }
}

