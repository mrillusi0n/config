from itertools import starmap

def get_numbered(coolors_export):
    hex_values = [prop.rstrip(';').split(': ')[1][:-2] for prop in coolors_export.splitlines()]
    return '\n'.join(starmap('color{} {}'.format, enumerate(hex_values)))

colors = '''\
--space-cadet: #24283bff;
--ultra-red: #f7768eff;
--pistachio: #9ece6aff;
--earth-yellow: #e0af68ff;
--cornflower-blue: #7aa2f7ff;
--bright-lilac: #bb9af7ff;
--light-sky-blue: #7dcfffff;
--lavender-web: #dce1f9ff;
--raisin-black: #1a1b26ff;'''

print(get_numbered(colors))
