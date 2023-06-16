MOBILES_BATTERIES = {"Alcatel": 3500, "Xiaomi": 4500, "Samsung": 5000}
PREINSTALLED_APPS = []
INITIAL_BATTERY = 0


class MobilePhone:
    def __init__(
        self, manufacturer: str, screen_size: float, num_cores: int, battery=3500
    ):
        self.manufacturer = manufacturer
        self.screen_size = screen_size
        self.num_cores = num_cores
        self.apps = PREINSTALLED_APPS
        self.status = False
        self.battery = MOBILES_BATTERIES.get(manufacturer, battery)
        self.current_battery = INITIAL_BATTERY

    def check_battery(self, current_battery, battery, percentage):
        return True if  (current_battery - battery * percentage) > 0 else False

    def switch_status(self):
        if self.status:
            self.status = False
        elif (
            not self.status
            and self.check_battery(self.current_battery, self.battery, 0.2) 
        ):
            self.status = True
            self.current_battery -= self.battery * 0.2

    def install_apps(self, *apps):
        management_done = False
        battery_condition = self.check_battery(self.check_battery,self.battery, 0.02)
        if self.status:
            for app in apps: 
                if app not in self.apps and battery_condition:
                    self.apps.append(app)
                    management_done = True
            if management_done:
                self.current_battery = battery_condition
    
    def uninstall_apps(self, *apps):
        management_done = False
        battery_condition = self.check_battery(self.check_battery,self.battery, 0.02)
        if self.status:
            for app in apps: 
                if app in self.apps and battery_condition:
                    self.apps.remove(app)
                    management_done = True
            if management_done:
                self.current_battery = battery_condition




    def recharge(self, amps, minutes):
        total_recharge_time = self.battery / (self.battery / (amps * 1000))
        charge = minutes / 60 * total_recharge_time
        self.current_battery = min(self.battery, (self.current_battery + charge))


mobile1 = MobilePhone("Samsung", 7.0, 2)

mobile1.recharge(2, 200)
mobile1.switch_status()
mobile1.manage_apps("youtube", "facebook", management="install")


print(mobile1.apps)
print(mobile1.current_battery)






    # def manage_apps(self, *apps, management):
    #     management_done = False
    #     battery_condition = True if self.calculate_battery(self.current_battery,self.battery,0.02) > 0 else False
    #     if self.status:
    #         for app in apps:
    #             if app not in self.apps and management == "install" and battery_condition:
    #                 self.apps.append(app)
    #                 management_done = True
    #             elif app in self.apps and management == "uninstall" and battery_condition:
    #                 self.apps.remove(app)
    #                 management_done = True
    #         if management_done:
    #             self.current_battery -= self.battery * 0.02
    #         if self.current_battery <= self.battery * 0.2:
    #             self.switch_status()