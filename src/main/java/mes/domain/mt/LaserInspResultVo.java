package mes.domain.mt;

import lombok.Data;

@Data
public class LaserInspResultVo {
	private String inspNo;
	private String inspType;
	private String workOrdNo;
	private String inspDatetime;
	private String inspCount;
	private String inspResult;
	private String inspPosMoveX;
	private String inspPosMoveY;
	private String inspResultCenterX;
	private String inspResultCenterY;
	private String inspResultSizeX;
	private String inspResultSizeY;
}