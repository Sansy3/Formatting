import Foundation

public protocol FormattingServiceProtocol {
    func formatDate(_ dateString: String) -> String
}

public final class FormattingService: FormattingServiceProtocol {
    
    public init() {}
    
    public func formatDate(_ dateString: String) -> String {
        let formatter = ISO8601DateFormatter()
        formatter.timeZone = TimeZone.current
        
        if let date = formatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateStyle = .medium
            outputFormatter.timeStyle = .short
            outputFormatter.timeZone = TimeZone.current
            
            return outputFormatter.string(from: date)
        }
        
        return dateString
    }
}
