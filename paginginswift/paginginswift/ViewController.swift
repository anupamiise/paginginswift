//
//  ViewController.swift
//  PagingPractice
//
//  Created by Anupam Mishra on 24/10/16.
//  Copyright © 2016 wcities. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pagingNavigationButtotnTouchUpInside(_ sender: AnyObject) {
        let vc:PagingNavigationViewController = PagingNavigationViewController(nibName: "PagingNavigationViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func NextButtonTopuchUpInside(_ sender: AnyObject)
    {
        let vc:PagingViewController = PagingViewController(nibName: "PagingViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
        
    }

}

