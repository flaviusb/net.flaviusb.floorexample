import org.bimserver.emf.IfcModelInterface
import org.bimserver.plugins.ModelHelper
import org.bimserver.plugins.Reporter
import org.bimserver.emf.IdEObject
import org.bimserver.emf.IfcModelInterfaceException
import mirah.lang.ast.Package
import mirah.lang.ast.SimpleString

macro def make_query(package_name:SimpleString, mvd_name, block_query)
  #pkg = package_name.string_value
  Package.new(package_name, quote {
    class `mvd_name`
      implements nz.ac.auckland.cs.QueryInterface

      def initialize()
        super()
      end
      
      def query(model: IfcModelInterface, reporter: Reporter, modelHelper: ModelHelper): IfcModelInterface
        return block_query(model, reporter, modelHelper)
      end
    end
  })
end

package net.flaviusb do
  class floorexample
    implements nz.ac.auckland.cs.QueryInterface

    def initialize()
      super()
    end
    
    def query(model: IfcModelInterface, reporter: Reporter, modelHelper: ModelHelper): IfcModelInterface
      return nil
    end
  end
end
