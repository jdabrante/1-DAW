DISTRO_RUN_LEVELS = {"Ubuntu": 6, "Debian": 7, "Mint": 6}
DEFAULT_RUN_LEVEL = 5


class OS:
    kernel = "Linux"
    fylesystem = {"root": {"etc": {"apt": "más carpetas", "bash.bashrc": "fichero"}}}
    oss = []

    def __init__(self, distro: str, ip: int):
        self.distro = distro
        self.ip = self.calculate_ip(ip)
        OS.oss.append(self)
        self.run_level = DEFAULT_RUN_LEVEL

    def calculate_ip(self, ip: int):
        while ip in [os.ip for os in OS.oss]:
            ip += 1
        return ip

    def change_run_level(self, level: int):
        if level in range(DISTRO_RUN_LEVELS[self.distro] + 1):
            self.run_level = level

    @property
    def graphical_interface(self) -> bool:
        if self.run_level == 5:
            return True
        return False

    @staticmethod
    def get_run_levels():
        return DISTRO_RUN_LEVELS

    @classmethod
    def show_fylesystem(cls):
        print(cls.fylesystem)

    def search_files(self, target_name: str, origin: dict):
        for entity_name, entity_content in origin.items():
            if entity_name == target_name:
                return True, entity_content
            elif isinstance(entity_content, dict):
                return self.search_files(target_name, entity_content)
        else:
            return False, "Entidad no encontrada"

    def mkdir(self, absolute_path_name: str, dir_name: str):
        first_level = self.fylesystem
        for level in absolute_path_name.split("/"):
            if level in first_level:
                first_level = first_level[level]
            else:
                break
        else:
            first_level[dir_name] = {}


os1 = OS("Ubuntu", 1)
os2 = OS("Xubuntu", 1)
os3 = OS("Debian", 1)
os3.change_run_level(5)
print(os1.ip)
print(os2.ip)
print(os3.run_level)
print(os3.graphical_interface)
print(OS.get_run_levels())

OS.show_fylesystem()

print(os3.search_files("pepe", os3.fylesystem))
os3.mkdir("root/etc", "mycarpeta")
print(os3.fylesystem)
print(os3.search_files("mycarpeta", os3.fylesystem))
