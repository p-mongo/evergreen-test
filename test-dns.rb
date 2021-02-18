require 'resolv'

start = Time.now
i = 1
loop do
  if Time.now - start > 300
    break
  end
  #Resolv::DNS.open(nameserver: '127.0.0.1', nameserver_port: [['127.0.0.1', 53]]) do |dns|
  Resolv::DNS.open do |dns|
    ress = dns.getresources 'cloud-dev.mongodb.com', Resolv::DNS::Resource::IN::A
    if ress.empty?
      puts 'Uh oh here'
    end
  end
  print('.')
  if i > 0 && i % 1000 == 0
    puts "\n#{i}"
  end
  i += 1
end
puts
