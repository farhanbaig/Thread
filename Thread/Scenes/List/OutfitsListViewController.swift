
import UIKit

fileprivate let reuseIdentifier = "OutfitCellId"

protocol OutfitListViewDelegate {
    func displayOutfits()
    func failure(message: String)
}

class OutfitsListViewController:  UITableViewController {
    var viewModel: OutfitsListViewModel!

    required init() {
        viewModel = OutfitsListViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.delegate = self
        viewModel.fetchOutfitsList()
    }
}


//MARK: - UI Setup
extension OutfitsListViewController {
    private func setupUI() {
        self.navigationItem.title = "Winter Outfits"

        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(OutfitTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
       
        // Refresh control
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(pullDownToRefresh), for: .valueChanged)
    }
    
    @objc private func pullDownToRefresh() {
        self.viewModel.fetchOutfitsList()
    }
}


//MARK: - TableView Delgate & DataSource
extension OutfitsListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outfits?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! OutfitTableViewCell
        cell.outfit = viewModel.outfits?[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let outfit = self.viewModel.outfits?[indexPath.row] else {return}
        let controller = OutfitDetailViewController(outfit: outfit)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


//MARK: - OutfitListViewDelegate
extension OutfitsListViewController: OutfitListViewDelegate {
    func displayOutfits() {
        DispatchQueue.main.async {
            self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    func failure(message: String) {
        DispatchQueue.main.async {
            self.refreshControl?.endRefreshing()
            self.alert(message: message)
        }
    }
}
