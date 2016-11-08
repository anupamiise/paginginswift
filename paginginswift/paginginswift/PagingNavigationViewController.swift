//
//  PagingNavigationViewController.swift
//  PagingPractice
//
//  Created by Anupam Mishra on 25/10/16.
//  Copyright © 2016 wcities. All rights reserved.
//

import UIKit

class PagingNavigationViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var page1View: UIView!
    @IBOutlet var page2View: UIView!
    @IBOutlet var page3View: UIView!
    var pageNumberYouWantToGoTo:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews()
    {
        ConfigurePages()
    }

    func ConfigurePages()->Void
    {
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        page1View.frame = CGRect(x: self.scrollView.frame.size.width*0, y: 0, width: self.scrollView.frame.size.width*1, height: self.scrollView.frame.size.height)
        page2View.frame = CGRect(x: self.scrollView.frame.size.width*1, y: 0, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height)
        page3View.frame = CGRect(x: self.scrollView.frame.size.width*2, y: 0, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height)
        
        self.scrollView.addSubview(page1View)
        self.scrollView.addSubview(page2View)
        self.scrollView.addSubview(page3View)        
        scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * 3, height: self.scrollView.frame.size.height)
    }

    
    @IBAction func SegmentValueChanged(_ sender: AnyObject)
    {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            if pageNumberYouWantToGoTo == segmentControl.selectedSegmentIndex{
                return;
            }
            pageNumberYouWantToGoTo = segmentControl.selectedSegmentIndex
            var frame:CGRect = scrollView.frame as CGRect;
            frame.origin.x = frame.size.width * CGFloat(pageNumberYouWantToGoTo)
            frame.origin.y = 0;
            scrollView.scrollRectToVisible(frame, animated: true)
            break;
        case 1:
            if pageNumberYouWantToGoTo == segmentControl.selectedSegmentIndex{
                return;
            }
            pageNumberYouWantToGoTo = segmentControl.selectedSegmentIndex
            var frame:CGRect = scrollView.frame as CGRect;
            frame.origin.x = frame.size.width * CGFloat(pageNumberYouWantToGoTo)
            frame.origin.y = 0;
            scrollView.scrollRectToVisible(frame, animated: true)
            break;
        case 2:
            if pageNumberYouWantToGoTo == segmentControl.selectedSegmentIndex{
                return;
            }
            pageNumberYouWantToGoTo = segmentControl.selectedSegmentIndex
            var frame:CGRect = scrollView.frame as CGRect;
            frame.origin.x = frame.size.width * CGFloat(pageNumberYouWantToGoTo)
            frame.origin.y = 0;
            scrollView.scrollRectToVisible(frame, animated: true)
            break;
        default:
            if pageNumberYouWantToGoTo == segmentControl.selectedSegmentIndex{
                return;
            }
            pageNumberYouWantToGoTo = segmentControl.selectedSegmentIndex
            var frame:CGRect = scrollView.frame as CGRect;
            frame.origin.x = frame.size.width * CGFloat(pageNumberYouWantToGoTo)
            frame.origin.y = 0;
            scrollView.scrollRectToVisible(frame, animated: true)
            break;
            
        }
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        let xOffset: CGFloat = scrollView.contentOffset.x
        //Change the pageControl dots depending on the page / offset values
        
        if (xOffset < 1.0)
        {
           pageNumberYouWantToGoTo = 0
        } else if (xOffset < self.view.bounds.width + 1)
        {
           pageNumberYouWantToGoTo = 1
        }
        else
        {
           pageNumberYouWantToGoTo = 2
        }

        segmentControl.selectedSegmentIndex = pageNumberYouWantToGoTo
       
    }

   
}
