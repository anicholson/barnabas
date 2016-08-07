module Command
  class Base
    getter name, description

    def initialize(@name : String, @description : String, @proc : Proc(Array(String), RecipientRepository, Symbol))
    end

    def process(args, repository)
      proc.call(args, repository)
    end

    private getter proc
  end
end
