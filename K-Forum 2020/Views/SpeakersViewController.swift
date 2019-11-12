//
//  SpeakersViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 31/10/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit
import FirebaseFirestore


class SpeakersViewController: UIViewController {

     var db: Firestore!
    let coleccion = "speakers"
    
    var array:  [Speaker] = []
    var speakerSeleccionado = Speaker()
    var arraySpeaker2:  [Speaker] = []
    var arraySpeaker3:  [Speaker] = []
    var secciones: [String] = ["Keynote Speakers", "Speakers", "Panelists"]
    var sectionData: [Int:[Speaker]] = [:]

    let b1: String = """
Ideas that Expand Minds and Inspire a Change of Heart\r\rAnders is an active member of TEDGlobal and has keynoted at TEDx in the United States and Australia, was nominated for the World Economic Forum's Young Global Leader in 2019 and was the keynote speaker at the G20's Y20 Summit in Australia. His presentations are meticulously researched, highly energetic and always fascinating with content tailored to the audience, which is why clients like Apple, Cisco, Mercedes Benz, Hilton, SAP, Gartner and Macquarie Bank have turned to Anders over the years to help them to push the bounds of the status quo -- translating research into valuable foresight and business impact.\r\rA global thought leader since 2005, Anders works across four continents as a speaker, futurist and author.
"""
    let b2: String = """
The Power of Transcendent Leadership\r\rFred Kofman is Google’s Vice President and leadership development advisor, director of the Conscious Leadership Center at Tecnológico de Monterrey, founder and president of the Conscious Business Center International. His approach to leadership has little to do with the standard practices taught in business school and traditional books. Bringing together economics and business theory, communications and conflict resolution, family counseling and mindfulness mediation, Fred argues in his book The Meaning Revolution that our most deep-seated, unspoken, and universal anxiety stems from our fear that our life is being wasted--that the end of life will overtake us when our song is still unsung.\r\rFred believes that the biggest driver of motivation is the chance to serve a larger purpose beyond our careers and ourselves, rather than salary, benefits, bonuses, or other material incentives; companies that are able to successfully focus their people, their teams, and their culture around meaning outperform their competition.
"""
    let b3: String = """
Tomás has a proven track record as founder and CEO of Cosmetic Colors guiding the company from a start up to a joint venture with Schwan Cosmetics and together to a well-established leader in the field. The company has grown in a socially responsible way steadily increasing by 25 % per year for fifteen years.\r\rDuring this period, he developed a strategy and business plan focused on three pillars: (i.) Building a winning team that share the common goal of becoming a positive benchmark in Social and Environmental achievements, (ii.) Designing a robust and reliable structure and process that permits agility and flexibility to deliver customers undeniable value through innovation, (iii.) and Financial performance that permits the organization to grow and fuel Social and Environmental initiatives.\r\rDuring his tenure the company received various national and international certifications and awards in CSR achievements.\r\rHe currently holds the Position of CMBDO at Schwan-STABILO Cosmetics GmbH & Co. KG, where he is responsible to drive business growth through the development and implementation of strategy for each SBA of the company.\r\rHe is part of the EXCOM board and Schwan Cosmetics in Germany and Chairman of the board of the subsidiaries in China, Indonesia and Mexico.\r\rTomás has a degree in Engineering and an MBA from IPADE Business School (Instituto Panamericano de Alta Dirección de Empresa). He was a professor at Universidad Iberoamericana and speaker at UAEM for CSR programs.
"""
    let b4: String = """
Edward D. Breen is the Executive Chairman of DuPont. Mr. Breen joined the DuPont board directors in February 2015 and was named CEO of DowDuPont on November 9, 2015. He is now the executive chairman of the newly transformed DuPont.\r\rBefore joining DuPont, Edward served as chairman and CEO of Tyco International from July 2002 until September 2012. While he was there, he was instrumental in making Tyco a market leader, rescuing the company from near bankruptcy by rebuilding the brand and its credibility.\r\rPrior to Tyco, from 2000 to 2002, Edward held several senior management positions at Motorola, including president and chief operating officer. He is credited with instituting cost management programs that made Motorola a more efficient and effective organization and led the company back to profitability. From December 1997 to January 2000, he served as chairman, president, and chief executive officer of General Instrument Corporation, where he created significant long-term shareholder value by driving a revenue growth strategy. Between 1994 and 1997, Edward was president of the Broadband Networks Group for General Instrument, president of Eastern Operations for the Communications Division, and served as executive vice president of Terrestrial Systems. He is currently a director of Comcast Corporation, and a member of the advisory board of New Mountain Capital LLC, a private equity firm.\r\rEdward has been awarded many governance awards including being named one of the "100 Most Influential People in Business Ethics" by Ethisphere.
"""
    let b5: String = """
Antonio del Valle Ruíz was Chairman of the Board of Directors of Kaluz until September 1st, 2012.\r\rMr. del Valle has been actively involved in Mexico’s financial sector for more than 40 years. He currently sits on the Board of Directors of companies such as Elementia, Grupo Financiero Ve por Más (BX+), Teléfonos de México, Grupo México and Escuela Bancaria y Comercial, among others.\r\rHe was CEO of Crédito Refaccionario Industrial from 1962 until 1974. In 1974, Mr. del Valle acquired and merged several financial institutions, leading to the creation of Bancreser , and becoming the bank’s Chairman of the Board, CEO and largest shareholder until September 1982, leading the institution to become one of the most productive in Mexico’s financial sector. In 1992 Mr. del Valle acquired Banco Internacional and founded Grupo Financiero Bital, where he was also Chairman of the Board, CEO and main shareholder until 2001, when he and his children created Kaluz.\r\rAntonio del Valle Ruíz has a degree in Accounting from Escuela Bancaria y Comercial, and a degree in Executive Business Director from IPADE Business School (Instituto Panamericano de Alta Dirección de Empresa).\r\rHe ran the Private Sector Center for Economic Studies for four years until 1989. In 1998, he presided over the Mexican Banking Association, and has been named twice as Chairman of the Mexican Business Council (1993 – 1995, 2003 – 2005).\r\rThrough Kaluz Foundation, he promotes different programs of high social and economic impact supporting education, housing and sporting activities. Mr. del Valle supports several cultural and education organizations, including Fundación Tamayo, Del Prado Museum in Madrid, Fomento Cultural Kaluz and is a member of the Board of the Magdalena Ruíz del Valle Foundation. Recently, he was appointed to the Board of the Hispanic Society in New York.
"""
    let b6: String = """
Antonio del Valle is currently the Chairman of the Board of Directors of Kaluz, the parent company of Orbia, Elementia and Grupo Financiero Ve por Más (BX+). He is also the Chairman of the Board of Directors of Grupo Financiero Ve por Más (BX+) and a member of the Board of Directors of Orbia, Elementia, Byline and Afianzadora Sofimex.\r\rOutside of his responsibilities at Kaluz, he is a member of the Trusts of the Salvador Zubirán National Institute of Medical Sciences and Nutrition, the San Ildefonso Museum, El Peñón Foundation, and is the Chairman of the Probosque de Chapultepec Trust.\r\rIn February 2019, he stepped up to become the Chairman of the Mexican Business Council, one of the private sector’s most influential groups, bringing together the 60 largest Mexican companies.
"""
    let b7: String = """
Since 2005, she has focused on volunteering and philanthropy. She actively participated in the restructuring of Kardias A.C. in 2008 and since then, acts as their Executive Vice President of the Board of Directors. Since 2015 she chairs Fundación Kaluz, the philanthropic arm of the del Valle Perochena family.\r\rShe currently participates as an active board member of various NGOs, Hospitals and Museums, as well as on the Board of Directors of several of the family companies.\r\rBlanca del Valle holds an Actuarial Science degree from Universidad Anahuac. For 15 years, she worked alongside her father, Don Antonio del Valle Ruiz, in the financial sector. She is married and has five children.
"""
    let b8: String = """
Francisco del Valle is the Chairman of the Board of Directors of Elementia, SAE Institute Latin America and Innova Schools Mexico, and he is also a member of the Board of Directors of Grupo Financiero Ve por Más (Bx+), Grupo Cuprum, Grupo Inter, Endeavor and Techo.\r\rLed by Francisco, Elementia was publicly listed in international markets in 2014 and the Mexican Stock Exchange in 2015. Elementia also created Cementos Fortaleza, Mexico’s newest cement company. In 2010, Francisco ventured into education and founded SAE Institute Latin America, a higher education institution focused on creative digital media. In 2013, with the support of INADEM he created Fenix, a private capital fund. In 2018, he opened the first Innova Schools institution in Mexico and in 2019, he founded Artek Higher Education Institution, focused on emerging, exponential and digital technologies.\r\rThrough Fundación Kaluz, Francisco supports high performance athletes as well as environmental initiatives and education and housing programs.
"""
    let b9: String = """
Guadalupe del Valle has extensive experience in the Banking and Finance industries. She has worked for financial institutions such as Banco Santander and BITAL.\r\rToday, she is responsible for the Family Office and an active investment fund and has been closely involved in several family-owned businesses in the past decade.\r\rGuadalupe is a member of the Board of Directors at Orbia, Kaluz, Fundación Kaluz and SAE Institute Latin America. She holds a BS in Economics and an MBA from IPADE Business School (Instituto Panamericano de Alta Dirección de Empresa).

"""
    let b10: String = """
Juan Pablo del Valle started his career working for Telmex in 1996, where he led the implementation of the first fiber optics sea cable between the U.S.A, Mexico, Central and South America. After graduating from Business School, he founded a low-income housing business, Grupo Modulo Progresivo. In 2003, he joined the family business, Kaluz, where he is responsible for Real Estate and Industrial ventures. He is currently the Chairman of the Board of Directors of Orbia.\r\rJuan Pablo serves on the board of Johnson Controls International and Elementia. He is the Chairman of Mexico City's Water Fund, Co-Chairman of The Nature Conservancy´s Latin America Conservation Council and Co-Chairman of the Council of the Americas Advisory Board.\r\rJuan Pablo has a degree in Industrial Engineering from Universidad Anahuac and an MBA from Harvard Business School.


"""
    let b11: String = """
Diego is the Head of M&A at Kaluz since 2015 and has worked on multiple M&A opportunities including Orbia in the acquisition of Netafim and Vinyl Compounds; Elementia in the announced divestment of Keystone Cement and the acquisition of Giant Cement; BX+ in the acquisition of Bankaool and an Insurance Company (Seguros Multiva).\r\rBefore joining Kaluz, Diego worked for Santander Mexico’s M&A team and Santander UK’s corporate & investment banking team. Prior to Santander, Diego worked at Actis, a private equity fund investing in emerging markets in London and with Rothschild’s M&A teams in London and Mexico City.\r\rDiego has an MBA from London Business School and a BS in Chemical Engineering from the Universidad Iberoamericana.


"""
    let b12: String = """
Ignacio is responsible for Walmart’s eCommerce business in Mexico and Central America, and a member of Walmart de Mexico’s Executive Committee. The business unit he leads is responsible for Walmart’s online business across all retail banners, including Walmart, Superama and Sam’s Club.\r\rIgnacio has a specialization in Senior Management Program (AD-2) from IPADE Business School (Instituto Panamericano de Alta Dirección de Empresa). With an international trajectory of more than 13 years, he has focused on eCommerce in countries such as Argentina, Colombia and Venezuela; with an extensive experience in the Internet industry, marketing strategies, as well as digital sales business models.\r\rBefore joining Walmart he was responsible for the operations of Mercado Libre in Mexico, the third most important region of this company, with his passion for digital business, constant innovation, and focus on technological strategies standing out. He is also known for implementing new forms of work in which interdisciplinary collaboration and a mentality change are strongly encouraged.\r\rIgnacio is a Co-Founder and Vice President of the Mexican Association of Online Sales (AMVO), a group that organizes the Hotsale in Mexico and is also an Investor and Mentor of Endeavor.


"""
    let b13: String = """
Oscar is a corporate entrepreneur who has implemented disruptive technologies aiming to connect people, improve processes and increase productivity throughout Latin America.\r\rCurrently at LinkedIn, he is in charge of providing consulting services to the recruitment industry, develop strategic plans for talent acquisition while spreading Talent Intelligence throughout 500+ companies in Mexico.\r\rIn his professional experience, he has worked with several Fortune 500 companies, including 3M, PwC, Intel, LinkedIn and Prezi. For the past six years, he has focused on developing strategic relationships with Human Resources in numerous companies with the goal of implementing cloud-based technologies for recruitment, training and payroll processes.\r\rOscar has a degree in Electronics and Communications Engineering from Tecnológico de Monterrey and an MBA from the University of Miami and has received executive training at Harvard and MIT.
"""
    let b14: String = """
Coe is the Creative & Managing Director of IDEO U and an instructor of the online course, Insights for Innovation. Since joining IDEO in 2006, she’s led numerous design innovation projects for organizations including Microsoft, Target, Intel, Wells Fargo, Ford, eBay, Sesame Street, and in government agencies, schools, and healthcare groups. Known for expertise in digital design, play, and data, her work has won international awards, patents for clients, and been featured in the New York Times and Wired.\r\rCoe has a Ph.D. in Education from UC Berkeley and guest lectures at Stanford University’s D.School and serves on the Board at the SF Children’s Creativity Museum. She is also skilled at creating modern art museums in Minecraft.


"""
    let b15: String = """
Divya Balakrishnan is a senior product director at IDEO. She leads a team of product managers, digital producers and community designers committed to building the future of blended online learning at IDEO U.\r\rBefore IDEO, Divya worked with clients in Singapore, Malaysia, Australia, China, Hong Kong and India on strategy and growth challenges as a consultant with Accenture, conducted economics research as a Fulbright scholar, and helped launch a microfinance program for women entrepreneurs in Cairo, Egypt.\r\rDivya has a Masters from the London School of Economics.
"""
    let b16: String = """
Adam Beshara is a leading advisor in the General Industries and Business Services sectors. Mr. Beshara has led the origination and execution of a number of significant strategic advisory roles, as well as complex equity and debt capital markets transactions. Notable transactions include advising Chicago Bridge & Iron on their $6bn merger with McDermott International, Johnson Controls on its sale of Power Solutions and Scott Safety, Waste Management on its divestiture of Wheelabrator Technologies, and pending acquisition of Advanced Disposal, Tyco Connectivity on the acquisition of Measurement Specialties and Deutsch as well as the divestiture of it's Business Network Solutions business to CommScope, ITT’s $11bn separation into three stand-alone companies, RR Donnelly on its spin-off of Financial and Book Printing businesses, advising Iron Mountain on its REIT conversion, advising Stanley Black & Decker on its acquisition of Niscayah, CRC-Evans & Sonitrol, advising GE on its $1.8bn sale of GE Security and $500mm sale of GE Homeland Security, advising The Genlyte Group on its $2.7bn sale to Royal Philips Electronics and advising Phillips Petroleum Company on its $24.6bn merger with Conoco Inc.\r\rPrior to Centerview, Mr. Beshara was a Managing Director at JP Morgan in their Diversified Industrials group. Prior to his time in that group, he spent six years in the Mergers and Acquisitions group, as well as six years in the Leverage Finance and Financial Sponsors coverage groups.\r\rMr. Beshara received his Bachelor of Arts in Political Science from Columbia University in the City of New York and a Master of Business Administration in Finance from the Columbia Business School. Additionally, he is a board member of Omega, a non-profit in New York City, as well as the Columbia University Alumni Board of Directors.



"""
        let b17: String = """
    He is a Mechanical Engineer graduated from Anahuac University and he has finances studies from Instituto Tecnológico Autónomo de México ITAM, and Marketing from Iberoamericana University.\r\rIn September 2014, was appointed CEO of Financial Group BX+, entrusting the responsibility to lead the group to a sustainable growth.\r\rBefore his incorporation at BX+, Tomas worked since 2008 for Citi-Banamex responsible for Commercial & Corporate Banking Government and subsequently also responsible for the Mortgage Business.\r\rFrom 1992 to 2008 he held several positions at BBVA Bancomer as Director of Operations, Director of Commercial Banking, Branch Network Director, General Director of Corporate Banking, Mortgage and Government and General Director of Corporate Banking America, among others.\r\rHe participated in acquiring of Hipotecaria Nacional entity he presided and led the integration to Bancomer. He founded Mexicana de Procesamiento(CMP) which is a "Joint Venture" (50% of Bancomer and Banamex 50%). Also founder of E-Global another "Joint Venture" with Banamex, Bancomer and Bital.



    """
    let b18: String = """
    Daniel Martínez-Valle is CEO of Orbia. He assumed this role in 2018, after serving as CEO of Orbia’s holding company, Kaluz. Prior to Kaluz, Daniel was Cisco’s Director of Worldwide Strategy & Planning.\r\rHe previously was managing partner at Nebli Capital Advisors, founder and CEO of Aquanima, and a founding partner of BBF Ventures. He also was a consultant at McKinsey & Co. and served as Ministry of Finance Chief of Staff in Mexico.



    """
        let b19: String = """
    Alberto Paracchini has served as President, Chief Executive Officer and director of Byline Bancorp and Byline Bank since June 2013. Prior to joining Byline, Alberto served as Principal for BXM Holdings, Inc., an investment fund specializing in community bank investments. From 2006 through 2008, Alberto served as President and Chief Financial Officer of Popular Financial Holdings and Chief Financial Officer of E-Loan, an internet banking and mortgage company.\r\rPrior to 2006, Alberto spent 13 years at Banco Popular North America, where he held several senior leadership roles including Chief Financial Officer, Treasurer and the head of all operations and technology functions. Alberto is a member of the Cook County Council of Economic Advisors and Economic Club of Chicago. Alberto holds a bachelor’s degree from Marquette University and an M.B.A. from the University of Chicago Booth School of Business.



    """
        
    let b20: String = """
        Fernando Ruiz Jacques is Elementia’s CEO since March of 2015. Elementia is a major manufacturer of semi-finished copper, alloy, fiber cement, cement, and plastic products offering innovative constructive solutions that redefine the concept of constructive evolution.\r\rElementia has grown organically, and through strategic mergers and acquisitions, creating an integrated platform of more than 4,000 products, 36 plants in eight countries, about 6,450 employees and 5,800 distributors.\r\rPrior to his appointment as CEO, Fernando served as General Director of Building Systems Business Unit, recognized by brands such as Mexalit, Eureka, Plycem, Allura, Maxitile, Comecop and Frigocel, among others.\r\rDuring his management, Elementia launched its IPO, raising more than $250 million. These resources were used to expand Elementia’s cement capacity. Fernando oversaw the project, design and construction of the first Cementos Fortaleza plant, the new cement plant with which Elementia entered the cement sector in Mexico in 2012.\r\rThroughout his professional life, Fernando has held various management positions in widely recognized companies such as Umbral Capital and Wal-Mart de México.\r\rFernando has over 20 years of experience in the construction industry. He is a civil engineer by the Universidad Iberoamericana. In addition, he holds an MBA by UC Berkeley and a Master Degree in Finance by the Universidad Anáhuac in Mexico City.\r\rFernando is married to Elena Tamés and has three daughters. He enjoys boxing, yoga and spending time with his family.

        """
            
    let b21: String = """
        Grew up in Emerson, NJ.All-American in Track and FieldAll-State in FootballAttended Stanford University on an athletic scholarship.Undergrad in Economics.Masters in Sociology.Began his racing Career in 1991.Currently the Director of Human Performance for Hendrick MotorsportsHas worked with Pit Crews at Hendrick Motorsports since 1992.NASCAR’s first pit coach.  Methods used by Andy transformed the series and are utilized by teams today.Part of Jeff Gordon’s “Rainbow Warriors” through the 90’s.The team had many record setting performances including four championships.A part of Hendrick Motorsport’s thirteen Sprint Cup, Nationwide and Truck championships.Personnel Director for Hendrick Motorsports from 2000 – 2005.Involved in HR, contracts, bonus programs, safety and compliance, driver development.Executive Director of the North Carolina Motorsports Association 2006-2012.Currently sits on the Board of Directors.Now speaks on behalf of the industry in areas such as public policy, workforce development and Industry trends.


        """
            
    
    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        Firestore.firestore().settings = FirestoreSettings()
        // [END setup]
        db = Firestore.firestore()
        
        
        tabla.delegate = self
        tabla.dataSource = self
        tabla.backgroundColor = UIColor.white
        self.sectionData = [0:self.array,1:self.arraySpeaker2]
        loadData()
    }
    func loadData(){
        
        CustomLoader.instance.showLoaderView()
        db.collection(coleccion).order(by: "orden").getDocuments{(querySnapshot, err) in
             if let err = err{
                 print("Error obteniendo documentos \(err)")
                 
             }else{
                self.array=[]
                self.arraySpeaker2=[]
                 for document in querySnapshot!.documents{
                     let seleccionado = Speaker()
                    seleccionado.id = document.documentID
                     
                     if let titulo = document.data()["titulo"]as? String{
                         seleccionado.titulo = titulo
                     }
                     if let nombre = document.data()["nombre"]as? String{
                         seleccionado.nombre = nombre
                     }
                     if let imagen = document.data()["imagen"]as? String{
                         seleccionado.imagenSpeaker = imagen
                        let urlIMGSP = URL(string: imagen)
                                let dataIMGSP = try? Data(contentsOf: urlIMGSP!)
                                seleccionado.imagen = UIImage(data: dataIMGSP!)
                     }
                    if let plecaSpeaker = document.data()["plecaSpeaker"]as? String{
                         seleccionado.plecaSpeaker = plecaSpeaker
                     }
                    if let biografia = document.data()["biografia"]as? String{
                        seleccionado.biografia = biografia
                    }
                    var estatusMostrar = 0;
                    if let estatus = document.data()["estatus"]as? Int{
                        estatusMostrar = estatus
                    }
                    
                    
                    
                    switch document.data()["orden"]as? Int {
                    case 1:
                        seleccionado.biografia = self.b1
                        break
                        case 2:
                        seleccionado.biografia = self.b2
                        break
                        case 3:
                        seleccionado.biografia = self.b3
                        break
                        case 4:
                        seleccionado.biografia = self.b4
                        break
                        case 5:
                        seleccionado.biografia = self.b5
                        break
                        case 6:
                        seleccionado.biografia = self.b6
                        break
                        case 7:
                        seleccionado.biografia = self.b7
                        break
                        case 8:
                        seleccionado.biografia = self.b8
                        break
                        case 9:
                        seleccionado.biografia = self.b9
                        break
                        case 10:
                        seleccionado.biografia = self.b10
                        break
                        case 11:
                        seleccionado.biografia = self.b11
                        break
                        case 12:
                        seleccionado.biografia = self.b12
                        break
                        case 13:
                        seleccionado.biografia = self.b13
                        break
                        case 14:
                        seleccionado.biografia = self.b14
                        break
                        case 15:
                        seleccionado.biografia = self.b15
                        break
                        case 16:
                        seleccionado.biografia = self.b16
                        break
                        case 17:
                        seleccionado.biografia = self.b17
                        break
                        case 18:
                        seleccionado.biografia = self.b18
                        break
                        case 19:
                        seleccionado.biografia = self.b19
                        break
                        case 20:
                        seleccionado.biografia = self.b20
                        break
                        case 21:
                        seleccionado.biografia = self.b21
                        break
                    default:
                        seleccionado.biografia = ""
                        break
                    }
                    
                    if(document.data()["tipo"]as? Int == 1 && estatusMostrar == 0 ){
                        //keynote
                        self.array.append(seleccionado)
                    }else if(document.data()["tipo"]as? Int == 2 && estatusMostrar == 0 ){
                        self.arraySpeaker2.append(seleccionado)
                    }else if(document.data()["tipo"]as? Int == 3 && estatusMostrar == 0 ){
                        self.arraySpeaker3.append(seleccionado)
                    }
                    
                 }
                
                 
             }
            self.sectionData = [0:self.array,1:self.arraySpeaker2,2:self.arraySpeaker3]
            CustomLoader.instance.hideLoaderView()
             self.tabla.reloadData()
         }
        self.sectionData = [0:self.array,1:self.arraySpeaker2,2:self.arraySpeaker3]
        
         self.tabla.reloadData()
     }

    

}
extension SpeakersViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return (sectionData[section]?.count)!
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return secciones.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tabla.dequeueReusableCell(withIdentifier: "cell") as! DescargaTableViewCell
//        cell.agregarCelda(item:array[indexPath.row])
         cell.agregarCelda(item:sectionData[indexPath.section]![indexPath.row])
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = bgColorView
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.speakerSeleccionado = sectionData[indexPath.section]![indexPath.row]
        performSegue(withIdentifier: "speakerSeleccionadoSG", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let receiver = segue.destination as! SpeakerSeleccionadoViewController
        receiver.speaker = self.speakerSeleccionado
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        
        let label = UILabel()
        label.textColor = UIColor(red: CGFloat(0)/255.0, green: CGFloat(190)/255.0, blue: CGFloat(214)/255.0, alpha: 1.0)
        label.font = label.font.withSize(26)
        label.text = secciones[section]
        label.frame = CGRect(x: 45, y: 0, width: 300, height: 35)
        view.frame.size.height = 100
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        view.addSubview(label)
        
        return view
    }
    
}
