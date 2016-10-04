import Foundation
import AFNetworking

protocol Networking {
  func getRequest(path:String, successCallback:AnyObject ->() , failureCallback:NSError!->());
  func postRequest(path:String, parameters: [String: AnyObject],successCallback: AnyObject->() ,  failureCallback: NSError! ->() );
}

struct Network : Networking {
  func getRequest(path: String, successCallback: AnyObject -> (), failureCallback: NSError! -> ()) {
    let manager = AFHTTPRequestOperationManager()
    manager.responseSerializer = AFJSONResponseSerializer()
    manager.requestSerializer = AFJSONRequestSerializer()
    getRequestWithManager(manager, path:path, successCallback:successCallback, failureCallback:failureCallback)
  }
  
  func postRequest(path: String, parameters: [String : AnyObject], successCallback: AnyObject -> (), failureCallback: NSError! -> ()) {
    let manager = AFHTTPRequestOperationManager()
    manager.requestSerializer = AFJSONRequestSerializer()
    manager.POST(path, parameters: parameters, success: { (requestOperation, responseObject) -> Void in
      successCallback(responseObject)
    }) { (requestOperation, error) -> Void in
      failureCallback(error)
    }
  }
}

func getRequestWithManager(manager: AFHTTPRequestOperationManager, path: String, successCallback: AnyObject -> (), failureCallback: NSError! -> ()) {
  manager.GET(path, parameters: nil, success: { (operation, responseObject) -> Void in
    successCallback(responseObject)
  }) { (requestOperation, error) -> Void in
    failureCallback(error)
  }
}
