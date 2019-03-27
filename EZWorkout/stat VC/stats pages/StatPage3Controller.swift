

import UIKit
import Charts

class StatPage3Controller: UIViewController {
  
  @IBOutlet weak var chartRestingHeart: LineChartView!
  @IBOutlet weak var chartUserWeight: LineChartView!
  @IBOutlet weak var chartBMI: LineChartView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
      
    }
    
    func animateGraph(){
      
          
//        setupChart1()
//        setupChart2()
//        setupChart3()
//        chartRestingHeart.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)
//        chartUserWeight.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)
//        chartBMI.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)
    }
  
  func setupChart1(){
    //todo create fake user resting heart rates
    
    
    let numbers = [90.0,89.0,88.0,89.0,87.0,86.5,84,80.0,79.0,75.0,76.0,74]
    
    var values = [ChartDataEntry]()
    var i = 0.0
    for num in numbers{
      values.append(ChartDataEntry(x: i, y: num))
      i += 1.0
    }
    
    let labelTextColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    
    
    let set1 = LineChartDataSet(values: values, label: "resting Heart rate")
    set1.drawIconsEnabled = false
    
    set1.lineDashLengths = [5, 2.5]
    set1.highlightLineDashLengths = [5, 2.5]
    set1.setColor(.black)
    set1.setCircleColor(.black)
    set1.lineWidth = 1
    set1.circleRadius = 3
    set1.drawCircleHoleEnabled = false
    set1.valueFont = .systemFont(ofSize: 12)
    set1.formLineDashLengths = [5, 2.5]
    set1.formLineWidth = 1
    set1.formSize = 15
    set1.valueColors = [.white]
    
    let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                          ChartColorTemplates.colorFromString("#ffff0000").cgColor]
    let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
    
    set1.fillAlpha = 1
    set1.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
    set1.drawFilledEnabled = true
    
    let data = LineChartData(dataSet: set1)
    
    chartRestingHeart.data = data
    chartRestingHeart.legend.font = UIFont(name: "Simply Rounded", size: 18.0)!
    chartRestingHeart.legend.textColor = labelTextColor
  }

  
  func setupChart2(){
    //todo create fake user weights
    let numbers = [155.0,156.0,150.0,152.0,149.0,150.0,148.0]
    let labelTextColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    var values = [ChartDataEntry]()
    var i = 0.0
    for num in numbers{
      values.append(ChartDataEntry(x: i, y: num))
      i += 1.0
    }
    
    let gradient1 = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.05508882705)
    let gradient2 = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.6701626712)
    
    let valueColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    let set1 = LineChartDataSet(values: values, label: "user weight")
    set1.drawIconsEnabled = false
    
    set1.lineDashLengths = [5, 2.5]
    set1.highlightLineDashLengths = [5, 2.5]
    set1.setColor(valueColor)
    set1.setCircleColor(.black)
    set1.lineWidth = 1
    set1.circleRadius = 3
    set1.drawCircleHoleEnabled = false
    set1.valueFont = .systemFont(ofSize: 12)
    set1.formLineDashLengths = [5, 2.5]
    set1.formLineWidth = 1
    set1.formSize = 20
    set1.valueColors = [.white]
    
    let gradientColors = [gradient1.cgColor,
                          gradient2.cgColor]
    let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
    
    set1.fillAlpha = 1
    set1.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
    set1.drawFilledEnabled = true
    
    let data = LineChartData(dataSet: set1)
    
    chartUserWeight.legend.font = UIFont(name: "Simply Rounded", size: 18.0)!
    chartUserWeight.data = data
    chartUserWeight.legend.textColor = labelTextColor
  }
  func setupChart3(){
    //todo create fake BMI
    let numbers = [20.0,66.0,90.0,100.0]
    let labelTextColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    var values = [ChartDataEntry]()
    var i = 0.0
    for num in numbers{
      values.append(ChartDataEntry(x: i, y: num))
      i += 1.0
    }
    
    
    
    
    
    let set1 = LineChartDataSet(values: values, label: "BMI")
    set1.drawIconsEnabled = false
    
    set1.lineDashLengths = [5, 2.5]
    set1.highlightLineDashLengths = [5, 2.5]
    set1.setColor(.black)
    set1.setCircleColor(.black)
    set1.lineWidth = 1
    set1.circleRadius = 3
    set1.drawCircleHoleEnabled = false
    set1.valueFont = .systemFont(ofSize: 12)
    set1.valueColors = [.white]
    set1.formLineDashLengths = [5, 2.5]
    set1.formLineWidth = 1
    set1.formSize = 15
    
    let gradient1 = #colorLiteral(red: 0.9624674916, green: 0.9568081498, blue: 0.7134264112, alpha: 0.05508882705)
    let gradient2 = #colorLiteral(red: 0.9421860576, green: 0.902207315, blue: 0, alpha: 0.8895815497)
    
    let gradientColors = [gradient1.cgColor,
                          gradient2.cgColor]
    let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
    
    set1.fillAlpha = 1
    set1.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
    set1.drawFilledEnabled = true
    
    let data = LineChartData(dataSet: set1)
    chartBMI.legend.font = UIFont(name: "Simply Rounded", size: 18.0)!
    chartBMI.data = data
    chartBMI.legend.textColor = labelTextColor
  }

}
