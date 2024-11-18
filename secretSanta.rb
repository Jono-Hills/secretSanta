require 'fileutils'
require 'json'

# File constants
output_folder = 'outputs'
input_path = 'inputs/names.json'

names = JSON.parse(File.read(input_path))

recipients = Array.new(names.keys)
senders = Array.new(names.keys)

recipients = recipients.shuffle
senders = senders.shuffle

FileUtils.mkdir_p(output_folder)

for sender in senders do
  index = rand(recipients.length)
  recipient = recipients[index]
  loop_watch_dog = 0;
  while (names[sender].include?(recipient) || recipient == sender) && loop_watch_dog < 10 do
    puts "#{sender} => #{recipient} | Selecting new recipient..."
    if recipients.size == 1
      raise RuntimeError.new("Loop detected - please try again")
    end

    index = rand(recipients.length)
    recipient = recipients[index]
    loop_watch_dog += 1
  end
  # Write the file to the outputs folder
  file_path = File.join(output_folder, "#{sender}.txt")
  File.open(file_path, 'w') { |file| file.write(recipient) }

  recipients.delete(recipient)
end

