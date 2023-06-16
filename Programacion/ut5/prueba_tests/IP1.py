class IP:
    def __init__(self, ip: str, cidr: str):
        for oct in ip.split("."):
            if int(oct) < 0 or int(oct) > 255:
                raise RangeError('Valor fuera de rango')
            
        self.ip = ip
        self.cidr = cidr.strip('/')

    @property
    def binary_ip(self):
        return ".".join([f'{int(octeto):08b}' for octeto in self.ip.split(".")]) 
    
    @property
    def mask(self):
        cidr = int(self.cidr)
        mask = []
        for octeto in self.binary_ip.split("."):
            if cidr >= len(octeto) :
                mask.append('1'*8)
                cidr -= 8
            else: 
                mask.append(f'{"1"*cidr}{"0"*(8-cidr)}')
        return ".".join(mask)
    
    @property
    def broadcasting(self):
        host_part = self.binary_ip[self.mask.find('0'):]
        return self.binary_ip[:self.mask.find("0")] + host_part.replace('0','1')
    
    @property
    def red(self):
        host_part = self.binary_ip[self.mask.find('0'):]
        return self.binary_ip[:self.mask.find("0")] + host_part.replace('1','0')
    
    @property
    def max_hosts(self):
        return 2**(32 - int(self.cidr) ) - 2
    
    @staticmethod
    def binary2dec(binary):
        return ".".join([str(int(octeto,2)) for octeto in binary.split(".")])
    
    def compare_with_other(self,*ips):
        host_index = self.mask.find('0')
        reference = self.binary_ip[:host_index]
        valid_ips = []
        for ip in ips:
            if ".".join([f'{int(octeto):08b}' for octeto in ip.split(".")])[:host_index] == reference:
                valid_ips.append(ip)
        return valid_ips
    
    def __eq__(self,other):
        return self.binary_ip == other.binary_ip
    
    def __lt__(self,other):
        return self.cidr > other.cidr
    
    def __gt__(self,other):
        return self.cidr < other.cidr
    
    def __repr__(self):
        return f'Binary: {self.binary_ip}\nRealIP: {self.ip}\nBD {self.broadcasting} {IP.binary2dec(self.broadcasting)}\nIDRED {self.red} {IP.binary2dec(self.red)}\nMaxHosts: {self.max_hosts}'
    
    def __add__(self,other):
        cidr = self.cidr if self.cidr > other.cidr else other.cidr
        ip = ".".join([str(sum([int(oct1),int(oct2)])) for oct1,oct2 in zip(self.ip.split("."),other.ip.split("."))])
        return IP(ip,cidr)

    def __sub__(self,other):
        try: 
            cidr = self.cidr if self < other else other.cidr
            ip = ".".join([str(int(oct1) - int(oct2)) for oct1, oct2 in zip(self.ip.split("."),other.ip.split("."))])
            return IP(ip,cidr)
        except RangeError as err:
            print(err)

    
    def __iter__(self):
        return IPIterator(self)
    

class IPIterator:
    def __init__(self, ip: IP):
        self.ip = ip.ip.split(".")
        self.pointer = 0
    
    def __next__(self):
        if self.pointer > len(self.ip) - 1:
            raise StopIteration
        current_oct = self.ip[self.pointer]
        self.pointer += 1
        return current_oct

class RangeError(Exception):
    def __init__(self,message):
        self.message = message
        super().__init__(self.message)

ip1 = IP('250.80.5.125','/27')
print(ip1.ip)
print(ip1.binary_ip)
print(ip1.mask)
print(ip1.compare_with_other('250.80.5.126', '250.80.5.127', '250.80.5.128', '100.2.3.4'))