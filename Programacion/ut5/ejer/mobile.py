PREINSTALLED_APPS = ["Chrome"]
INITIAL_BATTERY = 0
POWER_ON_CONSUMPTION = 10
APP_MANAGEMENT_CONSUMPTION = 20


class MobilePhone:
    def __init__(
        self,
        manufacturer: str,
        screen_size: float,
        num_cores: int,
        battery_capacity: int,
    ):
        self.manufacturer = manufacturer
        self.screen_size = screen_size
        self.num_cores = num_cores
        self.apps = PREINSTALLED_APPS
        self.status = False
        self.battery_capacity = battery_capacity
        self.current_battery = INITIAL_BATTERY

    def calculate_battery(self, percentage: int | float) -> int | float:
        return self.current_battery - self.battery_capacity * (percentage / 100)

    def switch_status(self):
        calculated_battery = self.calculate_battery(POWER_ON_CONSUMPTION)
        if self.status:
            self.status = False
        elif not self.status and calculated_battery > 0:
            self.status = True
            self.current_battery = calculated_battery

    def install_apps(self, *apps: tuple[str]):
        calculated_battery = self.calculate_battery(APP_MANAGEMENT_CONSUMPTION)
        if self.status:
            for app in apps:
                if app not in self.apps and calculated_battery > 0:
                    self.apps.append(app)
                    self.current_battery = calculated_battery
            if self.current_battery < self.calculate_battery(POWER_ON_CONSUMPTION):
                self.switch_status()

    def uninstall_apps(self, *apps: tuple[str]):
        calculated_battery = self.calculate_battery(APP_MANAGEMENT_CONSUMPTION)
        if self.status:
            for app in apps:
                if app in self.apps and calculated_battery > 0:
                    self.apps.remove(app)
                    self.current_battery = calculated_battery
            if self.current_battery < self.calculate_battery(POWER_ON_CONSUMPTION):
                self.switch_status()

    def recharge_battery(self, *, amps: int | float, minutes: int | float):
        total_recharge_time = self.battery_capacity / (
            self.battery_capacity / (amps * 1000)
        )
        charge = minutes / 60 * total_recharge_time
        self.current_battery = min(
            self.battery_capacity, (self.current_battery + charge)
        )


mobile1 = MobilePhone("Samsung", 6.1, 8, 3700)

mobile1.recharge_battery(amps=2, minutes=110)
mobile1.switch_status()
mobile1.install_apps("Twitter")
mobile1.uninstall_apps("Chrome")

print(mobile1.status)
print(mobile1.current_battery)
print(mobile1.apps)
