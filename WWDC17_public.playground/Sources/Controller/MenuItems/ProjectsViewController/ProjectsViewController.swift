import UIKit

public class ProjectsViewController: BaseViewController {
  
  struct Constants {
    static let cellID = "ProjectCollectionViewCellID"
    static let cellSize = CGSize(width: 70, height: 80)
  }

  var collectionView: UICollectionView!

  public override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Projects"
    initCollectionView()
  }
  
}

// MARK: - UI
extension ProjectsViewController {
  
  func initCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.minimumInteritemSpacing = 15
    layout.minimumLineSpacing = 15
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(ProjectCollectionViewCell.self, forCellWithReuseIdentifier: Constants.cellID)
    collectionView.backgroundColor = view.backgroundColor
    collectionView.delegate = self
    collectionView.dataSource = self
    view.addSubview(collectionView)
    collectionView.anchor(
      leading: view.leadingAnchor,
      top: view.topAnchor,
      trailing: view.trailingAnchor,
      bottom: view.bottomAnchor,
      leadingConstant: 16,
      topConstant: 44,
      trailingConstant: -16,
      bottomConstant: 8
    )
  }
  
}
  
// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ProjectsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return projects.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellID, for: indexPath) as! ProjectCollectionViewCell
    cell.configure(with: projects[indexPath.row])
    return cell
  }
  
  public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    
    let detailViewController = ProjectDetailViewController(project: projects[indexPath.row])
    setEmptyBackButton()
    navigationController?.pushViewController(detailViewController, animated: true)
  }
  
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return Constants.cellSize
  }
  
}
