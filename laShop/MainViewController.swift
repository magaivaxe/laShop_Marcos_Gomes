//=======================================
import UIKit
//=======================================
class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    //---------------------------//--------------------------- MARK: -------> IBOutlets
    @IBOutlet weak var tableView: UITableView!
    //---------------------------//--------------------------- MARK: -------> Properties
    var titles = ["CAMÉRAS", "LENTILLES", "TRÉPIEDS"]
    var numberOfElementsInSections: [Int]!
    var inventory =
    ["CAMÉRAS" :
        [
            ["CAMÉRA 1" : "DESCRIPTION CAMÉRA 1"],
            ["CAMÉRA 2" : "DESCRIPTION CAMÉRA 2"],
            ["CAMÉRA 3" : "DESCRIPTION CAMÉRA 3"],
            ["CAMÉRA 4" : "DESCRIPTION CAMÉRA 4"],
            ["CAMÉRA 5" : "DESCRIPTION CAMÉRA 5"]
        ],
    "LENTILLES" :
        [
            ["LENTILLES 1" : "DESCRIPTION LENTILLES 1"],
            ["LENTILLES 2" : "DESCRIPTION LENTILLES 2"],
            ["LENTILLES 3" : "DESCRIPTION LENTILLES 3"]
        ],
    "TRÉPIEDS" :
        [
            ["TRÉPIED 1" : "DESCRIPTION TRÉPIED 1"],
            ["TRÉPIED 2" : "DESCRIPTION TRÉPIED 2"],
            ["TRÉPIED 3" : "DESCRIPTION TRÉPIED 3"],
            ["TRÉPIED 4" : "DESCRIPTION TRÉPIED 4"]
        ]
    ]
    //---------------------------//--------------------------- MARK: -------> viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfElementsInSections = [inventory["CAMÉRAS"]!.count, inventory["LENTILLES"]!.count, inventory["TRÉPIEDS"]!.count]
    }
    //---------------------------//--------------------------- MARK: -------> TableView Section Stuff
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let title = UILabel()
        //title.font = UIFont(name: "MyriadPro-Regular", size: 20)!
        title.textColor = UIColor.white
        let header = view as! UITableViewHeaderFooterView
        header.tintColor = UIColor(red: (111/255), green: (96/255), blue: (73/255), alpha: 1.0)
        header.textLabel?.font = title.font
        header.textLabel?.textColor = title.textColor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        return numberOfElementsInSections[section]
    }
    //---------------------------//--------------------------- MARK: -------> TableView Stuff
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return [String](inventory.keys).sorted()[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:Parser1 = self.tableView.dequeueReusableCell(withIdentifier: "shop") as! Parser1
        cell.backgroundColor = UIColor.clear
        
//        if let theTextView = cell.viewWithTag(100) as? UITextView {
//            theTextView.text = [String](inventory.keys).sorted()[indexPath.row]
//        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    //-----------------------------------
}
//=======================================









