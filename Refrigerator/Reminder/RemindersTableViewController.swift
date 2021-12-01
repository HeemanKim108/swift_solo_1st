
import UIKit

//protocol ReminderTableViewControllerDelegate: AnyObject {
//    func deliveryData(withText: String?)
//}

final class RemindersTableViewController: UITableViewController {
    
    private var dateFormat = DateFormatter()
    private var reminders: [String] = [
        "Yogurt",
    ]
    private var reminders2: [String] = [
        "2021-11-30",
    ]
    private var reminderMeat: [String] = [
        "Chicken"
    ]
    private var reminderFruit: [String] = [
        "Apple"
    ]
    private var reminderEtc: [String] = [
        "Ramen"
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
    //section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.reminders.count
        case 1:
            return self.reminderMeat.count
        case 2:
            return self.reminderFruit.count
        case 3:
            return self.reminderEtc.count
        default:
            return 0
        }
//        return reminders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell", for: indexPath)
        
        var text2: String = ""
        if indexPath.section == 0 {
            text2 = reminders[indexPath.row]
        } else if indexPath.section == 1 {
            text2 = reminderMeat[indexPath.row]
        } else if indexPath.section == 2 {
            text2 = reminderFruit[indexPath.row]
        } else if indexPath.section == 3 {
            text2 = reminderEtc[indexPath.row]
        }
        cell.textLabel?.text = text2
        
//        seperate cell
        
//        cell.textLabel?.text = reminders[indexPath.row]
        
        cell.detailTextLabel?.text = "Exp.date:\(reminders2[indexPath.row])"
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        
        return cell
    }
    
    //Using "if" to remove a row
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            reminders.remove(at: indexPath.row)
        } else if indexPath.section == 1 {
            reminderMeat.remove(at: indexPath.row)
        } else if indexPath.section == 2 {
            reminderFruit.remove(at: indexPath.row)
        } else if indexPath.section == 3 {
            reminderEtc.remove(at: indexPath.row)
        }
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    //section table
    
    //make section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    //title of section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "[Dairy product]"
        case 1:
            return "[Meat]"
        case 2:
            return "[Fruit]"
        case 3:
            return "[others]"
        default:
            return ""
        }
    }
}
//if I change "reminders" to "reminderMeat", I can put items in Meat section.

extension RemindersTableViewController: AddReminderViewControllerDelegate {
    func addNewReminder(withText text1: String?, withCategory text2: String?) {
        if let text = text2 {
            if text == "Dairy product" {
                if let text0 = text1 {
                    reminders.append(text0)
                    tableView.reloadData()
                }
            } else if text == "Meat" {
                if let text0 = text1 {
                    reminderMeat.append(text0)
                    tableView.reloadData()
                }
            } else if text == "Fruit" {
                if let text0 = text1 {
                    reminderFruit.append(text0)
                    tableView.reloadData()
                }
            } else if text == "others" {
                if let text0 = text1 {
                    reminderFruit.append(text0)
                    tableView.reloadData()
                }
            }
        }
    }
        
    func addNewDate(withText maybeText: String?) {
        if let text = maybeText {
            reminders2.append(text)
            tableView.reloadData()
            }
    }
//    func addNewReminder(withText maybeText: String?, withCategory maybeText2: String) {
//        if let text = maybeText {
//            reminders.append(text)
//            tableView.reloadData()
//        }
//    }
}
