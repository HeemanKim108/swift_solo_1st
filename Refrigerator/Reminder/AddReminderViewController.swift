
import UIKit

//"protocol" = "interface"
protocol AddReminderViewControllerDelegate: AnyObject {
    func addNewReminder(withText: String?)
    func addNewDate(withText: String?)
}

class AddReminderViewController: UIViewController {
    //Interface Builder
    @IBOutlet weak var newReminderTextField: UITextField!
    weak var delegate: AddReminderViewControllerDelegate? = nil
        
    @IBOutlet var lblPickerTime: UILabel!
    
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
        delegate?.addNewReminder(withText: newReminderTextField.text)
        delegate?.addNewDate(withText: lblPickerTime.text)
        
        dismiss(animated: true) {
            debugPrint("Finished dismissing!")
    }
}
}


