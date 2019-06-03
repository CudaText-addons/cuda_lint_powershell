import os
from cuda_lint import Linter, util

fn_checker = os.path.join(os.path.dirname(__file__), 'checker.ps1')
fn_config = os.path.join(os.path.dirname(__file__), 'PSScriptAnalyzerSettings.psd1')

if os.name == 'nt':
    CMD = 'powershell.exe'
else:
    CMD = 'pwsh'


class PSLint(Linter):

    syntax = 'PowerShell'
    cmd = (CMD, fn_checker, '-file', '@', '-cfg', fn_config)

    regex = (
        r'Line:(?P<line>\d+)\sRuleName:(?P<code>\w+)\sSeverity:((?P<error>\S*?Error)|'
        r'(?P<warning>Warning|Information))\s(Column:(?P<col>\d+)|Extent:(?P<near>.*?))\sMessage:(?P<message>.*)'
    )

    tempfile_suffix = 'ps1'
    multiline = False
    word_re = r'^([-\S]+|\s+$)'
    
    defaults = {
        "selector": "source.powershell"
    }
    def split_match(self, match):
        """Return the match with ` quotes transformed to '."""
        match, line, col, error, warning, message, near = super().split_match(match)

        if message == 'no PowerShell code found at all':
            match = None
        else:
            message = message.replace('`', '\'')

            # If the message contains a complaint about a function
            # and near looks like a function reference, remove the trailing
            # () so it can be found.
            if 'function \'' in message and near and near.endswith('()'):
                near = near[:-2]

        return match, line, col, error, warning, message, near
