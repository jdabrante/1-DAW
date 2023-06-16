from __future__ import annotations

"""Manipulación de IPs en hosts sobre redes de ordenadores"""


class Host:
    IPV4_BITS = 32
    # ↓ Contiene: [0, 8, 16, 24, 32]
    IPV4_SLICES = list(range(0, IPV4_BITS + 1, 8))

    def __init__(self, *args: str | int, mask: int):
        """
        Constructor de un Host
        ======================
        - Si el primer argumento de args es un string, se supondrá que es una IP en formato
          de cadena de texto. Ejemplo: '192.168.1.5'
        - Si args es una tupla indica que vienen una serie de octetos de la dirección. Se
          rellenarán los octetos faltantes (si es que faltan) con ceros. Ejemplo: (192, 168, 1, 5)
        - Si la máscara está fuera de rango habrá que elevar una excepción de dirección IP
          indicando en el mensaje: "Mask is out of range". Ejemplo: mask=33
        - Si nos pasan un número de octetos distinto de 4, habrá que elevar una excepción de
          dirección IP con el mensaje: "Only 4 octets are allowed"
        - Hay que crear los atributos "ip_octets" (tupla) y mask (entero).
          Ejemplo:
            - ip_octets = (192, 168, 1, 5)
            - mask = 24
        """
        if isinstance(args[0], str):
            self.ip_octets = tuple([int(arg) for arg in args[0].split(".")])
        else:
            self.ip_octets = list(args)
            qtity_to_filled = 4 - len(self.ip_octets)
            self.ip_octets = tuple(self.ip_octets + [0] * qtity_to_filled)

        if mask > Host.IPV4_BITS or mask < 0:
            raise IPAddressError(message="Mask is out of range")
        if len(self.ip_octets) > 4:
            raise IPAddressError(message="Only 4 octets are allowed")

        self.mask = mask

    @property
    def ip(self) -> str:
        '''Devuelve la IP del host en formato string.
        Ejemplo: "192.168.1.5"'''
        return ".".join([str(octet) for octet in self.ip_octets])

    @property
    def bip(self) -> str:
        '''Devuelve la IP en formato binario. Ojo que cada octeto debe tener 8 bits.
        Ejemplo: "11000000101010000000000100000101"'''
        return "".join([f"{octet:08b}" for octet in self.ip_octets])

    @property
    def addr_bmask(self) -> str:
        '''Devuelve la parte de la dirección que representa la máscara (en binario).
        Ejemplo: "110000001010100000000001"'''
        return self.bip[: self.mask]

    @property
    def addr_bhost(self) -> str:
        '''Devuelve la parte de la dirección que representa el host (en binario).
        Ejemplo: "00000101"'''
        return self.bip[self.mask :]

    @property
    def has_network_addr(self) -> bool:
        '''Indica si la dirección IP corresponde con la dirección de red.
        En una dirección de red, la parte de host de la IP tiene todos los bits a 1.
        Ejemplo: "192.168.1.0"'''
        network_binary = self.addr_bmask + self.addr_bhost.replace("1", "0")
        return self.bip == network_binary

    @property
    def has_broadcast_addr(self) -> bool:
        '''Indica si la dirección IP corresponde con la dirección de broadcast.
        En una dirección de broadcast, la parte de host de la IP tiene todos los bits a 0.
        Ejemplo: "192.168.1.255"'''
        broad_binary = self.addr_bmask + self.addr_bhost.replace("0", "1")
        return self.bip == broad_binary

    @property
    def nclass(self):
        """Devuelve la clase de la red: A, B o C.
        → Ver https://bit.ly/42Pgm2k"""
        number_of_bytes = len(self.addr_bmask) // 8
        if number_of_bytes == 1:
            return "A"
        if number_of_bytes == 2:
            return "B"
        if number_of_bytes == 3:
            return "C"

    @property
    def addr_host_size(self) -> int:
        """Devuelve el número de bits que ocupa la parte de host en la dirección"""
        return len(self.addr_bhost)

    @property
    def num_hosts(self) -> int:
        """Devuelve el número de hosts que pueden haber en la red.
        Para calcular la cantidad de hosts por red, se usa la fórmula 2^n - 2
        donde n corresponde a la cantidad de bits para hosts."""
        return 2**self.addr_host_size - 2

    def ping(self, host: Host) -> bool:
        """Indica si un host puede hacer ping a otro host.
        Para que dos hosts puedan hacer ping deben estar en la misma red."""
        return self.addr_bmask == host.addr_bmask

    def __repr__(self):
        '''Devuelve la representación del host en formato.
        Ejemplo: "192.168.1.5/24"'''
        return f"{self.ip}/{self.mask}"

    def __eq__(self, other: Host | object):
        """Indica si dos hosts tienen la misma dirección IP (incluyendo máscara)"""
        if isinstance(other, Host):
            return self.bip == other.bip and self.mask == other.mask
        return False

    def __iter__(self):
        """Devuelve el iterador para el Host"""
        return NetworkIter(self)

    @classmethod
    def from_bip(cls, bip: str, mask: int) -> Host:
        """Crea un host a partir de una dirección IP binaria y una máscara.
        - Por ejemplo: bip='10010100101000111101010101110101' y mask=8 debería crear el host:
          148.163.213.117/8
        - Si se pasan más de 32 bits hay que lanzar una excepción de dirección incorrecta
          indicando en el mensaje: "Binary address is too long"
        """
        if len(bip) > Host.IPV4_BITS:
            raise IPAddressError(message="Binary address is too long")
        ip = []
        for i in range(0, len(bip), 8):
            ip.append(int(bip[i : i + 8], 2))
        ip = tuple(ip)
        return Host(*ip, mask=mask)


class IPAddressError(Exception):
    """Clase que representa un error en la dirección IP.
    - Mensaje por defecto: IP address is invalid
    - Si pasamos un mensaje: IP address is invalid: <message>"""

    def __init__(self, message=""):
        default_message = "IP address is invalid"
        self.message = f"{default_message}: {message}" if message else default_message
        super().__init__(self.message)


class NetworkIter:
    def __init__(self, host: Host):
        self.host = host
        # En self.host_bip_segments tendremos todas las combinaciones binarias para la parte
        # de host de la dirección. Por ejemplo, para una IP con máscara 24, tenemos 8 bits
        # para el host, por tanto en self.host_bip_segments tendremos:
        # [[0, 0, 0, 0, 0, 0, 0, 0],
        #  [0, 0, 0, 0, 0, 0, 0, 1],
        #  [0, 0, 0, 0, 0, 0, 1, 0],
        #  [0, 0, 0, 0, 0, 0, 1, 1],
        #  [0, 0, 0, 0, 0, 1, 0, 0],
        #  ...
        #  [1, 1, 1, 1, 1, 1, 1, 0],
        #  [1, 1, 1, 1, 1, 1, 1, 1]]
        # ¡Ojo que es un generador!
        self.host_bip_segments = NetworkIter.comb((0, 1), self.host.addr_host_size)

    def __next__(self):
        """Genera el siguiente host dentro de la subred en la que se encuentra el host original.
        - Hay que dejar fuera el host que representa la red.
        - Hay que dejar fuera el host que representa el broadcast.
        """
        for byte in self.host_bip_segments:
            byte_length = len(byte)
            if byte.count(1) == byte_length:
                raise StopIteration
            if byte.count(0) != byte_length:
                new_ip = self.host.addr_bmask + "".join(str(bit) for bit in byte)
                return Host.from_bip(new_ip, self.host.mask)

    @staticmethod
    def comb(values, n):
        '''Genera todas las combinaciones de "values" de tamaño "n"'''

        def comb_helper(items, k=0):
            if k == n:
                yield items.copy()
            else:
                for v in values:
                    items[k] = v
                    yield from comb_helper(items, k + 1)

        return comb_helper([None] * n)


