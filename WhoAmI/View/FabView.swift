import UIKit

protocol NPSFABViewProtocol {
  func tapped()
  func beganMoving()
  func endedMoving()
}

class FabView: UIView {
  private var lastLocation = CGPoint(x:0, y:0)
  var delegate: NPSFABViewProtocol?
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    gestureRecognizers = [UIPanGestureRecognizer(target:self, action:#selector(FabView.detectPan)),
                          UITapGestureRecognizer(target:self, action:#selector(FabView.dispose))]
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  func detectPan(recognizer: UIPanGestureRecognizer) {
    let translation  = recognizer.translationInView(superview!)
    center = CGPoint(x:lastLocation.x + translation.x, y:lastLocation.y + translation.y)
    
    guard let delegate = delegate else { return }
    if recognizer.state == .Began {
      delegate.beganMoving()
      return
    }
    if recognizer.state == .Ended {
      delegate.endedMoving()
      return
    }
  }
  
  func dispose(recognizer: UIPanGestureRecognizer) {
    guard let delegate = delegate else { return }
    delegate.tapped()
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    lastLocation = center
  }
}
