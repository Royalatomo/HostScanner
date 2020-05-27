puts ""

puts "------------ NETWORK ACTIVE HOSTS FINDER ---------------"

puts ""
#importing some modules/classes

#for pinging the ipaddresses
require "net/ping"

#for finding the range to ipaddresses
require "ipaddr"

# def Network_Scanner(ipAddress, subnetMask, Filename)
    
#creating a class to find NETWORK SIZE
def network_size()

    puts "--------------- FINDING NEWTWORK SIZE --------------"
    
    puts ""
    
    print "What is Your Ip Address: "

    ipAddress = gets.chomp

    puts "!! Done !!"

    puts ""

    print "What is Your Subnet Mask: "
    
    subnetMask = gets.chomp

    puts "!! Done !!"

    puts ""

    puts "Wait Your Network Size is being scanned ........."
        
    puts ""

    #creating the ipaddress in the form so that IPADDr can read it
    ipaddress = "#{ipAddress}/#{subnetMask}"

    #finding the range of ipaddress and mapping the address which is obtained to String
    ip_range = IPAddr.new(ipaddress).to_range.map { |address| address.to_s }

    puts "!!!! Network Sized Scanned Successfully !!!!"

    puts ""
    
    #returning the ip_range value
    return ip_range

end


#now finding that ip address which are within the network size
def network_Up(ipaddress)

    puts "Scanning the Active Hosts........"

    puts ""

    #creating a array for active Ip addresses
    active_addresses = []
    
    #pinging each ip address which are found using Network_size method
    ipaddress.each do |ip|

        #Checking If ping went Successfull Or not
        if Net::Ping::External.new(ip).ping?
            
            #Is Ping Went successfull then the ip address which are currently pinged are added to active_addresses
            active_addresses.push(ip)
    
        end        
    
    end

    puts "!! Active Host Scanned Completly !!"

    puts ""

    #Returning All The active_address array
    return active_addresses

end


#Saving all the ip addresses containing the active Ip address array to .txt file
def saving_Ip_To_File(active_addresses)
    
    puts "Writing All Active Host To File ....."

    print "  Give File A Name To Save: "

    #Asking for the file name from the user
    nameFile = gets.chomp
    
    #Opening/Creating File using File.open method in writing mode
    File.open("./#{nameFile}.txt", "w") do |file|
        
        #Saprating all ip addresses in the active Ip addresses array 
        active_addresses.each do |ip|
            
            #Putting all address seprately in file.txt
            file.puts ip
        
        end
    
    end

    puts ""
    puts " !! Scanned completed !!"
    puts ""

    #Checking the current working dir to show the user
    location = Dir.pwd
    
    #Giving the full path of the file back to the user
    puts "!!>>>Check: #{location}/#{nameFile}.txt <<<!!"

end


def running()
    saving_Ip_To_File(network_Up(network_size))

end

running()

#Printing The Authors Name

puts """
--------------- MADE BY -------------
      ________BINGO__________

"""
