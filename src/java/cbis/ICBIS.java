/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cbis;

import javax.jws.WebMethod;
import javax.jws.WebService;

/**
 *
 * @author heyu
 */
@WebService(serviceName="CBISService")
public interface ICBIS {
    @WebMethod()
    String test();
}
