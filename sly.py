import gdb
import regex
import pathlib

class SlyDecorator(gdb.FrameDecorator.FrameDecorator):
    def __init__(self, fobj):
        super(SlyDecorator, self).__init__(fobj)
    def function(self):
        frame = self.inferior_frame()
        func = frame.name()
        func = regex.sub(r"<(?>[^()]|(?R))*>", "", func)
        func = regex.sub(r"\((?>[^()]|(?R))*\)", "", func)
        selected =  frame == gdb.selected_frame()
        if(selected): 
            return "\033[91m {}\033[00m".format(func)
        else:
            return func
    def address(self):
        return None
    def filename(self):
        fname = super().filename()
        frame = self.inferior_frame()
        #selected =  frame == gdb.selected_frame()
        #if(selected): 
        #    fname = pathlib.PurePosixPath(fname).name
        #    return "\033[91m {}\033[00m".format(fname)
        #else:
        #    return pathlib.PurePosixPath(fname).name
        return pathlib.PurePosixPath(fname).name
    #def line(self):
    #    return "sadiq"
    def frame_args(self):
        return None

class SlyFilter:
    def __init__(self):
        # set required attributes
        self.name = 'Sly'
        self.enabled = True
        self.priority = 0

        # register with current program space
        gdb.current_progspace().frame_filters[self.name] = self

    def filter(self, f_iter):
        return map(SlyDecorator, f_iter)

SlyFilter()
