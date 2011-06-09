# Gondola - console.rb
#   Definitions of functions for printing
#   results to the console in a readable format
require 'rainbow'

class Gondola
  module Results
    class Console
      def self.change(result)
        browser_string = result[:browser].values.join(" ")
        print "#{result[:id]}: \"#{result[:name]}\" ".foreground(:magenta)

        case result[:status]
        when :in_progress
          puts "started with #{browser_string}".foreground(:cyan)
        when :not_started
          puts "failed to start on #{browser_string}".foreground(:red)
        when :passed
          puts "has completed with 0 errors on #{browser_string}".foreground(:green)
        when :failed
          puts "has completed with #{result[:errors].size} error(s) on #{browser_string}".foreground(:red)
        else
          puts "Unknown status code".foreground(:blue)
        end
      end

      def self.completion(results)
        puts
        results.each do |result|
          puts "Sauce Labs ID : #{result[:id]}"
          puts "Test Name     : #{result[:name]}".foreground(:magenta)
          puts "Browser       : #{result[:browser].values.join(" ")}"
          if result[:status] == :passed
            puts "Status        : Test #{result[:status].to_s.capitalize}".foreground(:green)

          elsif result[:status] == :failed
            puts "Status        : Test #{result[:status].to_s.capitalize} - #{result[:errors].size} error(s)".foreground(:red)

            result[:errors].each_with_index do |error,i|
              puts "- Error #{i+1}, Command number #{error[:cmd_num]}:".foreground(:red)

              max_key = -1 * (error[:command].keys.map { |k| k.to_s.size }.max + 8)
              error[:command].each_pair do |k,v| 
                puts "    %1$*2$s : #{v}" % [ "#{k.to_s.capitalize} command", max_key ]
              end

              puts "    #{error[:error]}".foreground(:red)
            end
          else
            puts
          end
          puts
        end
      end

      def self.error(error)
        puts error
      end
    end
  end
end
