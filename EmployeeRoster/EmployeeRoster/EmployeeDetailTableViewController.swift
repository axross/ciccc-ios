
import UIKit

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate, EmployeeTypeDelegate {

    struct PropertyKeys {
        static let unwindToListIndentifier = "UnwindToListSegue"
    }
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var employeeTypeLabel: UILabel!
    @IBOutlet weak var dobDatePickerCell: UITableViewCell!
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    
    var employee: Employee?
    var employeeType: EmployeeType?
    
    var isEditingBirthday: Bool = false {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dobLabel.text = dateFormatter.string(from: employee.dateOfBirth)
            dobLabel.textColor = .black
            employeeTypeLabel.text = employee.employeeType.description()
            employeeTypeLabel.textColor = .black
        } else {
            navigationItem.title = "New Employee"
        }
        
        if let employeeType = employeeType {
            employeeTypeLabel.textColor = .black
            employeeTypeLabel.text = employeeType.description()
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let name = nameTextField.text {
            employee = Employee(name: name, dateOfBirth: dobDatePicker.date, employeeType: employeeType!)
            performSegue(withIdentifier: PropertyKeys.unwindToListIndentifier, sender: self)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        employee = nil
        performSegue(withIdentifier: PropertyKeys.unwindToListIndentifier, sender: self)
    }
    
    // MARK: - Text Field Delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath == tableView.indexPath(for: dobDatePickerCell) {
        if indexPath.section == 0 && indexPath.row == 2 {
            return isEditingBirthday ? dobDatePicker.frame.height : 0
        }
        
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 1 {
            isEditingBirthday = !isEditingBirthday
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    @IBAction func onDobDatePickerChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        
        dobLabel.textColor = .black
        dobLabel.text = dateFormatter.string(from: sender.date)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChooseEmployeeType" {
            let employeeTypeTVC = segue.destination as! EmployeeTypeTableViewController
            
            employeeTypeTVC.delegate = self
        }
    }
    
    func didSelect(employeeType: EmployeeType) {
        self.employeeType = employeeType
        
        updateView()
    }
}
