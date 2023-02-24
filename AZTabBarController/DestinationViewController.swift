//
//  DestinationViewController.swift
//  AZTabBarController
//
//  Created by Yannick Edouard MEKONGO ABANDA on 25/01/2023.
//

import UIKit

class DestinationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var coins = [Coin]()
    @IBOutlet weak var tableView: UITableView!
    var sheet = UIActionSheet()
    
    @IBOutlet weak var filtre1: UIButton!
    @IBOutlet weak var filtre2: UIButton!
    @IBOutlet weak var filtre3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        // Do any additional setup after loading the view.
        self.title = "Destination"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coins.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "currency") as? CurrencyCell {
            
            cell.coin = coins[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    func getApi(_ query : String){
        let apiKey = "coinranking30b636214d46778dc6a65fc78a3482aa447f27cddb0a224d"
        let baseString = "https://api.coinranking.com/v2/coins"
        let urlString = baseString + "?" + query
        
        if let url = URL(string: urlString ){
            
            URLSession.shared.dataTask(with: url) { (d, r, e) in
                
                if let data = d {
                    
                    do {
                        let result = try JSONDecoder().decode(APIResponse.self, from: data)
                        
                        let dataCoins = result.data?.coins
                        
                        DispatchQueue.main.async {
                            self.coins = dataCoins ?? []
                            self.tableView.reloadData()
                        }
                        
                    }catch {
                        print(error.localizedDescription)
                        
                    }
                }
                
                
                if let error = e {
                    print("Errror : \(error.localizedDescription)")
                }
            }.resume()
        }else { //Si erreur
            
            self.showSheetError("ERROR:  URL NOT FOUND")
            
        }
        
    }
    
    func showSheetError(_ textError : String) {
        self.sheet = UIActionSheet(frame: .zero)
        var label = UILabel()
        label.text = "⚠ \(textError)"
        label.textColor = .red
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        self.sheet.backgroundColor = .systemGray5
        self.sheet.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
        self.view.addSubview(self.sheet)
        self.sheet.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(100)
        }
        self.sheet.show(from: .zero, in: self.view, animated: true)
    }

  
    @IBAction func onFiltreClick(_ sender: UIButton) {
    
        getApi("currency=EUR&timePeriod=24h")
       
    }
    
    
    @IBAction func onclickfiltre2(_ sender: Any) {
        getApi("orderBy=price")
    }
    
    @IBAction func onClickFiltre3(_ sender: Any) {
        getApi("limit=10")
    }
    
}
