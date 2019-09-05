import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sdChoose: UISlider!
    @IBOutlet weak var lbMin: UILabel!
    @IBOutlet weak var lbMax: UILabel!
    @IBOutlet weak var lbReturn: UILabel!
    @IBOutlet weak var lbStep: UILabel!
    @IBOutlet weak var bnOK: UIButton!
    
    private var min = 0
    private var max = 100
    private var step = 0
    private var target = 0
    private var input = 0
    
    private func setButtonTitle(){
        bnOK.setTitle("OK", for: .normal)
    }
    
    @objc private func onSliderMove(){
        input = Int(sdChoose.value)
    }
    
    private func drawSlider(){
        sdChoose.setThumbImage(UIImage(named: "sliderThumbNormal"), for: .normal)
        sdChoose.setThumbImage(UIImage(named: "sliderThumbHighlight"), for: .highlighted)
        
        let inset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        
        let leftImage = UIImage(named: "sliderTrackerLeft")
        let leftTrack = leftImage?.resizableImage(withCapInsets: inset)
        sdChoose.setMinimumTrackImage(leftTrack, for: .normal)
        
        let rightImage = UIImage(named: "sliderTrackerRight")
        let rightTrack = rightImage!.resizableImage(withCapInsets: inset)
        sdChoose.setMaximumTrackImage(rightTrack, for: .normal)
        
        sdChoose.addTarget(self, action: #selector(onSliderMove), for: .valueChanged)
    }
    
    private func setupViews(){
        min = 0
        max = 100
        target = Int(arc4random_uniform(101))
        step = 0
        lbReturn.text = ""
        lbMin.text = "0"
        lbMax.text = "100"
        lbStep.text = "Step  \(step)"
        sdChoose.minimumValue = 0
        sdChoose.maximumValue = 100
        sdChoose.value = 50
        input = Int(sdChoose.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonTitle()
        setupViews()
        drawSlider()
    }
    
    private func showAlertIfGuessRight(){
        let alert = UIAlertController(
            title: "Wow",
            message: "You get number \"\(input)\" right in just \(step) steps",
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {action in
            self.setupViews()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func processInput(){
        lbReturn.text = ""
        if input == target{
            showAlertIfGuessRight()
        }else if input > target{
            step += 1
            lbReturn.text = "You've chosen \(input), which is wrong 😂"
            max = input
            lbMax.text = "\(input)"
            sdChoose.maximumValue = Float(input)
            lbStep.text = "\(step)"
        }else if input < target{
            step += 1
            lbReturn.text = "You've chosen \(input), which is wrong 😂"
            min = input
            lbMin.text = "\(input)"
            sdChoose.minimumValue = Float(input)
            lbStep.text = "\(step)"
        }
        
    }
    
    @IBAction func bnOk(_ sender: UIButton) {
        processInput()
    }
    
    @IBAction func bnRestart(_ sender: UIButton) {
        setupViews()
    }
    
    @IBAction func bnCredit(_ sender: UIButton) {
        performSegue(withIdentifier: "credit", sender: self)
    }
}

