def modify_content(content):
    # Example modification: convert all text to uppercase
    return content.upper()

def main():
    filename = input("Enter the filename to read: ")
    new_filename = "modified_" + filename

    try:
        # Try to open and read the original file
        with open(filename, 'r') as file:
            content = file.read()
        
        # Modify the content
        modified_content = modify_content(content)
        
        # Write the modified content to a new file
        with open(new_filename, 'w') as new_file:
            new_file.write(modified_content)
        
        print(f"Modified content has been written to '{new_filename}'")

    except FileNotFoundError:
        print(f"Error: The file '{filename}' does not exist.")
    except IOError:
        print(f"Error: Could not read the file '{filename}'.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    main()
