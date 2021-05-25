import UIKit

protocol ServiceFactory {
    func create() -> Service
}

protocol Service {
    var url: URL { get }
}

class StagingService: Service {
    var url: URL { return URL(string: "https://dev.localhost/")! }
}

class StagingServiceFactory: ServiceFactory {
    func create() -> Service {
        return StagingService()
    }
}

class ProductionService: Service {
    var url: URL { return URL(string: "https://live.localhost/")! }
}

class ProductionServiceFactory: ServiceFactory {
    func create() -> Service {
        return ProductionService()
    }
}


class AppServiceFactory: ServiceFactory {

    enum Environment {
        case production
        case staging
    }

    var env: Environment

    init(env: Environment) {
        self.env = env
    }

    func create() -> Service {
        switch self.env {
        case .production:
            return ProductionServiceFactory().create()
        case .staging:
            return StagingServiceFactory().create()
        }
    }
}

let factory = AppServiceFactory(env: .production)
let service = factory.create()
print(service.url)


