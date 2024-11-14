package mes.domain.po;

import java.util.Date;
import lombok.Data;

@Data
public class EquipPrcssFaultyAdmVo {
	
	private String equipCd;             //설비코드
	private String faultyRegDate;       //불량등록일
	private String dayNightCd;          //주야간구분
	private String prcsPms;             //PMS
	private String prcsPfs;             //PFS
	private String prcsPstab;           //P찍힘
	private String prcsPaliensbst;      //P이물
	private String prcsPpolutn;         //P오염
	private String prcsGilt;            //도금바리
	private String prcsFbreak;          //F꺽임
	private String prcsFagglomt;        //F뭉침
	private String prcsFpress;          //F눌림
	private String prcsFtornout;        //F뜯김
	private String prcsTeflon;          //필름자국(테프론)
	private String prcsMargnDvat;       //마진편차
	private String prcsThickness;       //총두께(M+F)
	private String prcsSurfceBb;        //표면기포
	private String prcsEdgeBb;          //엣지기포
	private String prcsMburr;           //메탈-Burr
	private String prcsRburr;           //R-Burr
	private String prcsSize;            //치수
	private String prcsLayer;           //레이어
	private String prcsUnjinjeop;       //미진접
	private String prcsUnattch;         //미부착
	private String prcsFilmDepth;       //필름폭
	private String regId;               //등록자
	private String regDate;             //등록일
	private String updId;               //수정자
	private String updDate;             //수정일

}
