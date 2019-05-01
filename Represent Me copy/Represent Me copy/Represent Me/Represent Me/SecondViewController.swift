//
//  SecondViewController.swift
//  Represent Me
//
//  Created by Darin Meeker on 3/5/19.
//  Copyright © 2019 Darin Meeker. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var RepTableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    var representatives = [Representatives]()
    var apiKey = "CPmuohtMkDLLNofM3lpGVJVCC8PNsr6CwNDZOzwK"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadjson()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loadjson(){
        let urlPath = "https://api.propublica.org/congress/v1/115/senate/members.json"
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
            let api = try JSONDecoder().decode(RepresentativesData.self, from: data)
            print(api)
            for rep in api.results[0].members
            {
                representatives.append(rep)
            }
        }
        catch let jsonErr
        {
            print(jsonErr.localizedDescription)
            return
        }
        //reload the table data after the json data has been downloaded
        RepTableView.reloadData()
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
        return representatives.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepresentativeCell", for: indexPath)
        let representative = representatives[indexPath.row]
        cell.textLabel!.text = representative.first_name + " " + representative.last_name
        cell.detailTextLabel!.text = representative.state
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowRepDetails" {
            
            let detailViewController = segue.destination
                as! RepDetailViewController
            let myIndexPath = tableView.indexPathForSelectedRow!
            detailViewController.repInfo = representatives[myIndexPath.row]
        }
    }


}

