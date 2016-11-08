//
//  PagingViewController.swift
//  PagingPractice
//
//  Created by Anupam Mishra on 25/10/16.
//  Copyright © 2016 wcities. All rights reserved.
//

import UIKit

class PagingViewController: UIViewController,UIScrollViewDelegate
{
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var page1View: UIView!
    @IBOutlet var page2View: UIView!
    @IBOutlet var page3View: UIView!
    @IBOutlet var page4View: UIView!
    @IBOutlet var scrollView: UIScrollView!
     var pageNumberYouWantToGoTo:Int = 0
    
//    let scrollView:UIScrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
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
            page4View.frame = CGRect(x: self.scrollView.frame.size.width*3, y: 0, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height)
         
            self.scrollView.addSubview(page1View)
            self.scrollView.addSubview(page2View)
            self.scrollView.addSubview(page3View)
            self.scrollView.addSubview(page4View)
            scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * 4, height: self.scrollView.frame.size.height)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButtonTouchUpInSide(_ sender: AnyObject)
    {
        if pageNumberYouWantToGoTo<=0
        {
           navigationController?.popToRootViewController(animated: true)
            return
        }
        var frame:CGRect = scrollView.frame as CGRect;
        pageNumberYouWantToGoTo -= 1
        frame.origin.x = frame.size.width * CGFloat(pageNumberYouWantToGoTo)
        frame.origin.y = 0;
        scrollView.scrollRectToVisible(frame, animated: true)
        // pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        
        pageControl.currentPage = Int(pageNumberYouWantToGoTo)
    }
    @IBAction func NextButtonTouchUpInSide(_ sender: AnyObject)
    {
        if pageNumberYouWantToGoTo>=3 {
            return
        }
        var frame:CGRect = scrollView.frame as CGRect;
       pageNumberYouWantToGoTo += 1
        frame.origin.x = frame.size.width * CGFloat(pageNumberYouWantToGoTo)
        frame.origin.y = 0;
        scrollView.scrollRectToVisible(frame, animated: true)
        pageControl.currentPage = Int(pageNumberYouWantToGoTo)
        
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
