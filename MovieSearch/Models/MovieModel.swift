
import Foundation
//{
//    adult = 0;
//    "backdrop_path" = "/zMkJR6l0V4StABxqNzSLR6cZhTd.jpg";
//    "genre_ids" =     (
//        878,
//        35
//    );
//    id = 567097;
//    "original_language" = es;
//    "original_title" = "Star Wars: Goretech";
//    overview = "The imperial forces of Lord Quimio capture princess Felelia and steal a big cargo of vital force for the rebellion. Obi Wan Quequena, warned by the princess, starts gathering a group of brave people to recover the force, save the princess and end the empire that strikes the galaxy.";
//    popularity = "2.063";
//    "poster_path" = "/cDYtrX0r80OdhzT78dZaUUunioT.jpg";
//    "release_date" = "2018-12-07";
//    title = "Star Wars: Goretech";
//    video = 0;
//    "vote_average" = 5;
//    "vote_count" = 2;
//},
struct MovieResponse: Decodable {
    var totalResults: Int?
    var results: [Movie]?
    var page: Int?
    var totalPages: Int?
    private enum CodingKeys: String, CodingKey {
        case total_results
        case results
        case page
        case total_pages
    }
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        totalResults = try? values?.decodeIfPresent(Int.self, forKey: .total_results)
        results = try? values?.decodeIfPresent([Movie].self, forKey: .results)
        page = try? values?.decodeIfPresent(Int.self, forKey: .page)
        totalPages = try? values?.decodeIfPresent(Int.self, forKey: .total_pages)
    }
}



struct Movie: Decodable {
    var adult: Int?
    var backdropPath: String?
    var genreIds: [String]?
    var popularity: String?
    var id: Int?
    var originalLanguage : String?
    var originalTitle : String?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var video: Int?
    var voteAverage: Double?
    var voteCount: Int?
    private enum CodingKeys: String, CodingKey {
        case adult
        case backdrop_path
        case genre_ids
        case popularity
        case id
        case original_language
        case original_title
        case overview
        case poster_path
        case release_date
        case title
        case video
        case vote_average
        case vote_count
    }
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        adult = try? values?.decodeIfPresent(Int.self, forKey: .adult)
        backdropPath = try? values?.decodeIfPresent(String.self, forKey: .backdrop_path)
        genreIds = try? values?.decodeIfPresent([String].self, forKey: .genre_ids)
        overview = try? values?.decodeIfPresent(String.self, forKey: .overview)
        popularity = try? values?.decodeIfPresent(String.self, forKey: .popularity)
        id = try? values?.decodeIfPresent(Int.self, forKey: .id)
        originalLanguage = try? values?.decodeIfPresent(String.self, forKey: .original_language)
        originalTitle = try? values?.decodeIfPresent(String.self, forKey: .original_title)
        posterPath = try? values?.decodeIfPresent(String.self, forKey: .poster_path)
        releaseDate = try? values?.decodeIfPresent(String.self, forKey: .release_date)
        title = try? values?.decodeIfPresent(String.self, forKey: .title)
        video = try? values?.decodeIfPresent(Int.self, forKey: .video)
        voteAverage = try? values?.decodeIfPresent(Double.self, forKey: .vote_average)
        voteCount = try? values?.decodeIfPresent(Int.self, forKey: .vote_count)
    }
}
