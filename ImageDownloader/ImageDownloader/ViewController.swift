//
//  ViewController.swift
//  ImageDownloader
//
//  Created by 이상협 on 2018. 3. 19..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit

class ViewController: UIViewController , URLSessionDownloadDelegate{
    

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var currentBytes: UILabel!
    @IBOutlet weak var totalBytes: UILabel!
    var downloadTask:URLSessionDownloadTask!
    
    @IBAction func downloadAction(_ sender: Any) {
        imgView.image = nil
        progressView.setProgress(0.0, animated: false)
        indicatorView.startAnimating()
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
        
        downloadTask = session.downloadTask(with:URL(string: "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg")!)
        downloadTask.resume()   //반드시 해줘야함
        
    }
    @IBAction func suspendAction(_ sender: Any) {
        downloadTask.suspend()
    }
    @IBAction func resumeAction(_ sender: Any) {
        downloadTask.resume()
    }
    @IBAction func cancelAction(_ sender: Any) {
        downloadTask.cancel()
        progressView.setProgress(0.0, animated: false)
        currentBytes.text = ""
        totalBytes.text  = ""
        indicatorView.stopAnimating()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let dataTemp:Data = try! Data(contentsOf: location)
        self.imgView.image = UIImage(data: dataTemp)
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress:Float = Float(totalBytesWritten/totalBytesExpectedToWrite)
        progressView.setProgress(progress, animated: true)
        /* totalBytesWritten : 누적되는 받은 용량
         totlaBytesExpectedToWrite: 전체 용량 */
        currentBytes.text = "\(totalBytesWritten)"
        totalBytes.text = "/\(totalBytesExpectedToWrite)"
        
        if(totalBytesExpectedToWrite == totalBytesWritten) {
            currentBytes.text = ""
            totalBytes.text = ""
        }
        indicatorView.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

