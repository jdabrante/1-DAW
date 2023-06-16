class File:
    def __init__(self, path: str):
        self.path = path
        self.contents = []

    def add_contents(self, *contents: str):
        for content in contents:
            self.contents.append(content)

    @property
    def size(self):
        total_size = sum(len(content) for content in self.contents)
        return total_size

    def info(self):
        return f"{self.path} [size={self.size}B]"


class MediaFile(File):
    def __init__(self, path: str, codec: str, geoloc: tuple, duration: int):
        super().__init__(path)
        self.codec = codec
        self.geoloc = geoloc
        self.duration = duration

    def info(self):
        return f"{super().info()}\nCodec: {self.codec}\nGeoloc: {self.geoloc}\nDuration: {self.duration}s"


class VideoFile(MediaFile):
    def __init__(self, path, codec, geoloc, duration, dimensions: tuple):
        super().__init__(path, codec, geoloc, duration)
        self.dimensions = dimensions

    def info(self):
        return f"{super().info()}\nDimensions: {self.dimensions}"


file3 = VideoFile(
    "/home/python/vanrossum.mp4", "h264", (23.5454, 31.4343), 487, (1920, 1080)
)

print(file3.info())
