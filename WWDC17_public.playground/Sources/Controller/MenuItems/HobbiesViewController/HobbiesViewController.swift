import UIKit

struct Hobby {
  var imageName: String
  var description: String
}

public class HobbiesViewController: BaseViewController {
  
  struct Constants {
    static let cellID = "HobbyTableViewCellID"
  }
  
  let hobbies = [
    Hobby(imageName: "Hobbies/avia.jpg", description: "Aviation"),
    Hobby(imageName: "Hobbies/piano.png", description: "Playing piano"),
    Hobby(imageName: "Hobbies/pingpong.jpg", description: "Ping-pong")
  ]

  var tableView: UITableView!

  public override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Hobbies"
    initTableView()
  }

}

// MARK: - UI
extension HobbiesViewController {
  
  func initTableView() {
    tableView = BaseTableView()
    tableView.register(HobbyTableViewCell.self, forCellReuseIdentifier: Constants.cellID)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.showsVerticalScrollIndicator = false
    tableView.setupAutomaticHeightCounting()
    view.addSubview(tableView)
    tableView.anchor(
      leading: view.leadingAnchor,
      top: view.topAnchor,
      trailing: view.trailingAnchor,
      bottom: view.bottomAnchor,
      leadingConstant: 8,
      topConstant: 44,
      trailingConstant: -8,
      bottomConstant: -8
    )
  }

}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HobbiesViewController: UITableViewDelegate, UITableViewDataSource {
  
  public func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return hobbies.count
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellID, for: indexPath) as! HobbyTableViewCell
    cell.configure(with: hobbies[indexPath.row])
    return cell
  }
  
}
