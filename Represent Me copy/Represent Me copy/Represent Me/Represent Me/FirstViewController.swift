//
//  FirstViewController.swift
//  Represent Me
//
//  Created by Darin Meeker on 3/5/19.
//  Copyright © 2019 Darin Meeker. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var BillsTableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    var bills = [Bills]()
    var apiKey = "CPmuohtMkDLLNofM3lpGVJVCC8PNsr6CwNDZOzwK"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadjson()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loadjson(){
        let urlPath = "https://api.propublica.org/congress/v1/115/both/bills/active.json"
        guard let url = URL(string: urlPath)
            else {
                print("url error")
                return
        }
        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "X-API-Key")
        let session = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            guard statusCode == 200
                else {
                    print("file download error")
                    return
            }
            //download successful
            print("download complete")
            //parse json asynchronously
            DispatchQueue.main.async {self.parsejson(data!)}
        })
        //must call resume to run session
        session.resume()
    }
    
    func parsejson(_ data: Data){
        do
        {
            let api = try JSONDecoder().decode(BillsData.self, from: data)
            print(api)
            for bill in api.results[0].bills
            {
                bills.append(bill)
            }
        }
        catch let jsonErr
        {
            print(jsonErr.localizedDescription)
            return
        }
        //reload the table data after the json data has been downloaded
        BillsTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BillCell", for: indexPath)
        let bill = bills[indexPath.row]
        cell.textLabel!.text = bill.short_title
        cell.detailTextLabel!.text = bill.number
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowBillDetails" {
            
            let detailViewController = segue.destination
                as! BillDetailViewController
            let myIndexPath = tableView.indexPathForSelectedRow!
            detailViewController.billInfo = bills[myIndexPath.row]
        }
    }
    
}

