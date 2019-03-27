

import UIKit

class StatsTopBarVC: UIViewController {
  
  @IBOutlet weak var chartButton1: UIButton!
  @IBOutlet weak var chartButton2: UIButton!
  @IBOutlet weak var chartButton3: UIButton!
  @IBOutlet weak var chartButton4: UIButton!
  
  var buttonArray: [UIButton]?
  
  var delegate: TopBarDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    buttonArray = [chartButton1,chartButton2,chartButton4]
    
  }
 
  func getButtonXPos(atIndex:Int) -> CGFloat{
    
    if let buttonArray = buttonArray , atIndex < buttonArray.count{
      return buttonArray[atIndex].center.x
    }
    return 0
  }
  
  
  @IBAction func navButtonPressed(_ sender: UIButton) {
    
    print("the buttons position is \(sender.tag)")
    if let delegate = delegate {
      delegate.scrollTo(pageNum: sender.tag)
    }else{
      print("error: delegate not set")
    }
  }
  
  func animateTopBars(page:Int){
    
    if let buttonArray = buttonArray{
      for barButton in buttonArray {
        if barButton.tag == page{
          animateIn(button:barButton)
        }else{
          animateOut(button:barButton)
        }
      }
    }
    
  }
  
  func animateIn(button:UIButton){
    UIView.animate(withDuration: 0.4, animations: {
      button.alpha = 1.0
      
    })
    
    UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.8, options: [], animations: {
      button.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
    }, completion: {_ in})
  }
  func animateOut(button:UIButton){
    UIView.animate(withDuration: 0.4, animations: {
      button.alpha = 0.4
      button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    })
    
  }
  
  
}
