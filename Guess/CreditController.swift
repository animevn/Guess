import UIKit

class CreditController:UIViewController{
    
    @IBOutlet weak var bnBack: UIButton!
    
    @IBAction func bnBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
