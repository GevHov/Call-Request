//
//  ViewController.swift
//  Exercise
//
//  Created by Gevorg Hovhannisyan on 21.10.21.
//
import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var result: [Result] = []
    var pageNumber = 1
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        return tableView
        
    }()
    
    private var data = [String]()
    
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
//        self.view.addSubview(tableView)
        getResults(url: "https://www.helix.am/temp/json.php")
        
    }
    func getResults(url: String) {
        AF.request(url, method: .get)
            .responseJSON {
                response in
                switch response.result {
                case .success(_):
                    do {
                        let responsee = try JSONDecoder().decode(Result.self, from: response.data!)
//                        print("response", responsee.metadata)
                        responsee.metadata.forEach {
                            print($0.title)
                        }
                    } catch let DecodingError.dataCorrupted(context) {
                        print(context)
                        
                    } catch let DecodingError.keyNotFound(key, context) {
                        print("Key \(key) not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.valueNotFound(value, context) {
                        print("Value \(value) not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.typeMismatch(type, context)  {
                        print("Type \(type) mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch {
                        print("error: ", error)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}


//MARK: - EXTENSIONS
extension ViewController: UITableViewDataSource, UIScrollViewDelegate, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if result.count - 2 == indexPath.row {
            getResults(url:"https://www.helix.am/temp/json.php")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}
