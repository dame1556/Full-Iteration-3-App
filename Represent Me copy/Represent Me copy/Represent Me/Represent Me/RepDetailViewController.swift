//
//  RepDetailViewController.swift
//  Represent Me
//
//  Created by Darin Meeker on 4/16/19.
//  Copyright © 2019 Darin Meeker. All rights reserved.
//

import UIKit

class RepDetailViewController: UIViewController {

    @IBOutlet weak var repName: UILabel!
    @IBOutlet weak var repName2: UILabel!
    @IBOutlet weak var repState: UILabel!
    @IBOutlet weak var repParty: UILabel!
    @IBOutlet weak var repDOB: UILabel!
    @IBOutlet weak var repPhone: UILabel!
    @IBOutlet weak var repTwitter: UILabel!
    @IBOutlet weak var repTotVotes: UILabel!
    @IBOutlet weak var repMisVotes: UILabel!
    @IBOutlet weak var repVotesPct: UILabel!
    
    var repInfo: Representatives?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        repName.text = (repInfo?.first_name)! + " " + (repInfo?.last_name)!
        repName2.text = (repInfo?.first_name)! + " " + (repInfo?.last_name)!
        repState.text = repInfo?.state
        repParty.text = repInfo?.party
        repDOB.text = repInfo?.date_of_birth
        repPhone.text = repInfo?.phone
        repTwitter.text = repInfo?.twitter_account
        repTotVotes.text = repInfo?.total_votes
        repMisVotes.text = repInfo?.missed_votes
        repVotesPct.text = repInfo?.votes_with_party_pct
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
