from ranger.api.commands import *


class subl(Command):
    def execute(self):
        self.fm.run('subl .')


class album(Command):
    def execute(self):
        self.fm.run('sxiv -t *')
