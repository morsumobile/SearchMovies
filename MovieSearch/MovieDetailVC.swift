

import UIKit

class MovieDetailVC: UIViewController {
    var movieDetails: Movie?
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let obj = movieDetails, let path = obj.posterPath {
            let urlStr = baseURLImage + path
            imageView.image = UIImage(named: "placeholderImage")
            imageView.loadImage(urlStr)
        }
        if let obj = movieDetails, let text = obj.title {
            titleLbl.text = text
        }
        if let obj = movieDetails, let text = obj.overview {
            descriptionLbl.text = text
        }
        if let obj = movieDetails, let relData = obj.releaseDate {
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-mm-dd"
            guard let date = dateFormatterGet.date(from: relData) else { return }
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "mm/dd/yy"
            let str = dateFormatterPrint.string(from: date)
            dateLbl.text = "Release Date: \(str)"
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImageView {
    func loadImage(_ urlString: String) {
        DispatchQueue.global().async { [weak self] in
            if let url = URL(string: urlString), let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
