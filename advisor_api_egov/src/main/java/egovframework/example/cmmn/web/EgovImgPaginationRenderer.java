/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.cmmn.web;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

/**
 * @Class Name : ImagePaginationRenderer.java
 * @Description : ImagePaginationRenderer Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class EgovImgPaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;
	
	private static final String IMAGE_TAG = "<image src='";
    private static final String ANCHOR_TAG = "<a href=\"#\" onclick=\"{0}({1}); return false;\">";
  


	public EgovImgPaginationRenderer() {
		// no-op
	}


    public void initVariables() {
        firstPageLabel = ANCHOR_TAG + IMAGE_TAG + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_pre10.gif";
        previousPageLabel = ANCHOR_TAG + IMAGE_TAG + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_pre1.gif' border=0/></a>&#160;";
        currentPageLabel = "<strong>{0}</strong>&#160;";
        otherPageLabel = ANCHOR_TAG + "{2}</a>&#160;";
        nextPageLabel = ANCHOR_TAG + IMAGE_TAG + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_next1.gif' border=0/></a>&#160;";
        lastPageLabel = ANCHOR_TAG + IMAGE_TAG + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_next10.gif' border=0/></a>&#160;";
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
        initVariables();
    }
}
