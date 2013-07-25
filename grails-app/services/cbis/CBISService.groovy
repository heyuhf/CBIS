package cbis

import org.codehaus.xfire.annotations.commons.WebService
import javax.jws.WebService

@WebService(endpointInterface="cbis.ICBIS")
class CBISService implements ICBIS{

    String test(){
        return "hello cbis!"
    }
    
}
