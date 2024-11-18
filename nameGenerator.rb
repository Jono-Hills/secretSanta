require 'fileutils'

# Define the outputs folder path
output_folder = 'outputs'

# Name => [ignored pairings]
names = {
    'Jono' => ['Roosje'],
    'Roosje' => ['Jono'],
    'Jasmyn' => ['Chalisa'],
    'Chalisa' => ['Jasmyn'],
    'Phet' => [],
    'Hailey' => ['Dylan'],
    'Dylan' => ['Hailey']
}

recipients = Array.new(names.keys)
senders = Array.new(names.keys)

recipients = recipients.shuffle
senders = senders.shuffle

FileUtils.mkdir_p(output_folder)

for sender in senders do
  index = rand(recipients.length)
  recipient = recipients[index]
  while names[sender].include?(recipient) || recipient == sender do
    puts "#{sender} => #{recipient}"
    if recipients.size == 1
      raise RuntimeError.new("Loop detected - please try again")
    end

    index = rand(recipients.length)
    recipient = recipients[index]
  end

  # Write the file to the outputs folder
  file_path = File.join(output_folder, "#{sender}.txt")
  File.open(file_path, 'w') { |file| file.write(recipient) }

  recipients.delete(recipient)
end