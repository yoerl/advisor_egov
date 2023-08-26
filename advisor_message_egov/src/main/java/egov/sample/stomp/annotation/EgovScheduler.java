package egov.sample.stomp.annotation;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.core.annotation.AliasFor;
import org.springframework.stereotype.Component;

/**
 * EgovScheduler 클래스
 * <Notice>
 * 	    스케줄러 구동용 어노테이션 정의 클래스 
 * <Disclaimer>
 *		N/A
 *
 * @author 신용호
 * @since 2022.05.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일         수정자            수정내용
 *  ----------   -------------   ----------------------
 *  2022.05.13   신용호            최초 생성
 * </pre>
 */

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Component
public @interface EgovScheduler {

	/**
	 * The value may indicate a suggestion for a logical component name,
	 * to be turned into a Spring bean in case of an autodetected component.
	 * @return the suggested component name, if any (or empty String otherwise)
	 */
	@AliasFor(annotation = Component.class)
	String value() default "";

}
