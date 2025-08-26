package mes.domain.em;

import java.util.Date;
import lombok.Data;

@Data
public class EquipCondBomAdmVo {

	private String menuAuth;             //메뉴권한	
	//시간, 온도, 압력
	private String equipCondSeq;         //설비코드 Seq
	private String warmupCond;           //예열조건
	private String warmupAlwncePlus;     //예열공차최대값
	private String warmupAlwnceMinus;    //예열공차최저값
	private String fitupCond;            //가접조건
	private String fitupAlwncePlus;      //가접공차최대값
	private String fitupAlwnceMinus;     //가접공차최저값
	private String firstCond;            //1차조건
	private String firstAlwncePlus;      //1차공차최대값
	private String firstAlwnceMinus;     //1차공차최저값
	private String secondCond;           //2차조건
	private String secondAlwncePlus;     //2차공차최대값
	private String secondAlwnceMinus;    //2차공차최저값
	private String jinjeopCond;          //진접조건
	private String jinjeopAlwncePlus;    //진접공차최대값
	private String jinjeopAlwnceMinus;   //진접공차최저값
	private String reformCond;           //리폼조건
	private String reformAlwncePlus;     //리폼공차최대값
	private String reformAlwnceMinus;    //리폼공차최저값
	
	//치수
	private String wpLeftCond;                    //Welding Park (좌) 조건
	private String wpLeftAlwncePlus;              //Welding Park (좌) 공차최대값
	private String wpLeftAlwnceMinus;             //Welding Park (좌) 공차최저값
	private String wpRightCond;                   //Welding Park (우) 조건
	private String wpRightAlwncePlus;             //Welding Park (우) 공차최대값
	private String wpRightAlwnceMinus;            //Welding Park (우) 공차최저값
	private String pitchLeftCond;                 //Pitch (좌) 조건
	private String pitchLeftAlwncePlus;           //Pitch (좌) 공차최대값
	private String pitchLeftAlwnceMinus;          //Pitch (좌) 공차최저값
	private String pitchRightCond;                //Pitch (우) 조건
	private String pitchRightAlwncePlus;          //Pitch (우) 공차최대값
	private String pitchRightAlwnceMinus;         //Pitch (우)공차최저값
	private String ppfWingLeftCond;               //P.P Film  날개 (좌) 조건
	private String ppfWingLeftAlwncePlus;         //P.P Film  날개 (좌) 공차최대값
	private String ppfWingLeftAlwnceMinus;        //P.P Film  날개 (좌) 공차최저값
	private String ppfWingRightCond;              //P.P Film  날개 (우) 조건
	private String ppfWingRightAlwncePlus;        //P.P Film  날개 (우) 공차최대값
	private String ppfWingRightAlwnceMinus;       //P.P Film  날개 (우) 공차최저값
	private String ppfDepthLeftCond;              //P.P Film  폭 (좌) 조건
	private String ppfDepthLeftAlwncePlus;        //P.P Film  폭 (좌) 공차최대값
	private String ppfDepthLeftAlwnceMinus;       //P.P Film  폭 (좌) 공차최저값
	private String ppfDepthRightCond;             //P.P Film  폭 (우) 조건
	private String ppfDepthRightAlwncePlus;       //P.P Film  폭 (우) 공차최대값
	private String ppfDepthRightAlwnceMinus;      //P.P Film  폭 (우) 공차최저값
	private String filmCond;                      //필름 조건
	private String filmAlwncePlus;                //필름 공차최대값
	private String filmAlwnceMinus;               //필름 공차최저값
	private String metalDepthCond;                //Metal(폭) 조건
	private String metalDepthAlwncePlus;          //Metal(폭) 공차최대값
	private String metalDepthAlwnceMinus;         //Metal(폭) 공차최저값
	private String metalThicknessCond;            //Metal(두께) 조건
	private String metalThicknessAlwncePlus;      //Metal(두께) 공차최대값
	private String metalThicknessAlwnceMinus;     //Metal(두께) 공차최저값
	private String thCenterCond;                  //총두께(Center) 조건
	private String thCenterAlwncePlus;            //총두께(Center) 공차최대값
	private String thCenterAlwnceMinus;           //총두께(Center) 공차최저값
	private String thEdgeCond;                    //총두께(Edge) 조건
	private String thEdgeAlwncePlus;              //총두께(Edge) 공차최대값
	private String thEdgeAlwnceMinus;             //총두께(Edge) 공차최저값
	private String burrCond;                      //BURR 조건
	private String burrAlwncePlus;                //BURR 공차최대값
	private String burrAlwnceMinus;               //BURR 공차최저값

	private String regId;                //등록자
	private Date regDate;                //등록일
	private String updId;                //수정자
	private Date updDate;                //수정일

}