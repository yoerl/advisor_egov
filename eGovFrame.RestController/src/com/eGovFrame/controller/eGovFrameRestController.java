package com.eGovFrame.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *  RestController Service 사용 정의
 * 
 * @author 신성학
 * @since 2015.06.15
 * @version 3.5
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *   
 *   수정일			수정자				수정내용
 *  ---------------------------------------------------------------------------------
 *   2015.06.15	      신성학	                    최초생성
 * 
 * </pre>
 */

/**
 * 
 * @RequestMapping = http://localhost:8080/eGovFrame.RestController/{name} 로  변수를 전달함.
 * @PathVariable = URL을 Mapping과정에 Path변수를 넣어서 파라미터로 사용
 * 
 * ***실행 ***
 * 1. Run on Servers - http://localhost:8080/eGovFrame.RestController/name
 * 2. name부분 임의로 수정하면 화면에 나타나는 name부분 변경됨.
 * ex)http://localhost:8080/eGovFrame.RestController/name
 *  -> http://localhost:8080/eGovFrame.RestController/eGovFramework
 *  화면ex) Hello eGovFramework!! name : name
 *       -> Hello eGovFramework!! name : eGovFramework
 */
@RestController
public class eGovFrameRestController {
	@RequestMapping(value = "{name}", method = RequestMethod.GET)
	public String sayHello(@PathVariable String name) {
		String result="Hello eGovFramework!! name : " + name;  
		return result;
	}
}
