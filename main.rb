require "os"

class GUIFactory
    def createButton
        raise NotImplementedError, "cant implemented error"
    end

    def createCheckbox
        raise NotImplementedError, "cant implemented error"
    end
end

class AbstractButton
    def paint
        raise NotImplementedError, "cant implemented this method"
    end
end

class AbstractCheckbox
    def paint
        raise NotImplementedError, "cant implemented this method"
    end
end

class WinButton < AbstractButton
    def paint
        puts "draw button in screen WinButton"
    end
end

class WinCheckbox < AbstractCheckbox
    def paint
        puts "draw checkbox in screen WinButton"
    end
end

class WinFactory < GUIFactory
    def createButton
        WinButton.new
    end

    def createCheckbox
        WinCheckbox.new
    end
end

class MacButton < AbstractButton
    def paint
        puts "draw button in screen MacButton"
    end
end

class MacCheckbox < AbstractCheckbox
    def paint
        puts "draw checkbox in screen MacButton"
    end
end

class MacFactory < GUIFactory
    def createButton
        MacButton.new
    end

    def createCheckbox
        MacCheckbox.new
    end
end

class Application
    attr_accessor :factory, :button


    def initialize(factory)
        @factory = factory
    end

    def createUI
        @button = factory.createButton
    end

    def paint
        @button.paint
    end

    private :factory, :button 
end

class ApplicationConfigurator
    attr_accessor :factory

       def main_app
            if OS.windows?
                @factory = WinFactory.new
            elsif OS.mac?
                @factory = MacFactoy.new
            elsif OS.linux?
                @factory = MacFactoy.new
            else
                raise "Error! Unknown operating system"
            end

            app = Application.new(@factory)
            app.createUI
            app.paint
       end
end

appConfig = ApplicationConfigurator.new
appConfig.main_app



