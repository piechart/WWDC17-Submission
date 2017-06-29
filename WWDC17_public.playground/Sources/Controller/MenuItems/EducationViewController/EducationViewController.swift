import UIKit

public struct EducationTableItem {
  var title: String
  var description: String
  var period: String
}

public class EducationViewController: BaseViewController {
  
  struct Constants {
    static let cellID = "educationTableViewCellID"
  }
  
  var tableView: UITableView!
  
  let tableData = [
    EducationTableItem(title: "Primary School", description: "Something was there", period: "2005 - 2009"),
    EducationTableItem(title: "Secondary School", description: "Something was there", period: "2009 - 2014"),
    EducationTableItem(title: "College", description: "Something was there", period: "2014-2016"),
    EducationTableItem(title: "Higher education", description: "The story begins!", period: "2016 - present")
  ]
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Education"
    initTableView()
  }
  
}

// MARK: - UI
extension EducationViewController {
  
  func initTableView() {
    tableView = BaseTableView()
    tableView.register(EducationTableViewCell.self, forCellReuseIdentifier: Constants.cellID)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.setupAutomaticHeightCounting()
    view.addSubview(tableView)
    tableView.anchor(
      leading: view.leadingAnchor,
      top: view.topAnchor,
      trailing: view.trailingAnchor,
      bottom: view.bottomAnchor,
      leadingConstant: 8,
      topConstant: 44,
      trailingConstant: 8,
      bottomConstant: -8
    )
  }
  
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension EducationViewController: UITableViewDelegate, UITableViewDataSource {
  
  public func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableData.count
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellID, for: indexPath) as! EducationTableViewCell
    cell.configure(with: tableData[indexPath.row])
    return cell
  }
  
}
