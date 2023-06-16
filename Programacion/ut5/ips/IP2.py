MAX_IP = 255
MIN_IP = 0
MAX_CIDR = 32
MIN_CIDR = 0

def read_from_file(path: str) -> tuple:
    with open(path) as f:
       ip, cidr = f.read().strip().split('/')
       if int(cidr) > MAX_CIDR or int(cidr) < MIN_CIDR:
           raise RangeError(message='Rango de CIDR no válido')
       if not ip.replace(".","").isnumeric() or ip.startswith(".") or ip.endswith("."):
           raise RangeError(message='Valores inapropiados')
       if len(ip.split(".")) > 4:
           raise RangeError
       for _byte in ip.split('.'):
            if int(_byte) > MAX_IP or int(_byte) < MIN_IP:
                raise RangeError(message='Rango de IP no válido')
       return ip, cidr

BYTE = 8

class IP:
    def __init__(self, path: str):
        self.ip, self.cidr = read_from_file(path)
    
    @property
    def ip(self) -> str:
        return self._ip
    
    @property
    def cidr(self) -> str:
        return self._cidr
    
    @ip.setter
    def ip(self, ip):
        self._ip = ip
        self._mask = None
    
    @cidr.setter
    def cidr(self, cidr):
        self._cidr = cidr
        self._mask = None
    
    @property
    def bin_mask(self) -> str:
        num_of_bits = int(self.cidr)
        ip_length = len(self.ip.split("."))
        mask = []
        for _ in range((ip_length)):
            if num_of_bits > BYTE:
                mask.append("1"*BYTE)
            elif num_of_bits < BYTE and num_of_bits > 0:
                mask.append(f'{"1"*num_of_bits}{"0"*(BYTE - num_of_bits)}')
            elif num_of_bits <= 0:
                mask.append(f'{0:08d}')
            num_of_bits -= BYTE
        return ".".join(mask)
    
    @property
    def dec_mask(self) -> str:
        return IP.bin2dec(self.bin_mask)
    
    @property
    def broadcasting(self) -> tuple:
        host_index = self.bin_mask.find('0')
        binary = IP.dec2bin(self.ip)[:host_index] + self.bin_mask[host_index:].replace('0','1')
        decimal = IP.bin2dec(binary)
        return decimal, binary
    
    @property
    def red(self) -> tuple:
        host_index = self.bin_mask.find('0')
        binary = IP.dec2bin(self.ip)[:host_index] + self.bin_mask[host_index:].replace('1','0')
        decimal = IP.bin2dec(binary)
        return decimal, binary

    @staticmethod
    def dec2bin(ip: str) -> str:
        _bytes = ip.split(".")
        return ".".join([f'{int(byte):08b}' for byte in _bytes])
    
    @staticmethod
    def bin2dec(ip: str) -> str:
        _bytes = ip.split(".")
        return ".".join([str(int(byte,2)) for byte in _bytes])
    
    def compare_ips(self, *ips) -> list:
        hosts_index = self.bin_mask.find('0')
        reference_hosts = IP.dec2bin(self.ip)[:hosts_index]
        valid_ips = []
        for ip in ips:
            if IP.dec2bin(ip)[:hosts_index] == reference_hosts:
                valid_ips.append(ip)
        return valid_ips
    
    def __eq__(self, other):
        if isinstance(other, IP):
            return self.cidr == other.cidr
        return False
    
    def __gt__(self,other):
        if isinstance(other, IP):
            return self.cidr > other.cidr
        return False
    
    def __lt__(self,other):
        if isinstance(other, IP):
            return self.cidr < other.cidr
        return False
    
    def __len__(self):
        return 2**(32 - int(self.cidr)) - 2
    
    def dump_to_file(self,path):
        with open(path, "w") as f:
            f.write(f'ip: {self.ip}{self.cidr}\nmask: {self.dec_mask} -> {self.bin_mask}\nBD: {"-->".join(self.broadcasting)}\nRED: {"-->".join(self.red)}')
    
    def __iter__(self):
        return IterIP(self)
    
class IterIP:
    def __init__(self, _ip: IP):
        self.ip = _ip.ip.split(".")
        self.pointer = 0

    def __next__(self):
        if self.pointer >= len(self.ip):
            raise StopIteration
        current_byte = self.ip[self.pointer]
        self.pointer += 1
        return current_byte

class RangeError(Exception):
    def __init__(self,*,message=""):
        default_message = "Error"
        if message:
            self.message = message
        else: 
            self.message = default_message
        super().__init__(self.message)
        




ip1 = IP('ip.dat')
print(ip1.bin_mask)
print(ip1.dec_mask)
print(ip1.broadcasting)
print(ip1.red)
print(ip1.compare_ips('100.20.30.100','250.80.5.128'))
print(len(ip1))
ip1.dump_to_file('result.dat')

for _byte in ip1:
    print(_byte)