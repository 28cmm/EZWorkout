

import UIKit
import FSCalendar
import RealmSwift

class NewHistoryViewController: UIViewController {
  @IBOutlet weak var noEventsMsg: UILabel!
  @IBOutlet weak var sectionTitle: UILabel!
  
  @IBOutlet weak var calendar: FSCalendar!
  @IBOutlet weak var selectedDateLabel: UILabel!
  @IBOutlet weak var exerciseTableView: UITableView!
  
  let dateFormater = DateFormatter()
  let timeFormater = DateFormatter()
  
  var exercises = [ExcerciseRealm]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    calendar.dataSource = self
    calendar.delegate = self
    
    
    exerciseTableView.dataSource = self
    exerciseTableView.delegate = self
    
    //Date formatters
    //TODO maybe create when needed
    //dateFormater.dateFormat = "d"
    dateFormater.dateStyle = .medium
    timeFormater.dateFormat = "h:mm"
    //timeFormater.timeStyle = .short
    updateSelected(date: Date())
    
//    let idleColor1 = #colorLiteral(red: 0.8964110017, green: 0.6467557549, blue: 0.6463074088, alpha: 1)
//    let idleColor2 = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
//    //TODO put in animation extention
//    let gradient = CAGradientLayer()
//    //startGradient()
//
//    gradient.colors = [idleColor1.cgColor, idleColor2.cgColor]
//    gradient.locations = [0.0 , 1.0]
//    gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
//    gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
//
//    gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
//    self.view.layer.insertSublayer(gradient, at: 0)
    
    
    //set the font
    calendar.appearance.headerTitleFont      = UIFont.init(name: "Simply Rounded", size: 22)
    calendar.appearance.headerTitleColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    calendar.appearance.weekdayFont          = UIFont.init(name: "Simply Rounded", size: 16)
    calendar.appearance.weekdayTextColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    calendar.appearance.titleFont            = UIFont.init(name: "Simply Rounded", size: 16)
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    sectionTitle.alpha = 0.3
    sectionTitle.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
    UIView.animate(withDuration: 1.0, animations: {
      self.sectionTitle.alpha = 1.0
      self.sectionTitle.transform = CGAffineTransform(scaleX: 1, y: 1)
    })
  }
  
  func updateSelected(date:Date){
    let selectedDateString = dateFormater.string(from: date)
    selectedDateLabel.text = "\(selectedDateString)"
    //TODO update table view
    let realm = try! Realm()
    //let predicate = NSPredicate(format: "date > %@", specificNSDate)
    
    
    let selectedDate = date//Calendar.current.startOfDay(for: Date())
    let selectedDateEnd: Date = {
      let components = DateComponents(day: 1, second: -1)
      return Calendar.current.date(byAdding: components, to: selectedDate)!
    }()
    let results = realm.objects(WorkoutRealm.self).filter("startTime BETWEEN %@", [selectedDate, selectedDateEnd])
    
    //let results = realm.objects(WorkoutRealm.self).filter("startTime >= $0", Date())
    //print("realm results = \(results)")
//      realm.objects(UserRealm.self).filter(“name = ‘Joe’ AND calory = 10”)
    
    if results.count > 0{
      exercises = results[0].excerciseArray.map{$0}
      exerciseTableChangeWithFade()
      
      UIView.animate(withDuration: 0.5, animations: {
        self.noEventsMsg.alpha = 0.0
      })

    }else{

      UIView.animate(withDuration: 0.5, animations: {
        self.noEventsMsg.alpha = 1.0
        self.exerciseTableView.alpha = 0.0
      })
      exercises = []
    }
   
  }
  func exerciseTableChangeWithFade(){
    UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
      self.exerciseTableView.alpha = 0.0
      
    }, completion: {_ in
      UIView.animate(withDuration: 0.5, animations: {
        self.exerciseTableView.reloadData()
        self.exerciseTableView.alpha = 1.0
      })
    })
  }
  
  
  
  
  
}
