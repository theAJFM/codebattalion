require 'dropbox_sdk'
require 'open3'
module ProblemsHelper
    def dropbox_connect(input_file, output_file, id)
        access_token = 'secret'.strip #Get your own token!! The previous one is no longer valid (intentionally)
        
        client = DropboxClient.new(access_token)
        puts "linked account:", client.account_info().inspect
        File.open("testin.txt", "w+") do |f|
          f.puts(input_file)
        end
        File.open("testout.txt", "w+") do |f|
          f.puts(output_file)
        end
        filein = open("testin.txt")
        fileout = open("testout.txt")
        filenamein = 'problem' << id.to_s << '/in.txt'
        filenameout = 'problem' << id.to_s << '/out.txt'
        response = client.put_file(filenamein, filein)
        puts "uploaded:", response.inspect
        response = client.put_file(filenameout, fileout)
        puts "uploaded:", response.inspect
        return filenamein, filenameout
    end
    
    def check_solution(input_file, language, output_name, problem_id)
        inputs = []
        access_token = 'secret'.strip
        
        client = DropboxClient.new(access_token)
        puts "linked account:", client.account_info().inspect
        
        fileformats = {python:"py", ruby: "rb", java: "java"}
        filename = "Main.#{fileformats[language.parameterize.underscore.to_sym]}"
        
        
        File.open(filename, "w+") do |f|
          f.puts(input_file)
        end
        
        File.open("test.txt", "w+") do |f|
          f.puts(input_file)
        end
        
        submitcode = open("test.txt")
        response = client.put_file(output_name, submitcode)
        puts "uploaded:", response.inspect
        
        filecommand = "#{language} #{filename}"
        
        contents = client.get_file("problem#{problem_id}/in.txt")
        inputs = contents.split("\n")
        inputs.each{|i| i.chomp!}
    
        verdict = run_with_timeout(filecommand, 15, 1, inputs)
        verdict
        
    end
    
    def match_solution(submission_result, problem_id)
        actual_result = []
        access_token = 'secret'.strip
        
        client = DropboxClient.new(access_token)
        puts "linked account:", client.account_info().inspect
        
        contents = client.get_file("problem#{problem_id}/out.txt")
        actual_result = contents.split("\n")
        actual_result.each{|i| i.chomp!}
        
        print actual_result
        
        submission_result == actual_result
    end
    
    private #Thanks whoever made this. Changed the output taken as sterr needs to be captured as well.
    def run_with_timeout(command, timeout, tick, inputs)
      output = ''
      output_error = []
      begin
        # Start task in another thread, which spawns a process
        stdin, stdout, stderr, thread = Open3.popen3(command)
        # Get the pid of the spawned process
        pid = thread[:pid]
        start = Time.now
        inputs.each{|i| stdin.puts(i)}
     
        while (Time.now - start) < timeout and thread.alive?
          # Wait up to `tick` seconds for output/error data
          Kernel.select([stdout], nil, nil, tick)
          # Try to read the data
          begin
            output << stdout.read_nonblock(4096)
          rescue IO::WaitReadable
            # A read would block, so loop around for another select
          rescue EOFError
            # Command has completed, not really an error...
            break
          end
        end
        # Give Ruby time to clean up the other thread
        sleep 1
        
        
        if thread.alive?
          # We need to kill the process, because killing the thread leaves
          # the process alive but detached, annoyingly enough.
          Process.kill("TERM", pid)
          print "gets here"
          return nil
        end
        stderr.each{|x| output_error << x}
      ensure
        stderr.close if stderr
        stdin.close if stdin
        stdout.close if stdout
      end
      return [output, output_error]
    end
end
