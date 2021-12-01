
import UIKit

//"protocol" = "interface"
protocol AddReminderViewControllerDelegate: AnyObject {
//    func addNewReminder(withText: String?)
    func addNewReminder(withText: String?, withCategory: String?)
    func addNewDate(withText: String?)
}

class AddReminderViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
        
    //Interface Builder
    @IBOutlet weak var newReminderTextField: UITextField!
    weak var delegate: AddReminderViewControllerDelegate? = nil
        
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet var lblPickerTime: UILabel!
    @IBOutlet weak var lblPickerView: UILabel!
        
    //Make PickerView
    var dataList = [
        "Dairy product",
        "Meat",
        "Fruit",
        "others"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataList[row]
    }
    //func definition & sort
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblPickerView.text = dataList[row]
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        lblPickerTime.text = formatter.string(from: datePickerView.date)
    }
    
    
    @IBAction func didTapCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {
            debugPrint("Finished dismissing!")
        }
    }
    
    @IBAction func didTapSaveButton(_ sender: UIBarButtonItem) {
        delegate?.addNewReminder(withText: newReminderTextField.text , withCategory: lblPickerView.text)
        delegate?.addNewDate(withText: lblPickerTime.text)
        dismiss(animated: true) {
            debugPrint("Finished dismissing!")
    }
}
    
}


