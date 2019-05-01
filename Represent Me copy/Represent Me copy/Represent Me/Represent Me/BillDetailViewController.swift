//
//  BillDetailViewController.swift
//  Represent Me
//
//  Created by Darin Meeker on 4/11/19.
//  Copyright © 2019 Darin Meeker. All rights reserved.
//

import UIKit

class BillDetailViewController: UIViewController {

    var billInfo: Bills?
    
    @IBOutlet weak var billTitle: UILabel!
    @IBOutlet weak var billTitle2: UILabel!
    @IBOutlet weak var billShortTitle: UITextView!
    @IBOutlet weak var billSummary: UITextView!
    @IBOutlet weak var billSponsorName: UILabel!
    @IBOutlet weak var billSponsorState: UILabel!
    @IBOutlet weak var billSponsorParty: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.billTitle.text = billInfo?.number
        self.billTitle2.text = billInfo?.number
        self.billShortTitle.text = billInfo?.short_title
        self.billSummary.text = billInfo?.summary
        self.billSponsorName.text = billInfo?.sponsor_name
        self.billSponsorParty.text = billInfo?.sponsor_party
        self.billSponsorState.text = billInfo?.sponsor_state
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
