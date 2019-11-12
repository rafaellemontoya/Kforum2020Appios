//
//  FAQSViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 07/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class FAQSViewController: UIViewController {
    
    var array:  [FAQS] = []
    var preguntaSeleccionada: FAQS = FAQS()

    @IBOutlet weak var tabla: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabla.delegate = self
        tabla.dataSource = self

        cargarDatos()
    }
    
    func cargarDatos(){
        var p1:String = """
Can I attend the meeting and activities of the K-Forum 2020 with my significant other?
"""
        var r1="""
 We have prepared a special agenda of activities for your Significant Other that will run parallel to your attendance to the Forum. Please check the Significant Others tab on the agenda for details.\r\rSignificant Others are welcome to join us for the Cocktail/Dinner on November 14th and for the Luncheon on November 15th.
 """

        var p2="""
 Is there a dress code for attendees?
"""
        var r2="""
Business Casual.\r\rOn November 14th, we recommend bringing a jacket to the Cocktail/ Dinner. \r\rOn November 15th, we recommend that attendees bring an extra pair of comfortable shoes for the morning activities.
"""

        var p3="""
Is there a dress code for Significant Others?
"""
        var r3="""
Please consider Business Casual for the Cocktail/Dinner and for the Luncheon. \r\rOn November 14th, we recommend bringing a jacket to the Cocktail/ Dinner.
"""

        var p4="""
After Completing the Registration Process, is my Hotel Reservation Confirmed?
"""
        var r4="""
Your reservation is confirmed if you marked the “Yes” checkbox in the “Do you require a hotel reservation” question in the registration form.
"""

        var p5="""
At what time is the Check-In and the Check-Out at the Hotel?
"""
        var r5="""
Check-in: 15:00 hrs.\r\rCheck-out: 12:00 hrs.*\r\r*If you are departing on November 15th, you should do an early check-out at 7:00 am. If you are attending with your Significant Other, check-out will be extended until 13:00 hours. We’ll provide luggage storage during the event activities as needed.
"""

        var p6="""
Do I have to Pay for my Hotel Stay?
"""
        var r6="""
Hotel expenses are covered for 3 nights (November 13th – November 15th).\r\rYou are welcome to arrive earlier or depart later. Additional nights are not included. We suggest you check with your company regarding the details or conditions for the payment of additional nights.
"""

        var p7="""
What Services Does my Reservation Include?
"""
        var r7="""
Your reservation includes:\r\r• Accommodation\r\r• Breakfast\r\r• Wireless High Speed Internet Access\r\r• Fitness room\r\rMeals and Alcoholic beverages-only those provided during the official events. \r\rAdditional nights or services are not included.
"""

        var p8="""
Will the Entire Event be at the Hotel?
"""
        var r8="""
For the Attendees:\r\rThe activities on November 14th will be held at the hotel, except for the Cocktail/Dinner at the end of the day. Transportation will be provided.\r\rThe activities on November 15th will be held in an alternative venue. Transportation will be provided.\r\rFor the Significant Others:\r\rThe activities will be outside the hotel, except for breakfast.
"""

        var p9="""
Where will the Cocktail/Dinner Take Place?
"""
        var r9="""
Kaluz Museum\r\rAv. Hidalgo 85, Colonia Centro, Mexico City. Transportation will be provided.
"""

        var p10="""
Where will the Luncheon Take Place?
"""
        var r10="""
The Luncheon will be at a private location. Transportation will be provided.
"""

        var p11="""
 Will There be Special Transportation for the Attendees?
"""
        var r11="""
Transportation from the Airport to the hotel and from the hotel to the Airport, will be managed by each attendee. We recommend to only use Airport-authorized taxicabs, Hotel-authorized taxicabs, or ride-share services such as Uber, Didi or Cabify.\r\rTransportation will be provided: (i) on November 14th from the hotel to the cocktail and back to the hotel; (ii) on November 15th for attendees at 7:30 am from the hotel to the K-Forum alternative venue; and (iii) from the alternative venue to the Luncheon. The hotel lobby will be our meeting point, please arrive on time.\r\rFor Significant Others, all the activities within their agenda include transportation. The meeting point will be the hotel lobby.
"""




        array.append( FAQS(pregunta: p1, respuesta: r1) )
        array.append( FAQS(pregunta: p2, respuesta: r2) )
        array.append( FAQS(pregunta: p3, respuesta: r3) )
        array.append( FAQS(pregunta: p4, respuesta: r4) )
        array.append( FAQS(pregunta: p5, respuesta: r5) )
        array.append( FAQS(pregunta: p6, respuesta: r6) )
        array.append( FAQS(pregunta: p7, respuesta: r7) )
        array.append( FAQS(pregunta: p8, respuesta: r8) )
        array.append( FAQS(pregunta: p9, respuesta: r9) )
        array.append( FAQS(pregunta: p10, respuesta: r10) )
        array.append( FAQS(pregunta: p11, respuesta: r11) )
        
        
    }
}
    extension FAQSViewController: UITableViewDelegate, UITableViewDataSource{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         array.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = self.tabla.dequeueReusableCell(withIdentifier: "cell") as! FAQSTableViewCell
         cell.agregarCelda(pregunta:array[indexPath.row])
         return cell
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.preguntaSeleccionada = array[indexPath.row]
        performSegue(withIdentifier: "faqSeleccionadaSG", sender: self)
         
     
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             let receiver = segue.destination as! FAQSSeleccionadaViewController
             receiver.seleccionada = self.preguntaSeleccionada
         }
}
     
    


