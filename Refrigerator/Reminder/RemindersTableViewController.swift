
import UIKit


final class RemindersTableViewController: UITableViewController {
    
    private var dateFormat = DateFormatter()
    
    private var reminders: [String] = ["Yogurt"]
    private var reminderMeat: [String] = ["Chicken"]
    private var reminderFruit: [String] = ["Apple"]
    private var reminderEtc: [String] = ["Ramen"]
    private var reminders2: [String] = ["2021-12-06"]
    private var reminders2Meat: [String] = ["2021-12-08"]
    private var reminders2Fruit: [String] = ["2021-12-10"]
    private var reminders2Etc: [String] = ["2021-12-30"]
    
    
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
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
//        seperate cell
        
        
//do something to change detailText : color depends on date
        // how to get current time & convert to int => current time
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let nowDate = dateFormatter.string(from: now)
        let changeNowDate: String = nowDate.replacingOccurrences(of: "-", with: "")

        var text3: String = ""
        if indexPath.section == 0 {
            let changeDate: String = reminders2[indexPath.row].replacingOccurrences(of: "-", with: "")
            let convertDate = Int(changeDate)
            if let safeConvert = convertDate {
                let convertNowDate = Int(changeNowDate) //ex) 20210101
                if let safeConvertNowDate = convertNowDate {
                    if  safeConvert - safeConvertNowDate <= 3 {
                        var convertValue = String(safeConvert)
                        convertValue.insert("-", at: convertValue.index(convertValue.startIndex, offsetBy: 4))
                        convertValue.insert("-", at: convertValue.index(convertValue.endIndex, offsetBy: -2))
                        text3 = convertValue
                        cell.detailTextLabel?.text = "Exp.date:\(text3)"
                        cell.detailTextLabel?.textColor = .red
                    } else {
                        cell.detailTextLabel?.text = "Exp.date:\(text3)"
                        cell.detailTextLabel?.textColor = .black
                    }
                }
            }
        } else if indexPath.section == 1 {
            text3 = reminders2Meat[indexPath.row]
        } else if indexPath.section == 2 {
            text3 = reminders2Fruit[indexPath.row]
        } else if indexPath.section == 3 {
            text3 = reminders2Etc[indexPath.row]
        }
//        cell.detailTextLabel?.text = "Exp.date:\(text3)"
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        
        
        

        
        let changeDate: String = reminders2[indexPath.row].replacingOccurrences(of: "-", with: "")

        let convertDate = Int(changeDate)
        if let safeConvert = convertDate {
            let convertNowDate = Int(changeNowDate) //ex) 20210101
            if let safeConvertNowDate = convertNowDate {
                if  safeConvert - safeConvertNowDate <= 3 {
                    var convertValue = String(safeConvert)
                    convertValue.insert("-", at: convertValue.index(convertValue.startIndex, offsetBy: 4))
                    convertValue.insert("-", at: convertValue.index(convertValue.endIndex, offsetBy: -2))
                    text3 = convertValue
                    cell.detailTextLabel?.text = "Exp.date:\(text3)"
                    cell.detailTextLabel?.textColor = .red
                } else {
                    cell.detailTextLabel?.text = "Exp.date:\(reminders2[indexPath.row])"
                    cell.detailTextLabel?.textColor = .black
                }
            }
        }
//
        
//        cell.textLabel?.text = reminders[indexPath.row]
        
//        cell.detailTextLabel?.text = "Exp.date:\(reminders2[indexPath.row])"
//        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
//        cell.detailTextLabel?.textColor = .red
        
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
                    reminderEtc.append(text0)
                    tableView.reloadData()
                }
            }
        }
    }
        
    func addNewDate(withText text1: String?, withCategory text2: String?) {
        if let text = text2 {
            if text == "Dairy product" {
                if let text0 = text1 {
                    reminders2.append(text0)
                    tableView.reloadData()
                }
            } else if text == "Meat" {
                if let text0 = text1 {
                    reminders2Meat.append(text0)
                    tableView.reloadData()
                }
            } else if text == "Fruit" {
                if let text0 = text1 {
                    reminders2Fruit.append(text0)
                    tableView.reloadData()
                }
            } else if text == "others" {
                if let text0 = text1 {
                    reminders2Etc.append(text0)
                    tableView.reloadData()
                }
            }
        }
    }
//    func addNewDate(withText maybeText: String?) {
//        if let text = maybeText {
//            reminders2.append(text)
//            tableView.reloadData()
//            }
//    }
}
