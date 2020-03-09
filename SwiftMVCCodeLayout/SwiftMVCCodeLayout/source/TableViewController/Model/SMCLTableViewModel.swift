

import UIKit

struct Device : Codable {
    var name:String
    var nameKana:String
}

class SMCLTableViewModel: NSObject {
    var dataArray : NSMutableArray! = []
    
    func makeDummyData() {
        dataArray = []
        var data = Device(name: "iPhone7", nameKana: "あいふぉんせぶん")
        dataArray?.add(data)
        data = Device(name: "iPadAir2", nameKana: "あいぱっどえあーつー")
        dataArray?.add(data)
        data = Device(name: "MacMini", nameKana: "まっくみに")
        dataArray?.add(data)
        data = Device(name: "iMac", nameKana: "あいまっく")
        dataArray?.add(data)
    }
}

extension SMCLTableViewModel: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        let displayData:Device = dataArray?[indexPath.row] as! Device
        cell.textLabel?.text = displayData.name
        return cell
    }
}
