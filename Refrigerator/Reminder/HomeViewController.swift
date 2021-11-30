
import UIKit

class HomeViewController: UIViewController {
    let fridgeOpen = UIImage(named: "B")
    let fridgeClose = UIImage(named: "A")
    var isFridgeOn = false
    
    @IBOutlet var Fridge: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Fridge.image = fridgeClose
    }
    
    
    @IBAction func Open(_ sender: UIButton) {
        if isFridgeOn == true {
            let openAlert = UIAlertController(title: "Start", message: "Fridge has already opened", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            openAlert.addAction(onAction)
            present(openAlert, animated: true, completion: nil)
            
            isFridgeOn = true
        }else{
            let closeAlert = UIAlertController(title: "Start", message: "Please check exp.date", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "yes", style: UIAlertAction.Style.default, handler: {ACTION in self.Fridge.image =
                self.fridgeOpen
                self.isFridgeOn = true
            })
            let cancleAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
            closeAlert.addAction(offAction)
            closeAlert.addAction(cancleAction)
            
            present(closeAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func Close(_ sender: UIButton) {
        if isFridgeOn == false {
            let openAlert = UIAlertController(title: "!!!", message: "Fridge has already closed", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            openAlert.addAction(onAction)
            present(openAlert, animated: true, completion: nil)
            
            isFridgeOn = false
        }else{
            let closeAlert = UIAlertController(title: "End", message: "Did you check everything?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "yes", style: UIAlertAction.Style.default, handler: {ACTION in self.Fridge.image =
                self.fridgeClose
                self.isFridgeOn = false
            })
            let cancleAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
            closeAlert.addAction(offAction)
            closeAlert.addAction(cancleAction)
            
            present(closeAlert, animated: true, completion: nil)
        }
    }
}
