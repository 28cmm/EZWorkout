

import UIKit
import Charts
import UICircularProgressRing

class StatPage4Controller: UIViewController {
  
  @IBOutlet weak var chartCaloryGoal: UICircularProgressRing!

  @IBOutlet weak var chartTimeSpent: BarChartView!
  
  @IBOutlet weak var chartCaloriesBurned: BarChartView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
      
    }
    override func viewDidAppear(_ animated: Bool) {
        setupChart1(timeFrame: .day)
        setupChart2(timeFrame: .day)
        setupChart3(timeFrame: .day)
    }
    
    func animateGraph(){
        chartTimeSpent.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        chartCaloriesBurned.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    }
  
  @IBAction func chart1Toggle(_ sender: UISegmentedControl) {
    print("you pressed \(sender.selectedSegmentIndex)")
    toggleInput(input:sender.selectedSegmentIndex,closure:setupChart1(timeFrame: ))
  }
  @IBAction func chart2Toggle(_ sender: UISegmentedControl) {print("you pressed \(sender.selectedSegmentIndex)")
    toggleInput(input:sender.selectedSegmentIndex,closure:setupChart2(timeFrame: ))
  }
  @IBAction func chart3Toggle(_ sender: UISegmentedControl) {
    print("you pressed \(sender.selectedSegmentIndex)")
    toggleInput(input:sender.selectedSegmentIndex,closure:setupChart3(timeFrame: ))
  }
  
  func toggleInput(input:Int , closure:(Calendar.Component)->Void){
    switch (input){
    case 0:
      closure(.day)
      break
    case 1:
      
      closure(.month)
      break
    default:
      break
    }
  }
  
  func setupChart1(timeFrame:Calendar.Component){
    //calculate calory percent
    //if daily
    
    let calendar = Calendar.current
    
    let year = calendar.component(.year, from: Date())
    let month = calendar.component(.month, from: Date())
    var day = 0
    
    var calGoal = 300.0
    
    if timeFrame == .day{
      //check if day is signifigant
      day = calendar.component(.day, from: Date())
      calGoal = 300.0
    }else if timeFrame == .month{
      calGoal *= 1
    }
    
    let components = DateComponents(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
    
    //add one of time interval to date
    let startDate = calendar.date(from: components)!
    let endDate = startDate.adding(timeInterval: timeFrame, amt: 1)
    let calsBurned = Double(StaticDataManager.getCalForRange(startDate: startDate, endDate: endDate))
    
    //assume daily calorie goal of 300
    
    let goalPercent = CGFloat(calsBurned/calGoal)
    
    chartCaloryGoal.startProgress(to: goalPercent, duration: 2) {
//      DispatchQueue.main.async {
//        // We can animate the ring back to another value here, and it does so fluidly
//        self.chartCaloryGoal.startProgress(to: 80, duration: 2)
//        //self.circuler.showsValueKnob = true
//      }
    }
    
  }
  
  func setupChart2(timeFrame:Calendar.Component){
    //change for between date
    let stringTimeArray = StatHelper.getLastDates(num: 7, timeInterval: timeFrame)
    let monthArray = stringTimeArray.map{$0.1}
    let calsBurned = StatHelper.createTotalforRange(timeArray: monthArray, timeInterval: timeFrame, closure: StaticDataManager.getCalForRange(startDate:endDate:))
    
    
    
    //chartTotalReps.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    chartCaloriesBurned.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
   
    
    
    let barColor = #colorLiteral(red: 0.9428298473, green: 0.9622165561, blue: 0, alpha: 1)
    
    StaticDataManager.setUpChart(chart: chartCaloriesBurned, chartLabels: stringTimeArray.map{$0.0}, chartValues: calsBurned,colors: [barColor],bottomLabelText: "Calories Burned")
    
    //      chart1.leftAxis.labelFont = UIFont(name: "Simply Rounded", size: 20.0)!
    chartCaloriesBurned.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    //chartCaloriesBurned.legend.font = UIFont(name: "Simply Rounded", size: .0)!
    
    
    //      chart1.legend.formSize = 20.0
    //      chart1.legend.yOffset = 20.0
    //      chart1.legend.neededHeight = 50
    //chart1.legend.enabled = false
    chartCaloriesBurned.animate(xAxisDuration: 0.8, yAxisDuration: 3.0)
    
    
    
  }
  
  func setupChart3(timeFrame:Calendar.Component){
    
    let stringMonths = StatHelper.getLastDates(num: 7, timeInterval: timeFrame)
    let weightFormonths = StatHelper.createTotalforRange(timeArray: stringMonths.map{$0.1}, timeInterval: timeFrame, closure: StaticDataManager.getWeightForRange(startDate:endDate:))
    
    
    let barColor = #colorLiteral(red: 0.9428298473, green: 0.9622165561, blue: 0, alpha: 1)
    
    StaticDataManager.setUpChart(chart: chartTimeSpent , chartLabels: stringMonths.map{$0.0} , chartValues: weightFormonths , colors: [barColor],bottomLabelText: "Weigth Lifted")
    
    //      chart1.leftAxis.labelFont = UIFont(name: "Simply Rounded", size: 20.0)!
    chartTimeSpent.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    chartTimeSpent.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
    
    
    //      chart1.legend.formSize = 20.0
    //      chart1.legend.yOffset = 20.0
    //      chart1.legend.neededHeight = 50
    //chart1.legend.enabled = false
    
    
    chartTimeSpent.animate(xAxisDuration: 0.8, yAxisDuration: 3.0)
    
  }

  

}
