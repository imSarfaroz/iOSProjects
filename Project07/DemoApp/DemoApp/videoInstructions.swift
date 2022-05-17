import SwiftUI

struct Video: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let viewCount: Int
    let uploadDate: String
    let url: URL
}

struct VideoList {
    
    static let topTen = [
        Video(imageName: "AUCA_logo",
              title: "Book a room at AUCA!",
              description: "You have something personal to do? Or you want just to chill out with your friends rather than actually studying? Book a private room below!",
              viewCount: 370222,
              uploadDate: "February 17, 2019",
              url: URL(string: "https://rooms.auca.kg/")!),
        
        Video(imageName: "checked_logo",
              title: "Book a WARC session!",
              description: "Are you feeling dumb? Or are you actually dumb? Book a tutoring session with a Megaminds of AUCA! They will definetely help you! (or at least will make you believe that they helped you)",
              viewCount: 239150,
              uploadDate: "May 6, 2017",
              url: URL(string: "https://warc.auca.kg/login")!),
        
        Video(imageName: "AUCA_logo",
              title: "Online registration",
              description: "From the following page, you can manually register for courses directly from you smartphone! (if you are in a bus, and registration accidently started in the middle of the day!)",
              viewCount: 162897,
              uploadDate: "May 19, 2017",
              url: URL(string: "https://onlineregistration.auca.kg/en/addcourses/")!),
              
        Video(imageName: "calendar_logo",
              title: "Academic Calendar 2021-2022",
              description: " Academic calendar is a schedule of all of the events that occur in an academic year. These events may include examination dates, spring break or reading week and the last day of the semester.",
              viewCount: 119115,
              uploadDate: "May 21, 2017",
              url: URL(string: "https://auca.kg/uploads/Registrar/acad_calendar/Updated%20AC%202021-2022%20(Oct_27_2021).pdf")!),
        
        Video(imageName: "lib_logo",
              title: "AUCA Library!",
              description: " Take a look at AUCA library page and easily book your favourite book! ",
              viewCount: 112213,
              uploadDate: "July 7, 2017",
              url: URL(string: "https://library.auca.kg/")!),
        
        Video(imageName: "AUCA_logo",
              title: "Shared Service Center (SSC)",
              description: "Submit requests, pay tuition, take academic leave, or just leave the university with few clicks!",
              viewCount: 106021,
              uploadDate: "October 4, 2019",
              url: URL(string: "https://ssc.auca.kg/")!),
        
        Video(imageName: "bus_logo",
              title: "Bus schedules",
              description: "Want to have a ride for free? (though paying 7k tuition), just take a look at bus schedule leaving AUCA campus during working days!",
              viewCount: 92292,
              uploadDate: "January 28, 2020",
              url: URL(string: "https://www.auca.kg/en/bus/")!),
        
        Video(imageName: "AUCA_logo",
              title: "Dining Services",
              description: "Spend some more dollars to get your favourite food or drinks ar AUCA campus! You can find out what is on the menu for today and what are the schedules of food services across the campus!",
              viewCount: 87569,
              uploadDate: "January 24, 2019",
              url: URL(string: "https://www.auca.kg/en/uldh/")!),
        
        Video(imageName: "AUCA_logo",
              title: "Psychological Counseling Service",
              description: "Feeling damn tired? Or tired because you have nothing to do? Click the link below and book Counseling Service for free! (though paying 7k tuition)",
              viewCount: 76224,
              uploadDate: "June 24, 2020",
              url: URL(string: "https://www.auca.kg/en/about_offices_counseling/")!),
        
        Video(imageName: "AUCA_logo",
              title: "International Students Support",
              description: "Having issues with VISA, registration, or it just happened you got into jail? Talk you International Office by the link below!",
              viewCount: 54024,
              uploadDate: "Dec 2, 2020",
              url: URL(string: "https://www.auca.kg/en/univ_life_international_students/")!)
    ]
}
