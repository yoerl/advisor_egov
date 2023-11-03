package egovframework.counseling.auth;


import egovframework.counseling.common.service.CommonService;
import egovframework.counseling.user.service.UserService;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ubintis.api.ApiUserService;
import com.ubintis.common.util.AddressUtil;
import com.ubintis.common.util.StrUtil;
import egovframework.counseling.common.service.impl.CommonVO;
import egovframework.counseling.remote.web.RemoteController;
import egovframework.counseling.user.service.impl.UserInfoVO;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;

public class AuthenticInterceptor implements HandlerInterceptor {

	private static final Logger logger = LogManager.getLogger(AuthenticInterceptor.class);

    @Resource(name = "userService")
    private UserService userService;

    @Resource(name = "commonService")
    private CommonService commonService;

    @Override 
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        String contextPath = request.getContextPath();
        HttpSession session = request.getSession();
        
        

      	logger.error("인터셉터 호출한 request  : "+ request.toString());
          
        
        
        String errorCode = "";
        String userData = "";
        String pniToken = StrUtil.NVL(request.getParameter("pni_token"));
        String localIp = "";
        if ("".equals(pniToken))
          pniToken = StrUtil.NVL(session.getAttribute("pni_token")); 
        if (!"".equals(pniToken)) {
          localIp = AddressUtil.getClientIp(request);
  
          ApiUserService service = new ApiUserService();
          errorCode = service.executeUserData(pniToken, localIp);
          if ("".equals(errorCode)) {
            userData = service.getUserData();
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(userData);
            try {
              UserInfoVO userInfo = new UserInfoVO();
              userInfo.setUserId(jsonNode.get("user_id").asText());
              List<UserInfoVO> userList = this.userService.selectUser(userInfo);
              session.setAttribute("advisor_user", ((UserInfoVO)userList.get(0)).toString());
              session.setAttribute("role_power", ((UserInfoVO)userList.get(0)).getRolePower().toString());
              CommonVO commonVO = new CommonVO();
              commonVO.setComnCd(((UserInfoVO)userList.get(0)).getUserDivCd());
              commonVO.setHgrnComnCd(((UserInfoVO)userList.get(0)).getInttCd());
              
          	logger.error("권한11111 : "+ commonVO.toString());
              
              List<CommonVO> authList = this.commonService.selectAuthMenu(commonVO);
          	logger.error("권한22222 : "+ authList.toString());
              
              
              session.setAttribute("intt_cd", ((UserInfoVO)userList.get(0)).getInttCd().toString());
              for (CommonVO authItem : authList) {
                session.setAttribute("menu_" + authItem.getComnCdVal(), authItem.getUseYn());
              } 
            } catch (NullPointerException  e) {
                // 예외 처리 로직 작성
            	logger.error("NullPointerException : "+ e, e.toString());
            } catch (Exception e) {
            	logger.error("SSO 유저 정보를 가져우는 중 에러 : " + e.toString(),e.toString());
            } 
          } else {
            String actionUrl = String.valueOf(contextPath) + "/SSOService.do";
            response.sendRedirect(actionUrl);
          } 
        } else {
          String actionUrl = String.valueOf(contextPath) + "/SSOService.do";
          response.sendRedirect(actionUrl);
        } 
        return true;

    }
}
