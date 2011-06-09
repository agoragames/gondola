# Gondola - tester.rb:
#   Module which contains all the necessary functions
#   for asserting and verifying various functions without
#   the need for a unit testing framework

class Gondola
  class AssertionError < RuntimeError
  end

  class Tester
    attr_reader :errors, :job_id, :status

    SELENIUM_OBJECT = "@sel"

    def initialize(req, converter)
      @sel = Gondola::Selenium.new req
      @converter = converter
      @cmd_num = 0
      @errors = []
    end

    # Start a new Sauce Labs' job and return the session_id
    def setup
      begin
        @sel.start
        @job_id = @sel.session_id
        @status = :in_progress
      rescue ::Selenium::Client::CommandError => e
        @status = :not_started
        @errors << {
          :cmd_num => 0,
          :command => {:ruby => "#{SELENIUM_OBJECT}.start"},
          :error => e.message
        }
      rescue Timeout::Error => e
        @errors << {
          :cmd_num => 0,
          :command => {:ruby => "#{SELENIUM_OBJECT}.start"},
          :error => "ERROR: Command timed out"
        }
      end
      @job_id
    end

    # Issue all the test commands, catching any errors
    def begin
      begin
        eval @converter.ruby
      rescue AssertionError
      rescue ::Selenium::Client::CommandError => e
        add_error_with_trace e.message, e.backtrace
      rescue Timeout::Error => e
        add_error_with_trace "ERROR: Command timed out", e.backtrace
      ensure
        finish
      end
    end

    private

    # Shutdown the Sauce Labs' job and report the status
    # of the test
    def finish
      begin
        if @errors.empty?
          @status = :passed
          @sel.passed!
        else
          @status = :failed
          @sel.failed!
        end
        @sel.stop
      rescue ::Selenium::Client::CommandError => e
        @errors << {
          :cmd_num => 0,
          :command => {:ruby => ""},
          :error => e.message
        }
      rescue Timeout::Error => e
        @errors << {
          :cmd_num => 0,
          :command => {:ruby => ""},
          :error => "ERROR: Command timed out"
        }
      end
    end

    def get_cmd_num(trace)
      ev = trace.delete_if { |c| !(c =~ /\(eval\)/) }[0]
      return 0 unless ev
      ev.match(/:(\d+)/)[1].to_i
    end

    # Add the current command to the error list
    # with the given description
    def add_error_with_trace(desc, trace=caller)
      cmd_num = get_cmd_num(trace)
      @errors.push << { 
        :cmd_num => cmd_num,
        :command => @converter.commands[cmd_num-1],
        :error => desc 
      }
    end

    # Handle all the assert functions by just making the respective
    # verify call and throwing an exception to end the flow
    def method_missing(method, *args)
      if method.to_s =~ /^assert(.*)/
        raise AssertionError unless send "verify#{$1}".to_sym, *args
      end
    end

    def verify(expr)
      add_error_with_trace "ERROR: Command returned false, expecting true" unless expr
      return expr
    end

    def verify_not(expr)
      add_error_with_trace "ERROR: Command returned true, expecting false" if expr
      return !expr
    end

    def verify_equal(eq, expr)
      add_error_with_trace "ERROR: Command returned '#{expr}', expecting '#{eq}'" unless eq == expr
      return eq == expr
    end

    def verify_not_equal(eq, expr)
      add_error_with_trace "ERROR: Command returned '#{expr}', expecting anything but" unless eq != expr
      return eq != expr
    end
  end
end
