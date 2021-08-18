//
//  ViewController2.swift
//  TabTest
//
//  Created by クワシマ・ユウキ on 2021/08/14.
//

//技全部表示用

import UIKit

class ViewController2: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var technique: [String] = []
    var check: [Bool] = []
    
    var saveData: UserDefaults = UserDefaults.standard
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        technique.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.frame = CGRect(x: 0, y: 0, width: tableView.frame.width * 0.8, height: (cell?.frame.height)!)

        cell?.textLabel?.text = technique[indexPath.row]
        
        for v in cell!.subviews {
            if let v = v as? UIButton {
                v.removeFromSuperview()
            }
        }
               
        let button = UIButton()
        
        button.frame = CGRect(x: tableView.frame.width * 0.8, y: 0, width: tableView.frame.width * 0.2, height: (cell?.frame.height)!)
        
        if check[indexPath.row] == true {
            button.setTitle("✅", for: .normal)
        } else {
            button.setTitle("❌", for: .normal)
        }
        
        button.tag = indexPath.row
        
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        cell?.addSubview(button)
               
        return cell!
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        check[sender.tag] = !check[sender.tag]
        
        saveData.setValue(check, forKey: "checkData")
        
        table.reloadData()
    }
    
    
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        technique = ["ノーマル","ダブル","リバース","シングルアクセル","ハーモニック","セミリバース","カウンター","パームスピン","カージオイド","シングルアクセルリバース","フィンガーレスノーマル","フィンガーレスリバース","ハーフフェイクトリバース","ハーフフェイクトノーマル","コンティニュアスシングルアクセルカージオイド"]
        
        check = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
        
        table.delegate = self
        table.dataSource = self
        
        if saveData.object(forKey: "checkData") != nil {
         
            check = saveData.object(forKey: "checkData") as! [Bool]
         
        } else {
            saveData.setValue(check, forKey: "checkData")
        }
        
        table.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("2")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
