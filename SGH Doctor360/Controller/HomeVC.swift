//
//  HomeVC.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/10/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class HomeVC: UIViewController  , UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    @IBOutlet var HomeCollection: UICollectionView!
    

    
    
    var estimateWidth = 160.0
       var cellMarginSize = 16.0
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCCl", for: indexPath) as! homeCCl
        

        
        var x = ""
        
        x = String(indexPath.row)
        
        cell2.bav.image = UIImage(named: x)
        
        
//        if (indexPath.row == 2 ) {
//
//
//            cell2.bav.contentMode = .scaleToFill
//
//        }
        
        
        return cell2
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return self.HomeCollection.frame.width * 0.105
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return self.HomeCollection.frame.width * 0.105
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        
        if (indexPath.row == 0 ) {
                         
              
            
            
          
                   
                   
                   
                   
                   
           if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RadioDoctorList") as? RadioDoctorList
                                                  {
                                                      
                                                      
                                                      
                                                    vc.Flag = "LAB"
                                                      
                                                      
                                                      let nav = UINavigationController(rootViewController: vc)
                                                      
                                                     
                                                      nav.modalPresentationStyle = .overFullScreen
                                                      
                                                      
                                                      self.present(nav, animated: false, completion: nil)
                                                      
                                                  }
                                   
                   
                   
                   
                   
                   
                   
               
            
            
            
                     
                               
                         
                     }
        
        
        if (indexPath.row == 1 ) {
                         if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RadioDoctorList") as? RadioDoctorList
                                        {
                                            
                                            
                                          vc.Flag = "RADIO"
                                            
                                            
                                            
                                            let nav = UINavigationController(rootViewController: vc)
                                            
                                           
                                            nav.modalPresentationStyle = .overFullScreen
                                            
                                            
                                            self.present(nav, animated: false, completion: nil)
                                            
                                        }
                         
                        
                         
                     }
        
        
        
        
        if (indexPath.row == 2 ) {
                
            
           
          
            
              if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AllPatientList") as? AllPatientList
                                                            {
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                let nav = UINavigationController(rootViewController: vc)
                                                                
                                                               
                                                                nav.modalPresentationStyle = .overFullScreen
                                                                
                                                                
                                                                self.present(nav, animated: false, completion: nil)
                                                                
                                                            }
            
            
            

            
            
            
            
                   
                  
                   
               }
        
        if (indexPath.row == 3 ) {
            
            
           
               
               if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReferallVc") as? ReferallVc
                                                             {
                                                                 
                                                                 
                                                                 
                                                                 
                                                                 
                                                                 
                                                                 let nav = UINavigationController(rootViewController: vc)
                                                                 
                                                                
                                                                 nav.modalPresentationStyle = .overFullScreen
                                                                 
                                                                 
                                                                 self.present(nav, animated: false, completion: nil)
                                                                 
                                                             }
                        
              
               
           
            
        }
        
        if (indexPath.row == 4 ) {
                   
                   if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CalenderView") as? CalenderView
                                                                 {
                                                                     
                                                                     
                                                                     
                                                                     
                                                                     
                                                                     
                                                                     let nav = UINavigationController(rootViewController: vc)
                                                                     
                                                                    
                                                                     nav.modalPresentationStyle = .overFullScreen
                                                                     
                                                                     
                                                                     self.present(nav, animated: false, completion: nil)
                                                                     
                                                                 }
                            
                  
                   
               }
               
        
    }
 
    

  
    

    override func viewDidLoad() {
        
        let nib2 = UINib.init(nibName: "homeCCl", bundle: nil)

        
        
        
        
        
        
        self.HomeCollection.register(nib2, forCellWithReuseIdentifier: "homeCCl")
        
        
        
        self.HomeCollection.delegate = self
        self.HomeCollection.dataSource = self
        
        
        
        // SetupGrid view
               self.setupGridView()
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setupGridView()
        DispatchQueue.main.async {
           self.HomeCollection.reloadData()
        }
    }
    

    
    
    func setupGridView() {
           let flow = self.HomeCollection.collectionViewLayout as! UICollectionViewFlowLayout
           flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
           flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
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


extension HomeVC: UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    

          
       
      
       
            
       

           if (indexPath.row ==  0 || indexPath.row ==  1 || indexPath.row ==  3 || indexPath.row == 4 ) {
        let   width  = ((self.HomeCollection.frame.width * 0.88)) / 2
             let   height = ((self.HomeCollection.frame.height - (self.HomeCollection.frame.width * 0.10) ) / 3.22125)
            
            
            return CGSize(width: width, height: height)
            
            
            
           } else {
               // Second section
         let     width  = ((self.HomeCollection.frame.width * 0.77))
        let   height = ((self.HomeCollection.frame.height - (self.HomeCollection.frame.width * 0.10) ) / 3.22125)
            
            return CGSize(width: self.view.frame.size.width, height: height)
            
            
            
           }
    
    
}

    
    
    
    func calculateWith() -> CGFloat {
           let estimatedWidth = CGFloat(estimateWidth)
           let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
           
           let margin = CGFloat(cellMarginSize * 2)
           let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
           
           return width
       }
    
    
    
    
    
}
