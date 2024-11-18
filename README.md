# Secret Santa Pairing Script

This Ruby script generates Secret Santa pairings and writes each pairing to a text file. Each sender is assigned a recipient while ensuring that specific exclusions are respected (e.g., avoiding pairing someone with a close family member or spouse). The output is saved in individual text files for each sender.

## Requirements

- **Ruby**: Ensure you have Ruby installed on your system.
- **JSON File**: The input names and exclusion data must be provided in a `names.json` file.

## Setup and Usage

1. **Prepare Input File**:
   - Inside the `inputs` folder, create a `names.json` file. The file should be structured as follows:

     ```json
        {
        "Tom": ["George"], 
        "Alice": [],
        "Harry": [],
        "George": ["Tom"],
        "Sarah": [],
        "Bill": ["Sarah", "Harry"]
        }
     ```

     - The keys are the names of participants.
     - The array values contain the names for pairings that should be ignored for each participant, e.g. in the above Tom will not be paired with George and vice versa.

2. **Run the Script**:
   - Execute the script using the following command:
     ```bash
     ruby secret_santa.rb
     ```
   - The script will create a folder named `outputs` and generate a text file for each sender, containing their assigned recipient.

3. **Output**:
   - Each sender will have a text file in the `outputs` folder named `{sender}.txt`, with the recipient's name written inside.

## Notes

- The script ensures that a sender is not paired with themselves or anyone listed in their exclusion array.
- If the script detects a loop where no valid recipients are available, it will raise an error and prompt you to try again.
- If you make any changes to the participants or exclusions, make sure to update `names.json` and rerun the script.

## Troubleshooting

- **Loop Detection Error**: If the script raises a `RuntimeError` indicating a loop, this means it couldn't find a valid recipient pairing. Try running the script again or adjust the exclusion rules to make pairings possible.

## Folder Structure
```
/path/to/project
│
├── secret_santa.rb     # The Ruby script
├── inputs
│   └── names.json      # Your input file with participant data
└── outputs             # Folder where output files will be generated
```

## Customization

You can modify the script or the input JSON to accommodate different rules or participant lists. Feel free to adapt it to meet your needs!
