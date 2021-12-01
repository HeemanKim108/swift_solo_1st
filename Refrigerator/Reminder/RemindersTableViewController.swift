
import UIKit

//protocol ReminderTableViewControllerDelegate: AnyObject {
//    func deliveryData(withText: String?)
//}

final class RemindersTableViewController: UITableViewController {
    
    private var dateFormat = DateFormatter()
    private var reminders: [String] = [
        "Test",
    ]
    private var reminders2: [String] = [
        "2021-11-30",
    ]
    
    override func viewDidLoad() {
        dateFormat.dateFormat = "yyyy-MM-dd"
        dateFormat.locale = Locale.init(identifier: "en_JP")
        super.viewDidLoad()
        tableView.allowsSelection = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationVC = segue.destination as? UINavigationController,
           let addReminderVC = navigationVC.topViewController as? AddReminderViewController {
            addReminderVC.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let row = list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell", for: indexPath)
        
        cell.textLabel?.text = reminders[indexPath.row]
        cell.detailTextLabel?.text = "Exp.date:\(reminders2[indexPath.row])"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        reminders.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    //make section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    //title of section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "ABC"
        case 1:
            return "DEF"
        default:
            return ""
        }
    }
}

extension RemindersTableViewController: AddReminderViewControllerDelegate {
    func addNewDate(withText maybeText: String?) {
        if let text = maybeText {
            reminders2.append(text)
            tableView.reloadData()
            }
    }
    func addNewReminder(withText maybeText: String?) {
        if let text = maybeText {
            reminders.append(text)
            tableView.reloadData()
        }
    }
}
