import UIKit

public class ProjectDetailViewController: BaseViewController {
  
  var collectionView: UICollectionView!
  var descriptionLabel: UILabel!
  
  struct Constants {
    static let cellID = "ProjectScreenshotCollectionViewCellID"
    static let interItemSpacing: CGFloat = 10
  }

  var project: Project!
  
  init(project: Project){
    self.project = project
    super.init(nibName: nil, bundle: nil)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    title = project?.fullTitle
    initCollectionView()
    initDescriptionLabel()
  }
  
}

// MARK: - UI
extension ProjectDetailViewController {
  
  func initCollectionView() {
    let customLayout = UICollectionViewFlowLayout()
    customLayout.scrollDirection = .horizontal
    customLayout.minimumInteritemSpacing = Constants.interItemSpacing
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: customLayout)
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.alwaysBounceHorizontal = true
    collectionView.register(ProjectScreenshotCollectionViewCell.self, forCellWithReuseIdentifier: Constants.cellID)
    collectionView.backgroundColor = view.backgroundColor
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.layer.radius = 4
    view.addSubview(collectionView)
    collectionView.anchor(
      leading: view.leadingAnchor,
      top: view.topAnchor,
      trailing: view.trailingAnchor,
      leadingConstant: 16,
      topConstant: 40,
      trailingConstant: -16
    )
    collectionView.anchor(heightAnchor: view.heightAnchor, heightMultiplier: 0.65)
  }
  
  func initDescriptionLabel() {
    descriptionLabel = BaseLabel()
    descriptionLabel.font = UIFont.gothamPro(size: 14)
    descriptionLabel.setTextWithIndent(text: project.description)
    view.addSubview(descriptionLabel)
    descriptionLabel.anchor(
      leading: view.leadingAnchor,
      top: collectionView.bottomAnchor,
      trailing: view.trailingAnchor,
      bottom: view.bottomAnchor,
      leadingConstant: 16,
      topConstant: 4, 
      trailingConstant: -16,
      bottomConstant: -4
    )
  }
  
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ProjectDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return project?.screenshots.count ?? 0
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellID, for: indexPath) as! ProjectScreenshotCollectionViewCell
    let screenshotName = project.screenshots[indexPath.row]
    let screenShot = UIImage(named: screenshotName)
    cell.imageView.image = screenShot
    return cell
  }
  
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(
      width: (collectionView.frame.width - Constants.interItemSpacing * 3) * 0.8,
      height: collectionView.frame.height
    )
  }
  
}
