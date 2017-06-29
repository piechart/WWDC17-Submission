import UIKit

public class SkillsViewController: BaseViewController {
  
  struct Constants {
    static var tableViewCellID = "skillTableViewCellID"
    static var sectionHeight: CGFloat = 30
    static var cellHeight: CGFloat = 40
  }
  
  var tableView: SkillTableView!
  
  struct SkillsTableItem {
    var sectionTitle: String
    var items: [String]
  }
  let tableData = [
    SkillsTableItem(sectionTitle: "Programming", items: ["Delphi", "Swift", "C", "PHP", "JS, HTML & CSS", "Python", "Ruby"]),
    SkillsTableItem(sectionTitle: "Development", items: ["Object-oriented paradigm", "Algorithmization", "Designing patterns", "Continuous Integration"]),
    SkillsTableItem(sectionTitle: "Information Security", items: ["Web-server protection", "SQL queries issues", "Safe HTTP data transfering", "Binary files analysis"])
    //SkillsTableItem(sectionTitle: "Other", items: ["English", "Communicative", "Problem solving"])
  ]
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Skills"
    initTableView()
  }
  
}

// MARK: - UI
extension SkillsViewController {
  
  func initTableView() {
    let yValue: CGFloat = 40
    let rect = CGRect(
      x: 10,
      y: yValue,
      width: view.frame.width - 20,
      height: view.frame.height - yValue - 10
    )
    tableView = SkillTableView(frame: rect)
    tableView.register(SkillTableViewCell.self, forCellReuseIdentifier: Constants.tableViewCellID)
    tableView.delegate = self
    tableView.dataSource = self
    view.addSubview(tableView)
  }
  
  func headerViewWith(title: String) -> UIView {
    let headerRect = CGRect(
      x: 0,
      y: 0,
      width: view.frame.width,
      height: Constants.sectionHeight - 10
    )
    let headerView = UIView(frame: headerRect)
    headerView.backgroundColor = view.backgroundColor
    
    let titleAttributes = [
      NSFontAttributeName: UIFont.gothamPro(size: 13),
      NSKernAttributeName: 1.5
    ] as [String : Any]
    
    let textSize = (title as NSString).boundingRect(
      with: CGSize(width: view.frame.width, height: 100),
      options: NSStringDrawingOptions(),
      attributes: titleAttributes,
      context: nil
    ).size
    
    let realWidth = textSize.width + 5
    
    let labelRect = CGRect(
      x: view.frame.midX - realWidth * 0.5 - 10,
      y: Constants.sectionHeight * 0.25,
      width: realWidth,
      height: headerView.frame.height
    )
    let label = UILabel(frame: labelRect)
    label.backgroundColor = view.backgroundColor
    label.textAlignment = .center
    label.textColor = .white
    label.setupDefaultBorder()
    label.layer.radius = 9
    
    label.font = UIFont.gothamPro(size: 12)
    label.text = title.uppercased()
    
    let lineRect = CGRect(x: 0, y: label.frame.midY, width: headerView.frame.width, height: 1)
    let lineView = UIView(frame: lineRect)
    lineView.backgroundColor = .white
    
    headerView.addSubview(label)
    headerView.insertSubview(lineView, belowSubview: label)
    return headerView
  }
  
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SkillsViewController: UITableViewDelegate, UITableViewDataSource {

  public func numberOfSections(in tableView: UITableView) -> Int {
    return tableData.count
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableData[section].items.count
  }
  
  public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let tableItem = tableData[section]
    return headerViewWith(title: tableItem.sectionTitle)
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellID, for: indexPath) as! SkillTableViewCell
    let tableElement = tableData[indexPath.section]
    cell.contentLabel.text = tableElement.items[indexPath.row]
    if indexPath.row == tableElement.items.count - 1 {
      cell.hideSeparator()
    }
    return cell
  }
  
  public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return Constants.sectionHeight
  }
  
  public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return Constants.cellHeight
  }
  
}

