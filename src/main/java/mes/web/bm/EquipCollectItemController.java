
package mes.web.bm;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EquipCollectItemController {
	private static final Logger logger = LoggerFactory.getLogger(EquipCollectItemController.class);

	// 설비수집항목설정 페이지
	@RequestMapping(value = "/bmsc0230", method = RequestMethod.GET)
	public String equipCollectItemMain(Locale locale, Model model) throws Exception {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0230";
	}
}

