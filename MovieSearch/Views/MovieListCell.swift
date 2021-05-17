
import UIKit

class MovieListCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(_ obj: Movie) {
        titleLbl.text = obj.title
         if let avg = obj.voteAverage {
           ratingLbl.text = "\(avg)"
         }
        if let relData = obj.releaseDate {
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-mm-dd"
            guard let date = dateFormatterGet.date(from: relData) else { return }
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MMM dd, yyyy"
            let str = dateFormatterPrint.string(from: date)
            dateLbl.text = str
        }

    }

}
