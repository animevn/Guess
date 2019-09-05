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
    
    private func setButtonTitle(){
        bnOK.setTitle("OK", for: .normal)
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
    }
    
    private func setupViews(){
        min = 0
        max = 100
        target = Int(arc4random_uniform(101))
        step = 0
        lbReturn.text = ""
        lbStep.text = "Step  \(step)"
        sdChoose.value = 50
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonTitle()
        drawSlider()
        setupViews()
    }
    

    @IBAction func bnRestart(_ sender: UIButton) {
        
    }
    
    @IBAction func bnCredit(_ sender: UIButton) {
        performSegue(withIdentifier: "credit", sender: self)
    }
    
    
    

}

