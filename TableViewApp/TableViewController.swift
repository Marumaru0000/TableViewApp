//
//  TableViewController.swift
//  TableViewApp
//
//  Created by 丸山航輝 on 2023/08/27.
//
//編集モードの概念
//discardコマンド邪魔すぎる
/*https://capibara1969.com/1443/#toc5*/


import UIKit

class TableViewController: UITableViewController {
    var taskArray: [String] = []
    // 画面内に表示する名前を入れています。
        var names: [String] = [
            "阿部",
            "石田",
            "上田",
            "遠藤",
            "及川",
            "梶原",
            "菊池",
            "工藤",
        ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
        //tableView.isEditing = true //編集モードにする。

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userDefaults = UserDefaults.standard

        //"add"というキーで保存された値がなにかある -> 値をtaskArrayへ
        if userDefaults.object(forKey: "add") != nil {
            taskArray = userDefaults.object(forKey: "add") as! [String]
       }
        //tableViewを更新
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // 今回はセクションは1つのみなので、namesの要素数をそのまま使います。
        // "変数名.count"で要素数を取得できます。
        return taskArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルのオブジェクトを作成します。
        // "NameCell" の部分はStoryboardでセルに設定したIdentifierを指定しています。
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)

        // Configure the cell...
        // namesから該当する行の文字列を取得してセルに設定します。
        // indexPath.rowで何行目かがわかります。
        cell.textLabel?.text = taskArray[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // データソースから要素を削除
            taskArray.remove(at: indexPath.row)
            
            // UserDefaultsを更新
            let userDefaults = UserDefaults.standard
            userDefaults.set(taskArray, forKey: "add")
            
            // テーブルビューからセルを削除
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }


    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
