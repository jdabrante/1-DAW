def read_from_file(path: str):
    with open(path) as f:
        ip, cidr = f.read().strip().split("/")
    return ip , cidr

class IP:
    def __init__(self, path):
        ip, cidr = read_from_file(path)
        self.ip = IP.bin2dec(ip)
        self.cidr = int(cidr,2)

    @staticmethod
    def bin2dec(ip):
        dec_ip = []
        for i in range(0,len(ip),8):
            dec_ip.append(str(int(ip[i:i+8],2)))
        return ".".join(dec_ip)
    
    @staticmethod
    def convert(ip):
        dec_ip = []
        for i in range(0,len(ip),8):
            _sum = 0
            for i, bit in enumerate(ip[i:i+8][::-1]):
                _sum += int(bit) * 2**i
            dec_ip.append(str(_sum))
        return ".".join(dec_ip)
    
    @staticmethod
    def dec2bin(ip):
        binary_ip = []
        _bytes = ip.split(".")
        for byte in _bytes: 
            current_byte = int(byte)
            bit = []
            while current_byte != 0:
                bit.append(str(current_byte%2))
                current_byte //= 2
            binary_ip.append(f'{"".join(bit):>08}')
        return ".".join(binary_ip)
    
ip1 = IP('ip.dat')
print(ip1.ip, ip1.cidr)
print(IP.dec2bin(ip1.ip))