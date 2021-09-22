//
//  ViewController.swift
//  CurrencyApp
//
//  Created by Saba Khitaridze on 17.09.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var exchangeTableView: UITableView!
    
    var currencyData: [CurrencyData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        configureRefreshControl()
    }
    
    func fetchData() {
        let urlString = "https://nbg.gov.ge/gw/api/ct/monetarypolicy/currencies/ka/json"
        let url = URL(string: urlString)
        guard url != nil else {
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                //Parsing JSON
                let decoder = JSONDecoder()
                do {
                    self.currencyData = try decoder.decode([CurrencyData].self, from: data!)
                    DispatchQueue.main.async {
                        self.exchangeTableView.reloadData()
                    }
                }
                catch {
                    print("error fetching data \(error)")
                }
            }
        }
        //API call
        task.resume()
    }
    
    func configureRefreshControl () {
        exchangeTableView.refreshControl = UIRefreshControl()
        exchangeTableView.refreshControl?.attributedTitle = NSAttributedString(string: currentDate())
        exchangeTableView.refreshControl?.addTarget(self, action:
                                                        #selector(handleRefreshControl),
                                                    for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        fetchData()
        exchangeTableView.refreshControl?.attributedTitle = NSAttributedString(string: self.currentDate())
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.exchangeTableView.refreshControl?.endRefreshing()
        }
    }
    
    func currentDate() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMMM yyyy, HH:mm"
        dateFormater.locale = .autoupdatingCurrent
        let date = dateFormater.string(from: NSDate() as Date)
        
        return date
    }
}
