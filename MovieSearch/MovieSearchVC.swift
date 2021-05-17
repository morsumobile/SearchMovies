
import UIKit

class MovieSearchVC: UIViewController {
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var listTblView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var noDataLabel: UILabel!
    var searchString: String?
    var movieResponse: MovieResponse?
    var movieResults: [Movie]?
    override func viewDidLoad() {
        super.viewDidLoad()
        listTblView.tableFooterView = UIView(frame: .zero)
        // Do any additional setup after loading the view.
       
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            let destination = segue.destination as? MovieDetailVC
            destination?.movieDetails = sender as? Movie
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func searchGoAction(_ sender: UIButton) {
        searchString = searchBar.text
        if let text =  searchString {
            activityIndicatorView.startAnimating()
            NetworkManager.fetchSearchList(text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") { response, error in
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                }
                if let res = response {
                    self.movieResponse = res
                    self.movieResults = self.movieResponse?.results
                    DispatchQueue.main.async {
                        self.listTblView.reloadData()
                        self.noDataLabel.isHidden = self.movieResults?.count ?? 0 > 0
                    }
                }
                if let err = error {
                    print("Show Alert", err.localizedDescription)
                }
            }
        }
        
    }
}

extension MovieSearchVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let results = movieResults, results.count > 0 else {
            return 0
        }
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell") as? MovieListCell else {
            return MovieListCell()
        }
        cell.accessoryType = .disclosureIndicator
        if let results = movieResults {
            cell.updateCell(results[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = movieResults?[indexPath.row]
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
    
}
