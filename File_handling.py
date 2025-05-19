def modify_content(content):
    # Example modification: reverse the content
    return content[::-1]

def main():
    filename = input("Enter the filename to read: ")
    new_filename = "modified_" + filename

    try:
        with open(filename, 'r') as file:
            content = file.read()
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found.")
        return
    except IOError:
        print(f"Error: Could not read file '{filename}'.")
        return

    modified_content = modify_content(content)

    try:
        with open(new_filename, 'w') as new_file:
            new_file.write(modified_content)
        print(f"Modified content written to '{new_filename}'.")
    except IOError:
        print(f"Error: Could not write to file '{new_filename}'.")

if __name__ == "__main__":
    main()
