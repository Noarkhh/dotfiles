import xml.etree.ElementTree as ET

mappings = {
    "Ansi 0 Color": ("black", "base"),
    "Ansi 1 Color": ("red", "base"),
    "Ansi 2 Color": ("green", "base"),
    "Ansi 3 Color": ("yellow", "base"),
    "Ansi 4 Color": ("blue", "base"),
    "Ansi 5 Color": ("magenta", "base"),
    "Ansi 6 Color": ("cyan", "base"),
    "Ansi 7 Color": ("white", "base"),
    "Ansi 8 Color": ("black", "bright"),
    "Ansi 9 Color": ("red", "bright"),
    "Ansi 10 Color": ("green", "bright"),
    "Ansi 11 Color": ("yellow", "bright"),
    "Ansi 12 Color": ("blue", "bright"),
    "Ansi 13 Color": ("magenta", "bright"),
    "Ansi 14 Color": ("cyan", "bright"),
    "Ansi 15 Color": ("white", "bright"),
    "Background Color": "bg1",
    "Foreground Color": "fg1",
}

def str_to_hex(float_value):
    return "{0:02x}".format(int(float(float_value) * 255))

def colors_to_code(colors):
    res = f"#{str_to_hex(colors['Red Component'])}{str_to_hex(colors['Green Component'])}{str_to_hex(colors['Blue Component'])}"
    return f'"{res}"'

def read_file_to_string(file_path):
    with open(file_path, 'r') as file:
        data = file.read()
    return data

def parse_xml_colorscheme(xmlfile):
    tree = ET.parse(xmlfile)
    
    root = tree.getroot()
    
    xml_dict = {}
    curr_color = ""
    curr_component = ""

    for item in root[0]:
        if item.tag == "key" :
            curr_color = item.text
            xml_dict[curr_color] = {}
        elif item.tag == "dict":
            for elem in item:
                if elem.tag == "key":
                    curr_component = elem.text
                else:
                    xml_dict[curr_color][curr_component] = elem.text

    return xml_dict

def translate_colorscheme(parsed_xml_colorscheme):
    res = {}

    for key, colors in parsed_xml_colorscheme.items():
        if key not in mappings:
            continue
        mapping = mappings[key]
        match mapping:
            case (color, brightness):
                if color not in res:
                    res[color] = {}
                res[color][brightness] = colors_to_code(colors)
            case color:
                res[color] = colors_to_code(colors)
    return res

def stringify_colorscheme_to_lua(colorscheme):
    res_str = ""
    for i, (key, colors) in enumerate(colorscheme.items()):
        if i != 0:
            res_str += "\n"
        if isinstance(colors, dict):
            res_str += f"      {key} = {{ base = {colors['base']}, bright = {colors['bright']} }},"
        else:
            res_str += f"      {key} = {colors},"

    return f"""require("nightfox").setup({{
  palettes = {{
    all = {{
      orange = {{ base = "#d09469", bright = "#d09469" }},
{res_str}
      fg4 = {colorscheme["blue"]["base"]},
    }},
  }},
}})
"""

def write_lua_colorscheme(lua_colorscheme_string, target):
    with open("/Users/noarkhh/.config/nvim/lua/config/colorscheme.lua", 'w') as f:
        f.write(lua_colorscheme_string)

if __name__ == "__main__":
    parsed_colorscheme = parse_xml_colorscheme("/Users/noarkhh/dotfiles/iterm2/floral.itermcolors")
    translated_colorscheme = translate_colorscheme(parsed_colorscheme)
    lua_colorscheme_string = stringify_colorscheme_to_lua(translated_colorscheme)
    write_lua_colorscheme(lua_colorscheme_string, "Users/noarkhh/dotfiles/nvim/lua/config/colorscheme.lua")
