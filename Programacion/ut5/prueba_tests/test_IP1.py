import pytest
import IP1

ip1 = IP1.IP('250.80.5.125','/27')
ip2 = IP1.IP('126.20.30.5','/26')

def test_build_IP():
    assert ip1.ip == '250.80.5.125'
    assert ip1.cidr == '27'
    
def test_build_IPError():
    with pytest.raises(IP1.RangeError):
        IP1.IP('300.80.5.125','/50')
    with pytest.raises(IP1.RangeError):
        IP1.IP('400.0.-43.2','100')    
    
def test_binary_ip():
    assert ip1.binary_ip == '11111010.01010000.00000101.01111101'
    
def test_mask():
    assert ip1.mask == '11111111.11111111.11111111.11100000'
    
def test_compare_with_others():
     assert ip1.compare_with_other('250.80.5.126', '250.80.5.127', '250.80.5.128', '100.2.3.4') == ['250.80.5.126', '250.80.5.127']

def test_compare_ips():
    assert (ip1 > ip2) == False
    assert (ip2 > ip1) == True