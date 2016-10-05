import UIKit

class CodingTofuViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
  
    override func viewDidLoad() {
      super.viewDidLoad()
      if let url = NSURL(string: codingTofURL)
      {
        webView.loadRequest(NSURLRequest(URL: url))
      }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
