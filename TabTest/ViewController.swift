//
//  ViewController.swift
//  TabTest
//
//  Created by クワシマ・ユウキ on 2021/08/14.
//

//クイズ用

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    let saveData = UserDefaults.standard
    
    var allTechnique =  ["ノーマル","ダブル","リバース","シングルアクセル","ハーモニック","セミリバース","カウンター","パームスピン","カージオイド","シングルアクセルリバース","フィンガーレスノーマル","フィンガーレスリバース","ハーフフェイクトリバース","ハーフフェイクトノーマル","コンティニュアスシングルアクセルカージオイド"]
    var checkedTechnique: [String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkedTechnique.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = checkedTechnique[indexPath.row]
        
               
        return cell!
    }
    
    
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("1")
        
        var checkData: [Bool] = []
        
        if saveData.object(forKey: "checkData") != nil {
         
            checkData = saveData.object(forKey: "checkData") as! [Bool]
            
            checkedTechnique.removeAll()
            
            for i in 0..<checkData.count {
                if (checkData[i] == true) {
                    checkedTechnique.append(allTechnique[i])
                }
            }
            
            table.reloadData()
         
        }
    }
    
    


}

