import UIKit

class CreditController:UIViewController{
    @IBOutlet weak var bnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bnBack.setTitle("Back", for: .normal)
    }
    
    @IBAction func bnBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
