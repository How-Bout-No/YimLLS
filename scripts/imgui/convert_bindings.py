import re

# Mostly vibe coded :( sorry
# Converts ImGui enums that are directly copied off of https://oprypin.github.io/crystal-imgui/ImGui to compatible format

def extract_variables(input_file):
    """
    Extracts variables and their corresponding numbers from a file.
    
    Args:
        input_file (str): Path to the input file.
    
    Returns:
        str: A string containing the formatted variables and numbers.
    """
    try:
        # Read the input file
        with open(input_file, 'r') as file:
            data = file.read()
        
        # Use regular expression to extract variables and numbers
        pattern = r"(\w+)\s*=\s*(\d+)"
        matches = re.findall(pattern, data)
        
        # Create a dictionary to store the extracted variables and numbers
        variables = {}
        for match in matches:
            variable, number = match
            variables[variable] = int(number)
        
        # Format the output
        formatted_output = "{\n"
        for variable, value in variables.items():
            formatted_output += f"    {variable} = 0x{value:08x},\n"
        formatted_output += "}\n"
        
        return formatted_output
    
    except FileNotFoundError:
        print("Input file not found.")
    
    except Exception as e:
        print(f"An error occurred: {e}")

def outputtofile(output_file, input):
    with open(output_file, 'w') as file:
        file.write(input)
    print("File written successfully.")

input_file_path = 'input.txt'
formatted_output = extract_variables(input_file_path)
print(formatted_output)