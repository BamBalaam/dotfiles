from ranger.api.commands import *


class subl(Command):
    def execute(self):
        action = ['subl', '.']
        self.fm.execute_command(action)
