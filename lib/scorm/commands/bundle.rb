module Scorm::Command
  class Bundle < Base
    def index
      name = args.shift.strip rescue '.'
      unless File.exist?(File.join(File.expand_path(name), 'imsmanifest.xml'))
        raise(CommandFailed, "Invalid package, didn't find any imsmanifest.xml file.")
      end

      outname = File.basename(File.expand_path(name)) + '.zip'
      pkg     = Scorm::Package.create(outname, name)

      display "Created new SCORM package \"#{outname}\"."
    end
  end
end