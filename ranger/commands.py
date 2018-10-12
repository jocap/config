import os
from ranger.api.commands import Command

# https://github.com/ranger/ranger/wiki/Integrating-File-Search-with-fzf

class fzf_select(Command):
    '''
    :fzf_select

    Find a file using fzf.

    With a prefix argument, search hidden files as well.

    See: https://github.com/junegunn/fzf
    '''
    def execute(self):
        import subprocess
        if self.quantifier:
            # match hidden files too
            command='ag --nocolor -g "" --hidden 2>/dev/null | fzf-tmux +m'
        else:
            # match non-hidden files
            command='ag --nocolor -g "" 2>/dev/null | fzf-tmux +m'
        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)
