import UIKit

class RootTabBarController: UITabBarController {
  lazy var fab: FabView = {
    let fabList = NSBundle.mainBundle().loadNibNamed("FabView", owner: nil, options: nil)
    let tempFab = fabList[0] as? FabView
    return tempFab!
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(fab)
    fab.frame.origin.x = view.bounds.size.width - 100
    fab.frame.origin.y = view.bounds.size.height - 200
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}


extension RootTabBarController: NPSFABViewProtocol {
  func tapped() {
//    performSegueWithIdentifier("", sender: nil)
  }
  
  func endedMoving() {
    UIView.animateWithDuration(0.5, animations: {
      self.fab.frame.origin.y = UIScreen.mainScreen().bounds.height
      }, completion: { animated in
    })
  }
  
  func beganMoving() {
  }
}

