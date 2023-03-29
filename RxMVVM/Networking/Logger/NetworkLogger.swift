//
//  NetworkLogger.swift
//  RxMVVM
//
//  Created by Hoang Nguyen on 9/11/22.
//

import Foundation

final class NetworkLogger: URLProtocol {
    static var testURLs = [URL?: Data]()
    private var log: String = ""
    override public class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        guard let req = (request as NSURLRequest).mutableCopy() as? NSMutableURLRequest else { return }
        let session = Foundation.URLSession(
            configuration: URLSessionConfiguration.default,
            delegate: nil, // AuroraURLSessionPinningDelegate()
            delegateQueue: nil
        )
        
        session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                self.client?.urlProtocol(self, didFailWithError: error)
                self.logError(error as NSError)
                
                return
            }
            guard let response = response, let data = data else {
                print("Missing response, or data")
                return
            }
            
            self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: URLCache.StoragePolicy.allowed)
            self.client?.urlProtocol(self, didLoad: data)
            self.client?.urlProtocolDidFinishLoading(self)
            self.logResponse(response, data: data)
        }) .resume()
        
        logRequest(req as URLRequest)
        
    }
    
    override func stopLoading() {}
    
    public func logError(_ error: NSError) {
        self.log += "⚠️\n"
        self.log += "  Error: \n\(error.localizedDescription)\n"

        if let reason = error.localizedFailureReason {
            self.log += "  Reason: \(reason)\n"
        }

        if let suggestion = error.localizedRecoverySuggestion {
            self.log += "  Suggestion: \(suggestion)\n"
        }
    }
    
    /// Log response
       /// - Parameters:
       ///   - response: URL Response
       ///   - data: URL Response Data
       public func logResponse(_ response: URLResponse, data: Data? = nil) {
           self.log = ""
           if let url = response.url?.absoluteString {
               self.log += "  Response: \(url)\n"
           }

           if let httpResponse = response as? HTTPURLResponse {
               let localisedStatus = HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode).capitalized
               self.log += "  HTTP \(httpResponse.statusCode): \(localisedStatus)\n"
           }

           if let headers = (response as? HTTPURLResponse)?.allHeaderFields as? [String: AnyObject] {
               self.log += "  Header:"
           }



           guard let data = data else { return }

           do {
               let json = try JSONSerialization.jsonObject(
                   with: data,
                   options: .mutableContainers
               )

               let pretty = try JSONSerialization.data(
                   withJSONObject: json,
                   options: .prettyPrinted
               )

               if let string = NSString(
                   data: pretty,
                   encoding: String.Encoding.utf8.rawValue
               ) {
                   self.log += "  JSON:\n"
                   for line in string.components(separatedBy: "\n") {
//                       self.log += "    " + line.replace("\" :", withString: "\":") + "\n"
                   }
               }
           } catch {
               if let string = NSString(
                   data: data,
                   encoding: String.Encoding.utf8.rawValue
               ) {
                   self.log += "  Data:\n"
                   for line in string.components(separatedBy: "\n") {
                       self.log += "    " + line + "\n"
                   }
               }
           }
           
           print(self.log)
       }
    
    
    /// Log request
      /// - Parameter request: URL Request
      public func logRequest(_ request: URLRequest) {
          self.log = "Networklog\n"
          if let url = request.url?.absoluteString,
             let method = request.httpMethod {
              self.log += "  \(method) \(url)\n"
          }
          print(self.log)

      }
    
}
extension NetworkLogger: URLProtocolClient {
    
    func urlProtocol(_ protocol: URLProtocol, didFailWithError error: Error) {
        print("didFailWithError == \(error.localizedDescription)")
    }
    
    func urlProtocol(_ protocol: URLProtocol, didReceive challenge: URLAuthenticationChallenge) {
        print("didReceive == \(challenge.description)")
    }
    
    func urlProtocol(_ protocol: URLProtocol, didCancel challenge: URLAuthenticationChallenge) {
        
    }
    
    
    func urlProtocol(_ protocol: URLProtocol, wasRedirectedTo request: URLRequest, redirectResponse: URLResponse) {
        
    }
    
    func urlProtocol(_ protocol: URLProtocol, cachedResponseIsValid cachedResponse: CachedURLResponse) {
        
    }
    
    func urlProtocol(_ protocol: URLProtocol, didReceive response: URLResponse, cacheStoragePolicy policy: URLCache.StoragePolicy) {
        
    }
    
    func urlProtocol(_ protocol: URLProtocol, didLoad data: Data) {
        print("didLoad == \(data.convertToString)")
    }
    
    func urlProtocolDidFinishLoading(_ protocol: URLProtocol) {
        print("urlProtocolDidFinishLoading ")
        
    }
}
