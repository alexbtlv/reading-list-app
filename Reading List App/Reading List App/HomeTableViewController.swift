//
//  HomeTableViewController.swift
//  Reading List App
//
//  Created by Andrew Solomon on 7/29/15.
//  Copyright © 2015 ios-developers.io. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    private let articles = Article.allArticles()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
    }
   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ArticleCell") as! ArticleTableViewCell
        let article = articles[indexPath.row]
        
        cell.title = article.title
        cell.url = article.url
        cell.date = article.date
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let article = articles[indexPath.row]
        performSegueWithIdentifier("WebSegue", sender: article)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "WebSegue" {
            if let article = sender as? Article,
                let vc = segue.destinationViewController as? WebViewController,
                    let url = NSURL(string: article.url) {
                    let request = NSURLRequest(URL: url)
                    vc.loadRequest(request)
            }
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 58
    }
}
