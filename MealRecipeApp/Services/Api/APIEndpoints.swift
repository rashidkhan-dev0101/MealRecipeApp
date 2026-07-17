

import Foundation

enum APIEndpoints {

    static let baseURL = "https://www.themealdb.com/api/json/v1/1"

    case categories
    case latest
    case random
    case search(String)
    case mealDetail(String)
    case mealsByCategory(String)

    var path: String {
        switch self {
        case .categories:
            return "/categories.php"

        case .latest:
            return "/latest.php"

        case .random:
            return "/random.php"

        case .search(let text):
            return "/search.php?s=\(text)"

        case .mealDetail(let id):
            return "/lookup.php?i=\(id)"

        case .mealsByCategory(let category):
            return "/filter.php?c=\(category)"
        }
    }

    var url: URL {
        URL(string: Self.baseURL + path)!
    }
}
