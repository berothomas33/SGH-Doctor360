//
//  OTPViewC.swift
//  SGH Doctor360
//
//  Created by mac on 11/26/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit
import FSCalendar

import WRCalendarView







class OTPViewC: UIViewController  , FSCalendarDelegate ,FSCalendarDataSource ,WRWeekViewDelegate {
    func view(startDate: Date, interval: Int) {
        //
    }
    
    func tap(date: Date) {
        //<#code#>
    }
    
    func selectEvent(_ event: WREvent) {
       // <#code#>
    }
    
    
    
 
    
     var Flag  = 0

    let attachedToCalendarView = UIView()
    
    
  

    @IBOutlet weak var weekview: WRWeekView!
    
    fileprivate weak var calendar: FSCalendar!

    
    let  chatStackview = MainStackToolbarViews()
    
   
    
    
    let stcakview = UIStackView()
    
   // @IBOutlet weak var
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUp()
       
       
        //setupCalendarData()
        
        
       
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
       
      
        
        
        
    }
    
    

   


    func setUp(){
        let calendar = FSCalendar()

        calendar.dataSource = self
        calendar.delegate = self
        self.calendar = calendar

        self.calendar.scope = .week
        self.calendar.locale = Locale(identifier: "en_EN")
        self.calendar.calendarHeaderView.calendar.locale =  Locale(identifier: "en_EN")
        self.calendar.adjustsBoundingRectWhenChangingMonths = true


        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: view.frame.size.width, height: 64))
        view.addSubview(navBar)
        
        

       
        attachedToCalendarView.backgroundColor = .blue

        
        self.weekview.delegate = self
        
        self.weekview.setCalendarDate(Date())
           ///  weekView.delegate = self
      
        
        view.addSubview(calendar)
        view.addSubview(attachedToCalendarView)

        self.calendar.translatesAutoresizingMaskIntoConstraints = false
        self.calendar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
        
        
        
        
        self.calendar.topAnchor.constraint(equalTo: navBar.bottomAnchor ).isActive = true
        
        
       
        self.calendar.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
        self.calendar.heightAnchor.constraint(equalToConstant: 200).isActive = true



        attachedToCalendarView.translatesAutoresizingMaskIntoConstraints = false
        attachedToCalendarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        attachedToCalendarView.topAnchor.constraint(equalTo: self.calendar.contentView.bottomAnchor ).isActive = true
        attachedToCalendarView.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
        attachedToCalendarView.heightAnchor.constraint(equalToConstant: 20).isActive = true


       
        
        
        
        
        view.addSubview(stcakview)
        
        stcakview.translatesAutoresizingMaskIntoConstraints = false
        
        
        stcakview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        
        stcakview.heightAnchor.constraint(equalToConstant: view.frame.height * 0.105).isActive = true
        
        
        stcakview.widthAnchor.constraint(equalToConstant: view.frame.width * 0.89).isActive = true
        
        stcakview.topAnchor.constraint(equalTo: self.attachedToCalendarView.bottomAnchor, constant: 16).isActive = true
        
        
       let imageButton = UIImage(named: "ic_menu") as UIImage?
        let buttonChat   = UIButton(type: UIButton.ButtonType.custom) as UIButton
        buttonChat.frame = CGRect(x: 0, y: 0, width: 25, height:25)
        buttonChat.setImage(imageButton, for: .normal)
        chatStackview.addSubview(buttonChat)
        
       
        
        stcakview.addArrangedSubview(chatStackview)
        
        stcakview.axis = .horizontal
        
        stcakview.layer.position = CGPoint(x: 0, y: 0)
        stcakview.distribution = .fillEqually
        
        
        
        
        
        
 let navItem = UINavigationItem(title: "SomeTitle")

        let doneItem = UIBarButtonItem(title: "Toggle", style: .done, target: self, action: #selector(switchCalendarScope))
        
        navItem.rightBarButtonItem = doneItem
        
        
        navBar.setItems([navItem], animated: true)
        
        
        

        self.weekview.translatesAutoresizingMaskIntoConstraints = false
        self.weekview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.weekview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.weekview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        self.weekview.topAnchor.constraint(equalTo: self.stcakview.bottomAnchor, constant: 16).isActive = true

        self.weekview.calendarType = .day
        



        
        
        
        
        
     
        
        
        
        

        
       
    }






    @objc func switchCalendarScope(){
        if self.calendar.scope == FSCalendarScope.month {
            // self.calendar.setScope(FSCalendarScope.week, animated: true) // this will cause the calendar to be squished again
            self.calendar.scope = .week
       //     movingConstraint.constant = view.safeAreaLayoutGuide.layoutFrame.size.height * -0.20
        } else {
            // self.calendar.setScope(FSCalendarScope.month, animated: true)
            self.calendar.scope = .month
           
            self.view.updateConstraints()
            
            self.calendar.heightAnchor.constraint(equalToConstant: 200).isActive = true

            attachedToCalendarView.translatesAutoresizingMaskIntoConstraints = false
            attachedToCalendarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            // Attaching this view's topAnchor to the calendar's bottom anchor
            attachedToCalendarView.topAnchor.constraint(equalTo: self.calendar.contentView.bottomAnchor ).isActive = true
            attachedToCalendarView.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
            attachedToCalendarView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
         //   movingConstraint.constant = 0
        }
    }
    
    



    
    
    
    
    
    
    
    
    
    



}
